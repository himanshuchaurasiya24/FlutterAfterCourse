import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
part 'database.g.dart';

class QuestionModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get question => text().named('question')();
  TextColumn get correctOption => text().named('correctOption')();
  TextColumn get secondOption => text().named('secondOption')();
  TextColumn get thirdOption => text().named('thirdOption')();
  TextColumn get fourthOption => text().named('fourthOption')();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(
      path.join(dbFolder.path, 'question.sqlite'),
    );
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [QuestionModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          _openConnection(),
        );
  @override
  int schemaVersion = 1;
  Future<List<QuestionModelData>> getQuestionModelList() async {
    return await select(questionModel).get();
  }

  Future<int> insertQuestionModel(
      QuestionModelCompanion questionModelCompanion) async {
    return await into(questionModel).insert(questionModelCompanion);
  }

  Future<bool> updateQuestionModel(QuestionModelData questionModelData) async {
    return await update(questionModel).replace(questionModelData);
  }

  Future<int> deleteQuestionModel(QuestionModelData questionModelData) async {
    return await delete(questionModel).delete(questionModelData);
  }

  Future<int> deleteAllQuestionModel() async {
    return await delete(questionModel).go();
  }
}
