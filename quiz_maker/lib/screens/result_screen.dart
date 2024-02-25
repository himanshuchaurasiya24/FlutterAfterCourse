import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_maker/database/database.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.givenAnswers});
  final List<String> givenAnswers;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late AppDatabase database;
  late List<QuestionModelData> questionData;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  @override
  void dispose() {
    correctAnswer = 0;
    wrongAnswer = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: FutureBuilder(
          future: _getQuestionList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Some error occured'),
              );
            }
            if (snapshot.hasData) {
              List<QuestionModelData>? questionData = snapshot.data;
              if (questionData != null) {
                if (questionData.isEmpty) {
                  return const Center(
                    child: Text('No question data fetched from the database'),
                  );
                } else {
                  for (int i = 0; i < questionData.length; i++) {
                    if (questionData[i].correctOption ==
                        widget.givenAnswers[i]) {
                      correctAnswer++;
                    } else if (questionData[i].correctOption !=
                        widget.givenAnswers[i]) {
                      wrongAnswer++;
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Correct answer: ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.green[200],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.green[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  correctAnswer.toString(),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Wrong answer: ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red[200],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.red[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  wrongAnswer.toString(),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: questionData.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.blue[200],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: const TextStyle(
                                              fontSize: 20,
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
                                          questionData[index].question,
                                          maxLines: 4,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.blue[200],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  questionData[index].correctOption ==
                                          widget.givenAnswers[index]
                                      ? Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.green[200],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                  child: Icon(Icons.check)),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                questionData[index]
                                                    .correctOption,
                                                maxLines: 4,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.green[200],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Center(
                                                      child: Icon(Icons.check)),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    questionData[index]
                                                        .correctOption,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color:
                                                            Colors.green[200],
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Center(
                                                      child: Text(
                                                    'X',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    widget.givenAnswers[index],
                                                    maxLines: 4,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.red[200],
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
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
              child: Text('normal'),
            );
          },
        ));
  }

  Future<List<QuestionModelData>> _getQuestionList() async {
    return await database.getQuestionModelList();
  }
}
