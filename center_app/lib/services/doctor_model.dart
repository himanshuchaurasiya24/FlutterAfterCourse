import 'package:drift/drift.dart';

class DoctorModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get doctorsIncentive => text().named('doctor_incentive')();
  TextColumn get doctorName => text().named('doctor_name')();
  TextColumn get doctorAddress => text().named('doctor_address')();
  TextColumn get doctorPhone => text().named('doctor_phone')();
}
