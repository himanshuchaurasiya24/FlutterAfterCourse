// comments here ...
import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';
import 'package:note_keeper/database/database.dart';
import 'package:note_keeper/screen/note_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  late AppDatabase database;
  late List<NoteData> noteList;

  @override
  Widget build(BuildContext context) {
    debugPrint('Build Context called');
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
      body: FutureBuilder<List<NoteData>>(
        future: _getNotesFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NoteData>? noteList = snapshot.data;
            if (noteList != null) {
              if (noteList.isEmpty) {
                return const Center(
                  child: Text('No note please add someting from the icon'),
                );
              } else {
                return noteListUI(noteList);
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _navigateToNoteDetailPage(
            'Add Note',
            const NoteCompanion(
              title: dr.Value(''),
              description: dr.Value(''),
              priority: dr.Value(null),
              color: dr.Value(null),
            ),
          );
        },
        label: const Text('Add Note'),
        icon: const Icon(Icons.add_outlined),
      ),
    );
  }

  _getPriority(int priority) {
    switch (priority) {
      case 1:
        return const Text(
          'Highest',
          style: TextStyle(
            color: Colors.red,
          ),
        );
      case 2:
        return const Text(
          'Medium',
          style: TextStyle(
            color: Colors.pink,
          ),
        );
      default:
        return const Text(
          'Low',
          style: TextStyle(
            color: Colors.green,
          ),
        );
    }
  }

  Future<List<NoteData>> _getNotesFromDatabase() async {
    return database.getNoteList();
  }

  _navigateToNoteDetailPage(String title, NoteCompanion noteCompanion) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NoteDetailPage(
            title: title,
            noteCompanion: noteCompanion,
          );
        },
      ),
    );
    if (result != null && result == true) {
      setState(() {});
    }
  }

  Widget noteListUI(List<NoteData> noteList) {
    return StaggeredGridView.countBuilder(
      itemCount: noteList.length,
      crossAxisCount: 4,
      itemBuilder: (context, index) {
        NoteData noteData = noteList[index];
        return InkWell(
          onTap: () {
            _navigateToNoteDetailPage(
              'Edit note',
              NoteCompanion(
                id: dr.Value(noteData.id),
                title: dr.Value(noteData.title),
                description: dr.Value(noteData.description),
                priority: dr.Value(noteData.priority),
                color: dr.Value(noteData.color),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      noteData.title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    // Text(
                    //   noteData.priority == null
                    //       ? 'No Priority'
                    //       : _getPriority(
                    //           noteData.priority!,
                    //         ),
                    //   style: TextStyle(
                    //     color: _getColor(noteData.priority),
                    //   ),
                    // ),
                    noteData.priority == null
                        ? const Text(
                            'No Priority',
                            style: TextStyle(color: Colors.green),
                          )
                        : _getPriority(noteData.priority!)
                  ],
                ),
                Text(
                  noteData.description,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '14/11/2023',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )
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

  _getColor(int? priority) {
    switch (priority) {
      case 1:
        Colors.red;
      case 2:
        Colors.yellow;
      case 3:
        Colors.green;
      default:
        Colors.green;
    }
  }
}
