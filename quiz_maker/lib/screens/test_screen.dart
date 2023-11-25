import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_maker/database/database.dart';
import 'package:quiz_maker/option_maker.dart';
import 'package:quiz_maker/screens/result_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
  }

  int counter = 0;

  late AppDatabase database;
  List<String> answers = [];
  List<String> options = [];

  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please start giving answers'),
      ),
      body: FutureBuilder(
        future: _getQuestionList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Some error occured, Please try again.'),
            );
          }
          if (snapshot.hasData) {
            List<QuestionModelData>? questionList = snapshot.data;
            if (questionList != null) {
              if (questionList.isEmpty) {
                return const Center(
                  child: Text(
                      'No question found, Please add something from the option'),
                );
              } else {
                List<String> optionUnshuffled = OptionMaker(answers: [
                  questionList[counter].correctOption,
                  questionList[counter].secondOption,
                  questionList[counter].thirdOption,
                  questionList[counter].fourthOption
                ]).getShuffledAnswers();
                options = optionUnshuffled;
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        '${counter + 1}. ${questionList[counter].question}',
                        style: const TextStyle(fontSize: 60),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                answers.add(options[index]);
                                if (counter < questionList.length - 1) {
                                  setState(() {
                                    counter++;
                                  });
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ResultScreen(
                                            givenAnswers: answers);
                                      },
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  options[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          }
          return const Center(
            child: Text('Normal'),
          );
        },
      ),
    );
  }

  List<String> shuffledAnswers(
      List<QuestionModelData> questionList, int index) {
    List<String> options = [];
    options.add(questionList[index].correctOption);
    options.add(questionList[index].secondOption);
    options.add(questionList[index].thirdOption);
    options.add(questionList[index].fourthOption);

    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }

  Future<List<QuestionModelData>> _getQuestionList() async {
    return await database.getQuestionModelList();
  }
}
