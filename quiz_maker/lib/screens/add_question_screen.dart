// comments here...

import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_maker/database/database.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  late AppDatabase database;
  TextEditingController _questionController = TextEditingController();
  TextEditingController _correctOptionController = TextEditingController();
  TextEditingController _secondOptionController = TextEditingController();
  TextEditingController _thirdOptionController = TextEditingController();
  TextEditingController _fourthOptionController = TextEditingController();
  Future<List<QuestionModelData>> _getQuestionModelList() async {
    return await database.getQuestionModelList();
  }

  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);
    return Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      // we use `builder` to obtain a new `BuildContext` that has access to the provider
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Question'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _questionController,
                    labelText: 'Enter Your Question',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: _correctOptionController,
                    labelText: 'Enter Your Correct Option',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: _secondOptionController,
                    labelText: 'Enter Your Second Option',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: _thirdOptionController,
                    labelText: 'Enter Your Third Option',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: _fourthOptionController,
                    labelText: 'Enter Your Fourth Option',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 70,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // save question here
                      },
                      child: const Text('Save Question'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void addQuestion() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final questionModel = QuestionModelCompanion(
        question: dr.Value(_questionController.text),
        correctOption: dr.Value(_correctOptionController.text),
        secondOption: dr.Value(_secondOptionController.text),
        thirdOption: dr.Value(_thirdOptionController.text),
        fourthOption: dr.Value(_fourthOptionController.text),
      );
      database.insertQuestionModel(questionModel);
    }
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.labelText,
    required this.controller,
    super.key,
  });
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(labelText),
      ),
    );
  }
}
