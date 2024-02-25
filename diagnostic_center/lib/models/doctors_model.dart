import 'package:drift/drift.dart';

class DoctorModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get doctorName => text().named('doctor_name')();
  TextColumn get doctorAddress => text().named('doctor_address')();
  TextColumn get doctorPhoneNumber => text().named('doctor_phone_number')();
  TextColumn get doctorIncentive => text().named('doctor_incentive')();
}
