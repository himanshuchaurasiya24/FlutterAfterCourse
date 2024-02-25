import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_maker/database/database.dart';
import 'package:quiz_maker/option_maker.dart';
import 'package:quiz_maker/screens/result_screen.dart';
import 'package:quiz_maker/utils/colors.dart';

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
  List<String> abcd = ['A', 'B', 'C', 'D'];
  List<Color> optionColor = [
    Colors.purple[200]!,
    Colors.indigo[300]!,
    Colors.yellow[900]!,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    var random = Random();
    int randomNumber = random.nextInt(3);
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
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Style.bgColor,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${counter + 1}',
                                style: const TextStyle(
                                  fontSize: 50,
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
                              questionList[counter].question,
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
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            randomNumber = random.nextInt(4);
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
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: optionColor[randomNumber],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            abcd[index],
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
                                          options[index],
                                          maxLines: 4,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blue[200],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
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
