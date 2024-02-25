import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQFLite {
  static Database? _database;

  static Future<Database> database() async {
    if (_database != null) {
      return _database!;
    }
    _database = await initWinDB();
    return _database!;
  }

  static Future<Database> initWinDB() async {
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
    _database = await _databaseFactory.openDatabase(path,
        options:
            OpenDatabaseOptions(onCreate: (Database db, int _) => _onCreate));

    return _database!;
    // sqfliteFfiInit();
    // final databaseFactory = databaseFactoryFfi;
    // return await databaseFactory.openDatabase(
    //   inMemoryDatabasePath,
    //   options: OpenDatabaseOptions(
    //     onCreate: _onCreate,
    //     version: 1,
    //   ),
    // );
  }

// based on what type of data you want to add your Table
  static Future<void> _onCreate(Database database, int version) async {
    final db = database;
    await db.execute(""" CREATE TABLE IF NOT EXISTS users(
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             name TEXT, 
             age INTEGER
            )
  """);
  }

  static Future<int> insertUser(String name, int age) async {
    final db = await SQFLite.database();
    final data = {'name': name, 'age': age};
    return db.insert('users', data);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await SQFLite.database();
    return await db.query('users');
  }

  static Future<int> deleteData(int id) async {
    final db = await initWinDB();
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  static Future<Map<String, dynamic>?> getSingleData(int id) async {
    final db = await SQFLite.database();
    List<Map<String, dynamic>> result =
        await db.query('users', where: 'id =?', whereArgs: [id], limit: 1);
    return result.isNotEmpty ? result.first : null;
  }

  static Future<int> updateData(int id, Map<String, dynamic> data) async {
    final db = await SQFLite.database();
    return await db.update('users', data, where: 'id = ?', whereArgs: [id]);
  }
}
