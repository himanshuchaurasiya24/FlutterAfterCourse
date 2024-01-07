import 'package:drift/drift.dart';

class CenterInformationModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get centerName => text().named('center_name')();
  TextColumn get centerAddress => text().named('center_address')();
  TextColumn get centerEmail => text().named('center_email')();
}
