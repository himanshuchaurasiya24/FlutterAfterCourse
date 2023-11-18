import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_maker/database/database.dart';
import 'package:quiz_maker/screens/add_question_screen.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class QuestionListScreen extends StatefulWidget {
  const QuestionListScreen({super.key});

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  late AppDatabase database;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddQuestionScreen(),
            ),
          );
        },
        label: const Text('Add Questions'),
      ),
      // body: FutureBuilder<List<QuestionModelData>>(
      //   future: _getQuestionModelList(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       List<QuestionModelData>? questionList = snapshot.data;
      //       if (questionList != null) {
      //         if (questionList.isEmpty) {
      //           return const Center(
      //             child: Text(
      //               'No Questions to display. Please add something from the button.',
      //               textAlign: TextAlign.center,
      //             ),
      //           );
      //         } else {
      //           // question list here...
      //           ListView.builder(
      //             itemCount: questionList.length,
      //             itemBuilder: (context, index) {
      //               return Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                   vertical: 8.0,
      //                   horizontal: 8.0,
      //                 ),
      //                 child: Card(
      //                   child: Column(
      //                     children: [
      //                       Text(
      //                         questionList[index].question,
      //                         style: const TextStyle(
      //                           fontSize: 24,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                       const SizedBox(
      //                         height: 10,
      //                       ),
      //                       Text(
      //                         questionList[index].correctOption,
      //                         style: const TextStyle(
      //                           fontSize: 16,
      //                         ),
      //                       ),
      //                       const SizedBox(
      //                         height: 10,
      //                       ),
      //                       Text(
      //                         questionList[index].secondOption,
      //                         style: const TextStyle(
      //                           fontSize: 16,
      //                         ),
      //                       ),
      //                       const SizedBox(
      //                         height: 10,
      //                       ),
      //                       Text(
      //                         questionList[index].thirdOption,
      //                         style: const TextStyle(
      //                           fontSize: 16,
      //                         ),
      //                       ),
      //                       const SizedBox(
      //                         height: 10,
      //                       ),
      //                       Text(
      //                         questionList[index].fourthOption,
      //                         style: const TextStyle(
      //                           fontSize: 16,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             },
      //           );
      //         }
      //       }
      //     }
      //     if (snapshot.hasData) {
      //       return Center(
      //         child: Text(
      //           snapshot.error.toString(),
      //         ),
      //       );
      //     }
      //     return const Center(
      //       child: Text('Click on the button to add question'),
      //     );
      //   },
      // ),
      body: FutureBuilder<List<QuestionModelData>>(
        future: _getQuestionModelList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QuestionModelData>? questionList = snapshot.data;
            if (questionList != null) {
              if (questionList.isEmpty) {
                return const Center(
                  child: Text('No question please add someting from the icon'),
                );
              } else {
                return questionListUI(questionList);
              }
            }
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          return Center(
            child: Text(
              'Click on Add Button to Add New Note',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        },
      ),
    );
  }

  Widget questionListUI(List<QuestionModelData> questionModelData) {
    return StaggeredGridView.countBuilder(
      itemCount: questionModelData.length,
      crossAxisCount: 4,
      itemBuilder: (context, index) {
        QuestionModelData questionModel = questionModelData[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Text(
                  questionModel.question,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  questionModel.correctOption,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  questionModel.secondOption,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  questionModel.thirdOption,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  questionModel.fourthOption,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
      staggeredTileBuilder: (index) {
        return const StaggeredTile.fit(2);
      },
    );
  }

  Future<List<QuestionModelData>> _getQuestionModelList() async {
    return await database.getQuestionModelList();
  }
}
