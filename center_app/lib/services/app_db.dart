import 'dart:io';

import 'package:center_app/services/diagnosis_model.dart';
import 'package:center_app/services/doctor_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'doctor.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [DoctorModel, DiagnosisModel])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  // get doctors list
  Future<List<DoctorModelData>> getDoctorsList() async {
    return await select(doctorModel).get();
  }

  // single doctor information;
  Future<DoctorModelData> getDoctorInformation(int id) async {
    return await (select(doctorModel)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // update doctor
  Future<bool> updateDoctorInformation(DoctorModelCompanion companion) async {
    return await update(doctorModel).replace(companion);
  }

  // insert doctor
  Future<int> insertDoctor(DoctorModelCompanion companion) async {
    return await into(doctorModel).insert(companion);
  }

  // delete doctor
  Future<int> deleteDoctor(int id) async {
    return await (delete(doctorModel)..where((tbl) => tbl.id.equals(id))).go();
  }
}
