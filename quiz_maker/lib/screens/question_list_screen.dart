import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_maker/database/database.dart';
import 'package:quiz_maker/screens/add_question_screen.dart';
import 'package:quiz_maker/screens/question_details_screen.dart';
import 'package:drift/drift.dart' as dr;
import 'package:quiz_maker/utils/colors.dart';

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
      backgroundColor: Style.bgColor,
      appBar: AppBar(
        backgroundColor: Style.bgColor,
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
          ).then((value) {
            debugPrint('mmmm $value');
            if (value != null) {
              setState(() {});
            }
          });
        },
        label: const Text('Add Questions'),
      ),
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
                // question list here...
                return ListView.builder(
                  itemCount: questionList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return QuestionDetailsScreen(
                                questionModelCompanion: QuestionModelCompanion(
                                  id: dr.Value(questionList[index].id),
                                  question:
                                      dr.Value(questionList[index].question),
                                  correctOption: dr.Value(
                                      questionList[index].correctOption),
                                  secondOption: dr.Value(
                                      questionList[index].secondOption),
                                  thirdOption:
                                      dr.Value(questionList[index].thirdOption),
                                  fourthOption: dr.Value(
                                    questionList[index].fourthOption,
                                  ),
                                ),
                              );
                            },
                          ),
                        ).then((value) {
                          debugPrint('jjj $value');
                          if (value != null) {
                            setState(() {});
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          fontSize: 32,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      questionList[index].question,
                                      maxLines: 4,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue[200],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.green[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'A',
                                        style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      questionList[index].correctOption,
                                      maxLines: 4,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.green[200]),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'B',
                                        style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      questionList[index].secondOption,
                                      maxLines: 4,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'C',
                                        style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      questionList[index].thirdOption,
                                      maxLines: 4,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'D',
                                        style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      questionList[index].fourthOption,
                                      maxLines: 4,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              // Text(
                              //   '${index + 1}. ${questionList[index].question}',
                              //   style: const TextStyle(
                              //     fontSize: 30,
                              //     color: Colors.blue,
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // Container(
                              //   margin: const EdgeInsets.only(left: 25),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         '${('a')}. ${questionList[index].correctOption}',
                              //         style: const TextStyle(
                              //           fontSize: 18,
                              //           color: Colors.green,
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         height: 10,
                              //       ),
                              //       Text(
                              //         '${('b')}. ${questionList[index].secondOption}',
                              //         style: const TextStyle(
                              //           fontSize: 18,
                              //           color: Colors.red,
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         height: 10,
                              //       ),
                              //       Text(
                              //         '${('c')}. ${questionList[index].thirdOption}',
                              //         style: const TextStyle(
                              //           fontSize: 18,
                              //           color: Colors.red,
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         height: 10,
                              //       ),
                              //       Text(
                              //         '${('d')}. ${questionList[index].fourthOption}',
                              //         style: const TextStyle(
                              //           fontSize: 18,
                              //           color: Colors.red,
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         height: 10,
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
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
          return const Center(
            child: Text(
              'Click on Add Button to Add New Note',
            ),
          );
        },
      ),
    );
  }

  Future<List<QuestionModelData>> _getQuestionModelList() async {
    return await database.getQuestionModelList();
  }
}
