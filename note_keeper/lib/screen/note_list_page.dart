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
  int axisCount = 2;
  List<Color> colors = const [
    Color(0xFFFFFFFF),
    Color(0xffF28B83),
    Color(0xFFFCBC05),
    Color(0xFFFFF476),
    Color(0xFFCBFF90),
    Color(0xFFA7FEEA),
    Color(0xFFE6C9A9),
    Color(0xFFE8EAEE),
    Color(0xFFA7FEEA),
    Color(0xFFCAF0F8)
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notes',
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (axisCount == 2) {
                axisCount = 4;
              } else {
                axisCount = 2;
              }
              setState(() {});
            },
            icon: Icon(
              axisCount == 2 ? Icons.list : Icons.grid_on,
              color: Colors.black,
            ),
          ),
        ],
      ),
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
              priority: dr.Value(0),
              color: dr.Value(0),
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
      case 2:
        return const Text(
          'Very High',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
        );
      case 1:
        return const Text(
          'High',
          style: TextStyle(
            fontSize: 16,
            color: Colors.orange,
          ),
        );
      case 0:
        return const Text(
          'Low',
          style: TextStyle(
            fontSize: 16,
            color: Colors.green,
          ),
        );
      default:
        return const Text(
          'Low',
          style: TextStyle(
            color: Colors.green,
            fontSize: 16,
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
              color: colors[noteData.color!],
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
                      noteData.date,
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
        return StaggeredTile.fit(axisCount);
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
