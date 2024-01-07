import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_login/SQLite/json.dart';

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
    final databsePath = await getDatabasesPath();
    final path = join(databsePath, databseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(user);
    });
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
