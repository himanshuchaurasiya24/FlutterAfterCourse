import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_maker/database/database.dart';
import 'package:quiz_maker/screens/question_list_screen.dart';
import 'package:quiz_maker/screens/test_screen.dart';
import 'package:quiz_maker/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<AppDatabase>(context);
    return Provider<AppDatabase>(
        create: (_) => AppDatabase(),
        // we use `builder` to obtain a new `BuildContext` that has access to the provider
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Style.bgColor,
            appBar: AppBar(
              backgroundColor: Style.bgColor,
              title: const Text(
                'Quiz List',
              ),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionListScreen(),
                  ),
                );
              },
              label: const Text('Show Questions'),
            ),
            body: Center(
              child: SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TestScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.question_answer),
                  label: const Text('Start Quiz'),
                ),
              ),
            ),
          );
        });

    // No longer throws

    //
  }
}
