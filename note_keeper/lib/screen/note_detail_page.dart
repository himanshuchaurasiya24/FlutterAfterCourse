import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';
import 'package:note_keeper/database/database.dart';
import 'package:provider/provider.dart';

class NoteDetailPage extends StatefulWidget {
  const NoteDetailPage(
      {required this.title, required this.noteCompanion, super.key});
  final String title;
  final NoteCompanion noteCompanion;

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late AppDatabase appDatabase;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  void initState() {
    _titleController.text = widget.noteCompanion.title.value;
    _descriptionController.text = widget.noteCompanion.description.value;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    // appDatabase.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appDatabase = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              _saveToDatabase();
            },
            icon: const Icon(Icons.save_outlined),
          ),
          if (widget.title != 'Add Note')
            IconButton(
              onPressed: () {
                _deleteFromDatabase();
              },
              icon: const Icon(Icons.delete_outlined),
            ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CustomTextFormField(
              textEditingController: _titleController,
              label: 'title',
              maxLength: 255,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              textEditingController: _descriptionController,
              label: 'description',
              maxLength: 255,
              maxLines: 8,
              minLines: 7,
            ),
          ],
        ),
      ),
    );
  }

  void _deleteFromDatabase() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Note'),
          content: const Text('Do you really want to delete this note?'),
          actions: [
            IconButton(
              onPressed: () {
                appDatabase
                    .deleteNote(
                  NoteData(
                      id: widget.noteCompanion.id.value,
                      title: widget.noteCompanion.title.value,
                      description: widget.noteCompanion.description.value,
                      priority: widget.noteCompanion.priority.value,
                      color: widget.noteCompanion.color.value),
                )
                    .then((value) {
                  Navigator.pop(context, true);
                });
              },
              icon: const Text('Delete'),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              icon: const Text('Cancel'),
            ),
          ],
        );
      },
    ).then((value) {
      Navigator.pop(context, value);
    });
  }

  void _saveToDatabase() {
    if (widget.noteCompanion.id.present) {
      appDatabase
          .updateNote(
        NoteData(
          id: widget.noteCompanion.id.value,
          title: _titleController.text,
          description: _descriptionController.text,
          color: widget.noteCompanion.color.value,
          priority: widget.noteCompanion.priority.value,
        ),
      )
          .then((value) {
        Navigator.pop(context, true);
      });
    } else {
      appDatabase
          .insertNote(
        NoteCompanion(
          title: dr.Value(_titleController.text),
          description: dr.Value(_descriptionController.text),
          color: dr.Value(widget.noteCompanion.color.value),
          priority: dr.Value(widget.noteCompanion.priority.value),
        ),
      )
          .then((value) {
        Navigator.pop(context, true);
      });
    }
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.label,
    required this.textEditingController,
    this.maxLength,
    this.maxLines,
    this.minLines,
    super.key,
  });
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final String label;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        label: Text(label, style: Theme.of(context).textTheme.bodyLarge),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
