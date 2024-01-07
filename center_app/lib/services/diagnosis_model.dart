import 'package:drift/drift.dart';

class DiagnosisModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get patientName => text().named('patient_name')();
  TextColumn get doctorName => text().named('doctor_name')();
  TextColumn get typeOfTest => text().named('type_of_test')();
  IntColumn get totalPrice => integer().named('total_price')();
  IntColumn get pricePaidByPatient =>
      integer().named('price_paid_by_patient')();
  IntColumn get discount => integer().named('discount')();
  IntColumn get doctorsIncentive => integer().named('doctor_incentive')();
  DateTimeColumn get dateOfTestDone => dateTime().named('date_of_test_done')();
}
