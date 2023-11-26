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
                  return Column(
                    children: [
                      Text(
                          'Number of correct answer: ${correctAnswer.toString()}'),
                      Text('Number of wrong answer: ${wrongAnswer.toString()}'),
                      Expanded(
                        child: ListView.builder(
                          itemCount: questionData.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${index + 1} ${questionData[index].question}',
                                    style: const TextStyle(
                                        fontSize: 60, color: Colors.blue),
                                  ),
                                  questionData[index].correctOption ==
                                          widget.givenAnswers[index]
                                      ? Text(
                                          questionData[index].correctOption,
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 35),
                                        )
                                      : Column(
                                          children: [
                                            Text(
                                              widget.givenAnswers[index],
                                              style: TextStyle(
                                                color: questionData[index]
                                                            .correctOption ==
                                                        widget
                                                            .givenAnswers[index]
                                                    ? Colors.green
                                                    : Colors.red,
                                                fontSize: 35,
                                              ),
                                            ),
                                            Text(
                                              questionData[index].correctOption,
                                              style: const TextStyle(
                                                  fontSize: 35,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
