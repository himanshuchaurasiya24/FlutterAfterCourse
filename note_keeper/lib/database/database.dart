import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text().named('description')();
  IntColumn get priority => integer().nullable()();
  IntColumn get color => integer().nullable()();
}

@DriftDatabase(tables: [Note])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'note.sqlite'));
    return NativeDatabase(file);
  });
}
