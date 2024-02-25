import 'dart:io';

import 'package:diagnostic_center/models/center_information_model.dart';
import 'package:diagnostic_center/models/diagnosis_model.dart';
import 'package:diagnostic_center/models/doctors_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(
      path.join(dbFolder.path, 'doctor.sqlite'),
    );
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [DoctorModel, DiagnosisModel, CenterInformationModel])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  Future<List<CenterInformationModelData>> getCenterInformationList() async {
    return await select(centerInformationModel).get();
  }

  Future<CenterInformationModelData> getCenterInformation() async {
    return await (select(centerInformationModel)
          ..where((tbl) => tbl.id.equals(0)))
        .getSingle();
  }

  Future<int> insertCenterInformation(
      CenterInformationModelCompanion companion) async {
    return await into(centerInformationModel).insert(companion);
  }

  Future<bool> updateCenterInformation(
      CenterInformationModelCompanion companion) async {
    return await update(centerInformationModel).replace(companion);
  }

  Future<List<DoctorModelData>> getDoctorList() async {
    return await select(doctorModel).get();
  }

  Future<DoctorModelData> getDoctorInformation(int id) async {
    return await (select(doctorModel)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateDoctorInformation(DoctorModelCompanion companion) async {
    return await update(doctorModel).replace(companion);
  }

  Future<int> insertDoctor(DoctorModelCompanion companion) async {
    return await into(doctorModel).insert(companion);
  }

  Future<int> deleteDoctor(int id) async {
    return await (delete(doctorModel)..where((tbl) => tbl.id.equals(id))).go();
  }
}
