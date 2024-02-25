import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_maker/database/database.dart';

class QuestionDetailsScreen extends StatefulWidget {
  const QuestionDetailsScreen({
    super.key,
    required this.questionModelCompanion,
  });
  final QuestionModelCompanion questionModelCompanion;

  @override
  State<QuestionDetailsScreen> createState() => _QuestionDetailsScreenState();
}

class _QuestionDetailsScreenState extends State<QuestionDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  late AppDatabase database;
  TextEditingController _questionController = TextEditingController();
  TextEditingController _correctOptionController = TextEditingController();
  TextEditingController _secondOptionController = TextEditingController();
  TextEditingController _thirdOptionController = TextEditingController();
  TextEditingController _fourthOptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    debugPrint(widget.questionModelCompanion.question.value);
    debugPrint(widget.questionModelCompanion.correctOption.value);
    debugPrint(widget.questionModelCompanion.secondOption.value);
    debugPrint(widget.questionModelCompanion.thirdOption.value);
    debugPrint(widget.questionModelCompanion.fourthOption.value);
    _questionController.text = widget.questionModelCompanion.question.value;
    _correctOptionController.text =
        widget.questionModelCompanion.correctOption.value;
    _secondOptionController.text =
        widget.questionModelCompanion.secondOption.value;
    _thirdOptionController.text =
        widget.questionModelCompanion.thirdOption.value;
    _fourthOptionController.text =
        widget.questionModelCompanion.fourthOption.value;
  }

  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Details'),
        actions: [
          IconButton(
            onPressed: () {
              //save or update here...
              updateQuestion();
            },
            icon: const Icon(Icons.update_outlined),
          ),
          IconButton(
            onPressed: () {
              //delete here...
              deleteQuestion();
            },
            icon: const Icon(
              Icons.delete_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteQuestion() {
    database
        .deleteQuestionModel(
      QuestionModelData(
        id: widget.questionModelCompanion.id.value,
        question: widget.questionModelCompanion.question.value,
        correctOption: widget.questionModelCompanion.correctOption.value,
        secondOption: widget.questionModelCompanion.secondOption.value,
        thirdOption: widget.questionModelCompanion.thirdOption.value,
        fourthOption: widget.questionModelCompanion.fourthOption.value,
      ),
    )
        .then((value) {
      debugPrint('delete $value');
      Navigator.pop(context, value);
    });
  }

  updateQuestion() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      database
          .updateQuestionModel(
        QuestionModelData(
          id: widget.questionModelCompanion.id.value,
          question: _questionController.text,
          correctOption: _correctOptionController.text,
          secondOption: _secondOptionController.text,
          thirdOption: _thirdOptionController.text,
          fourthOption: _fourthOptionController.text,
        ),
      )
          .then(
        (value) {
          debugPrint('update $value');
          Navigator.pop(context, value);
        },
      );
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
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(labelText),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return labelText;
        }
        return null;
      },
    );
  }
}
