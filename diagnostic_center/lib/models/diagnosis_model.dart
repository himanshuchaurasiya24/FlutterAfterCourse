import 'package:drift/drift.dart';

class DiagnosisModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get patientName => text().named('patient_name')();
  TextColumn get doctorName => text().named('doctor_name')();
  TextColumn get typeOfTest => text().named('type_of_test')();
  TextColumn get testRemark => text().named('test_remark')();
  TextColumn get totalPrice => text().named('total_price')();
  TextColumn get pricePaidByPatient => text().named('price_paid_by_patient')();
  TextColumn get discount => text().named('discount')();
  TextColumn get doctorIncentive => text().named('doctor_incentive')();
  DateTimeColumn get dateOfTestDone => dateTime().named('date_of_test_done')();
}
