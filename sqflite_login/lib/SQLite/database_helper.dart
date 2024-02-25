import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_login/SQLite/json.dart';

Database? _database;

class DatabaseHelper {
  final databseName = 'auth.db';

  String user = '''
CREATE TABLE IF NOT EXISTS users(
  userId INTEGER PRIMARY KEY AUTOINCREMENT,
  fullName TEXT,
  email TEXT,
  userName TEXT UNIQUE,
  password TEXT NOT NULL
)
''';
  Future<Database> initDB() async {
    DatabaseFactory _databaseFactory;
    String path = '';
    if (!kIsWeb && Platform.isWindows) {
      sqfliteFfiInit();
      _databaseFactory = databaseFactoryFfi;
      final Directory _directory = await getApplicationSupportDirectory();
      await _databaseFactory.setDatabasesPath(_directory.path);
      path = join(await _databaseFactory.getDatabasesPath(), "name.db");
    } else {
      _databaseFactory = databaseFactory;
      path = join(await _databaseFactory.getDatabasesPath(), "name.db");
    }
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(user);
      },
    );

    return _database!;
  }

  Future<bool> authenticate(Users user) async {
    final Database db = await initDB();
    final res = await db.rawQuery(
        "select * from users where userName = '${user.userName}' and password = '${user.password}'");
    if (res.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> createUser(Users user) async {
    final Database db = await initDB();
    return db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
