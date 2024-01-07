// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $DoctorModelTable extends DoctorModel
    with TableInfo<$DoctorModelTable, DoctorModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoctorModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _doctorNameMeta =
      const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
      'doctor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorAddressMeta =
      const VerificationMeta('doctorAddress');
  @override
  late final GeneratedColumn<String> doctorAddress = GeneratedColumn<String>(
      'doctor_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorPhoneNumberMeta =
      const VerificationMeta('doctorPhoneNumber');
  @override
  late final GeneratedColumn<String> doctorPhoneNumber =
      GeneratedColumn<String>('doctor_phone_number', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorIncentiveMeta =
      const VerificationMeta('doctorIncentive');
  @override
  late final GeneratedColumn<String> doctorIncentive = GeneratedColumn<String>(
      'doctor_incentive', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, doctorName, doctorAddress, doctorPhoneNumber, doctorIncentive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'doctor_model';
  @override
  VerificationContext validateIntegrity(Insertable<DoctorModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
          _doctorNameMeta,
          doctorName.isAcceptableOrUnknown(
              data['doctor_name']!, _doctorNameMeta));
    } else if (isInserting) {
      context.missing(_doctorNameMeta);
    }
    if (data.containsKey('doctor_address')) {
      context.handle(
          _doctorAddressMeta,
          doctorAddress.isAcceptableOrUnknown(
              data['doctor_address']!, _doctorAddressMeta));
    } else if (isInserting) {
      context.missing(_doctorAddressMeta);
    }
    if (data.containsKey('doctor_phone_number')) {
      context.handle(
          _doctorPhoneNumberMeta,
          doctorPhoneNumber.isAcceptableOrUnknown(
              data['doctor_phone_number']!, _doctorPhoneNumberMeta));
    } else if (isInserting) {
      context.missing(_doctorPhoneNumberMeta);
    }
    if (data.containsKey('doctor_incentive')) {
      context.handle(
          _doctorIncentiveMeta,
          doctorIncentive.isAcceptableOrUnknown(
              data['doctor_incentive']!, _doctorIncentiveMeta));
    } else if (isInserting) {
      context.missing(_doctorIncentiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoctorModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoctorModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      doctorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_name'])!,
      doctorAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_address'])!,
      doctorPhoneNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}doctor_phone_number'])!,
      doctorIncentive: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}doctor_incentive'])!,
    );
  }

  @override
  $DoctorModelTable createAlias(String alias) {
    return $DoctorModelTable(attachedDatabase, alias);
  }
}

class DoctorModelData extends DataClass implements Insertable<DoctorModelData> {
  final int id;
  final String doctorName;
  final String doctorAddress;
  final String doctorPhoneNumber;
  final String doctorIncentive;
  const DoctorModelData(
      {required this.id,
      required this.doctorName,
      required this.doctorAddress,
      required this.doctorPhoneNumber,
      required this.doctorIncentive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['doctor_name'] = Variable<String>(doctorName);
    map['doctor_address'] = Variable<String>(doctorAddress);
    map['doctor_phone_number'] = Variable<String>(doctorPhoneNumber);
    map['doctor_incentive'] = Variable<String>(doctorIncentive);
    return map;
  }

  DoctorModelCompanion toCompanion(bool nullToAbsent) {
    return DoctorModelCompanion(
      id: Value(id),
      doctorName: Value(doctorName),
      doctorAddress: Value(doctorAddress),
      doctorPhoneNumber: Value(doctorPhoneNumber),
      doctorIncentive: Value(doctorIncentive),
    );
  }

  factory DoctorModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoctorModelData(
      id: serializer.fromJson<int>(json['id']),
      doctorName: serializer.fromJson<String>(json['doctorName']),
      doctorAddress: serializer.fromJson<String>(json['doctorAddress']),
      doctorPhoneNumber: serializer.fromJson<String>(json['doctorPhoneNumber']),
      doctorIncentive: serializer.fromJson<String>(json['doctorIncentive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'doctorName': serializer.toJson<String>(doctorName),
      'doctorAddress': serializer.toJson<String>(doctorAddress),
      'doctorPhoneNumber': serializer.toJson<String>(doctorPhoneNumber),
      'doctorIncentive': serializer.toJson<String>(doctorIncentive),
    };
  }

  DoctorModelData copyWith(
          {int? id,
          String? doctorName,
          String? doctorAddress,
          String? doctorPhoneNumber,
          String? doctorIncentive}) =>
      DoctorModelData(
        id: id ?? this.id,
        doctorName: doctorName ?? this.doctorName,
        doctorAddress: doctorAddress ?? this.doctorAddress,
        doctorPhoneNumber: doctorPhoneNumber ?? this.doctorPhoneNumber,
        doctorIncentive: doctorIncentive ?? this.doctorIncentive,
      );
  @override
  String toString() {
    return (StringBuffer('DoctorModelData(')
          ..write('id: $id, ')
          ..write('doctorName: $doctorName, ')
          ..write('doctorAddress: $doctorAddress, ')
          ..write('doctorPhoneNumber: $doctorPhoneNumber, ')
          ..write('doctorIncentive: $doctorIncentive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, doctorName, doctorAddress, doctorPhoneNumber, doctorIncentive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorModelData &&
          other.id == this.id &&
          other.doctorName == this.doctorName &&
          other.doctorAddress == this.doctorAddress &&
          other.doctorPhoneNumber == this.doctorPhoneNumber &&
          other.doctorIncentive == this.doctorIncentive);
}

class DoctorModelCompanion extends UpdateCompanion<DoctorModelData> {
  final Value<int> id;
  final Value<String> doctorName;
  final Value<String> doctorAddress;
  final Value<String> doctorPhoneNumber;
  final Value<String> doctorIncentive;
  const DoctorModelCompanion({
    this.id = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.doctorAddress = const Value.absent(),
    this.doctorPhoneNumber = const Value.absent(),
    this.doctorIncentive = const Value.absent(),
  });
  DoctorModelCompanion.insert({
    this.id = const Value.absent(),
    required String doctorName,
    required String doctorAddress,
    required String doctorPhoneNumber,
    required String doctorIncentive,
  })  : doctorName = Value(doctorName),
        doctorAddress = Value(doctorAddress),
        doctorPhoneNumber = Value(doctorPhoneNumber),
        doctorIncentive = Value(doctorIncentive);
  static Insertable<DoctorModelData> custom({
    Expression<int>? id,
    Expression<String>? doctorName,
    Expression<String>? doctorAddress,
    Expression<String>? doctorPhoneNumber,
    Expression<String>? doctorIncentive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (doctorName != null) 'doctor_name': doctorName,
      if (doctorAddress != null) 'doctor_address': doctorAddress,
      if (doctorPhoneNumber != null) 'doctor_phone_number': doctorPhoneNumber,
      if (doctorIncentive != null) 'doctor_incentive': doctorIncentive,
    });
  }

  DoctorModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? doctorName,
      Value<String>? doctorAddress,
      Value<String>? doctorPhoneNumber,
      Value<String>? doctorIncentive}) {
    return DoctorModelCompanion(
      id: id ?? this.id,
      doctorName: doctorName ?? this.doctorName,
      doctorAddress: doctorAddress ?? this.doctorAddress,
      doctorPhoneNumber: doctorPhoneNumber ?? this.doctorPhoneNumber,
      doctorIncentive: doctorIncentive ?? this.doctorIncentive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (doctorAddress.present) {
      map['doctor_address'] = Variable<String>(doctorAddress.value);
    }
    if (doctorPhoneNumber.present) {
      map['doctor_phone_number'] = Variable<String>(doctorPhoneNumber.value);
    }
    if (doctorIncentive.present) {
      map['doctor_incentive'] = Variable<String>(doctorIncentive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorModelCompanion(')
          ..write('id: $id, ')
          ..write('doctorName: $doctorName, ')
          ..write('doctorAddress: $doctorAddress, ')
          ..write('doctorPhoneNumber: $doctorPhoneNumber, ')
          ..write('doctorIncentive: $doctorIncentive')
          ..write(')'))
        .toString();
  }
}

class $DiagnosisModelTable extends DiagnosisModel
    with TableInfo<$DiagnosisModelTable, DiagnosisModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiagnosisModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patientNameMeta =
      const VerificationMeta('patientName');
  @override
  late final GeneratedColumn<String> patientName = GeneratedColumn<String>(
      'patient_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorNameMeta =
      const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
      'doctor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeOfTestMeta =
      const VerificationMeta('typeOfTest');
  @override
  late final GeneratedColumn<String> typeOfTest = GeneratedColumn<String>(
      'type_of_test', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _testRemarkMeta =
      const VerificationMeta('testRemark');
  @override
  late final GeneratedColumn<String> testRemark = GeneratedColumn<String>(
      'test_remark', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<String> totalPrice = GeneratedColumn<String>(
      'total_price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pricePaidByPatientMeta =
      const VerificationMeta('pricePaidByPatient');
  @override
  late final GeneratedColumn<String> pricePaidByPatient =
      GeneratedColumn<String>('price_paid_by_patient', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<String> discount = GeneratedColumn<String>(
      'discount', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doctorIncentiveMeta =
      const VerificationMeta('doctorIncentive');
  @override
  late final GeneratedColumn<String> doctorIncentive = GeneratedColumn<String>(
      'doctor_incentive', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateOfTestDoneMeta =
      const VerificationMeta('dateOfTestDone');
  @override
  late final GeneratedColumn<DateTime> dateOfTestDone =
      GeneratedColumn<DateTime>('date_of_test_done', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientName,
        doctorName,
        typeOfTest,
        testRemark,
        totalPrice,
        pricePaidByPatient,
        discount,
        doctorIncentive,
        dateOfTestDone
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diagnosis_model';
  @override
  VerificationContext validateIntegrity(Insertable<DiagnosisModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_name')) {
      context.handle(
          _patientNameMeta,
          patientName.isAcceptableOrUnknown(
              data['patient_name']!, _patientNameMeta));
    } else if (isInserting) {
      context.missing(_patientNameMeta);
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
          _doctorNameMeta,
          doctorName.isAcceptableOrUnknown(
              data['doctor_name']!, _doctorNameMeta));
    } else if (isInserting) {
      context.missing(_doctorNameMeta);
    }
    if (data.containsKey('type_of_test')) {
      context.handle(
          _typeOfTestMeta,
          typeOfTest.isAcceptableOrUnknown(
              data['type_of_test']!, _typeOfTestMeta));
    } else if (isInserting) {
      context.missing(_typeOfTestMeta);
    }
    if (data.containsKey('test_remark')) {
      context.handle(
          _testRemarkMeta,
          testRemark.isAcceptableOrUnknown(
              data['test_remark']!, _testRemarkMeta));
    } else if (isInserting) {
      context.missing(_testRemarkMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('price_paid_by_patient')) {
      context.handle(
          _pricePaidByPatientMeta,
          pricePaidByPatient.isAcceptableOrUnknown(
              data['price_paid_by_patient']!, _pricePaidByPatientMeta));
    } else if (isInserting) {
      context.missing(_pricePaidByPatientMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    } else if (isInserting) {
      context.missing(_discountMeta);
    }
    if (data.containsKey('doctor_incentive')) {
      context.handle(
          _doctorIncentiveMeta,
          doctorIncentive.isAcceptableOrUnknown(
              data['doctor_incentive']!, _doctorIncentiveMeta));
    } else if (isInserting) {
      context.missing(_doctorIncentiveMeta);
    }
    if (data.containsKey('date_of_test_done')) {
      context.handle(
          _dateOfTestDoneMeta,
          dateOfTestDone.isAcceptableOrUnknown(
              data['date_of_test_done']!, _dateOfTestDoneMeta));
    } else if (isInserting) {
      context.missing(_dateOfTestDoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiagnosisModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiagnosisModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patientName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_name'])!,
      doctorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_name'])!,
      typeOfTest: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_of_test'])!,
      testRemark: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}test_remark'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}total_price'])!,
      pricePaidByPatient: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}price_paid_by_patient'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount'])!,
      doctorIncentive: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}doctor_incentive'])!,
      dateOfTestDone: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_test_done'])!,
    );
  }

  @override
  $DiagnosisModelTable createAlias(String alias) {
    return $DiagnosisModelTable(attachedDatabase, alias);
  }
}

class DiagnosisModelData extends DataClass
    implements Insertable<DiagnosisModelData> {
  final int id;
  final String patientName;
  final String doctorName;
  final String typeOfTest;
  final String testRemark;
  final String totalPrice;
  final String pricePaidByPatient;
  final String discount;
  final String doctorIncentive;
  final DateTime dateOfTestDone;
  const DiagnosisModelData(
      {required this.id,
      required this.patientName,
      required this.doctorName,
      required this.typeOfTest,
      required this.testRemark,
      required this.totalPrice,
      required this.pricePaidByPatient,
      required this.discount,
      required this.doctorIncentive,
      required this.dateOfTestDone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_name'] = Variable<String>(patientName);
    map['doctor_name'] = Variable<String>(doctorName);
    map['type_of_test'] = Variable<String>(typeOfTest);
    map['test_remark'] = Variable<String>(testRemark);
    map['total_price'] = Variable<String>(totalPrice);
    map['price_paid_by_patient'] = Variable<String>(pricePaidByPatient);
    map['discount'] = Variable<String>(discount);
    map['doctor_incentive'] = Variable<String>(doctorIncentive);
    map['date_of_test_done'] = Variable<DateTime>(dateOfTestDone);
    return map;
  }

  DiagnosisModelCompanion toCompanion(bool nullToAbsent) {
    return DiagnosisModelCompanion(
      id: Value(id),
      patientName: Value(patientName),
      doctorName: Value(doctorName),
      typeOfTest: Value(typeOfTest),
      testRemark: Value(testRemark),
      totalPrice: Value(totalPrice),
      pricePaidByPatient: Value(pricePaidByPatient),
      discount: Value(discount),
      doctorIncentive: Value(doctorIncentive),
      dateOfTestDone: Value(dateOfTestDone),
    );
  }

  factory DiagnosisModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiagnosisModelData(
      id: serializer.fromJson<int>(json['id']),
      patientName: serializer.fromJson<String>(json['patientName']),
      doctorName: serializer.fromJson<String>(json['doctorName']),
      typeOfTest: serializer.fromJson<String>(json['typeOfTest']),
      testRemark: serializer.fromJson<String>(json['testRemark']),
      totalPrice: serializer.fromJson<String>(json['totalPrice']),
      pricePaidByPatient:
          serializer.fromJson<String>(json['pricePaidByPatient']),
      discount: serializer.fromJson<String>(json['discount']),
      doctorIncentive: serializer.fromJson<String>(json['doctorIncentive']),
      dateOfTestDone: serializer.fromJson<DateTime>(json['dateOfTestDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientName': serializer.toJson<String>(patientName),
      'doctorName': serializer.toJson<String>(doctorName),
      'typeOfTest': serializer.toJson<String>(typeOfTest),
      'testRemark': serializer.toJson<String>(testRemark),
      'totalPrice': serializer.toJson<String>(totalPrice),
      'pricePaidByPatient': serializer.toJson<String>(pricePaidByPatient),
      'discount': serializer.toJson<String>(discount),
      'doctorIncentive': serializer.toJson<String>(doctorIncentive),
      'dateOfTestDone': serializer.toJson<DateTime>(dateOfTestDone),
    };
  }

  DiagnosisModelData copyWith(
          {int? id,
          String? patientName,
          String? doctorName,
          String? typeOfTest,
          String? testRemark,
          String? totalPrice,
          String? pricePaidByPatient,
          String? discount,
          String? doctorIncentive,
          DateTime? dateOfTestDone}) =>
      DiagnosisModelData(
        id: id ?? this.id,
        patientName: patientName ?? this.patientName,
        doctorName: doctorName ?? this.doctorName,
        typeOfTest: typeOfTest ?? this.typeOfTest,
        testRemark: testRemark ?? this.testRemark,
        totalPrice: totalPrice ?? this.totalPrice,
        pricePaidByPatient: pricePaidByPatient ?? this.pricePaidByPatient,
        discount: discount ?? this.discount,
        doctorIncentive: doctorIncentive ?? this.doctorIncentive,
        dateOfTestDone: dateOfTestDone ?? this.dateOfTestDone,
      );
  @override
  String toString() {
    return (StringBuffer('DiagnosisModelData(')
          ..write('id: $id, ')
          ..write('patientName: $patientName, ')
          ..write('doctorName: $doctorName, ')
          ..write('typeOfTest: $typeOfTest, ')
          ..write('testRemark: $testRemark, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('pricePaidByPatient: $pricePaidByPatient, ')
          ..write('discount: $discount, ')
          ..write('doctorIncentive: $doctorIncentive, ')
          ..write('dateOfTestDone: $dateOfTestDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      patientName,
      doctorName,
      typeOfTest,
      testRemark,
      totalPrice,
      pricePaidByPatient,
      discount,
      doctorIncentive,
      dateOfTestDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiagnosisModelData &&
          other.id == this.id &&
          other.patientName == this.patientName &&
          other.doctorName == this.doctorName &&
          other.typeOfTest == this.typeOfTest &&
          other.testRemark == this.testRemark &&
          other.totalPrice == this.totalPrice &&
          other.pricePaidByPatient == this.pricePaidByPatient &&
          other.discount == this.discount &&
          other.doctorIncentive == this.doctorIncentive &&
          other.dateOfTestDone == this.dateOfTestDone);
}

class DiagnosisModelCompanion extends UpdateCompanion<DiagnosisModelData> {
  final Value<int> id;
  final Value<String> patientName;
  final Value<String> doctorName;
  final Value<String> typeOfTest;
  final Value<String> testRemark;
  final Value<String> totalPrice;
  final Value<String> pricePaidByPatient;
  final Value<String> discount;
  final Value<String> doctorIncentive;
  final Value<DateTime> dateOfTestDone;
  const DiagnosisModelCompanion({
    this.id = const Value.absent(),
    this.patientName = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.typeOfTest = const Value.absent(),
    this.testRemark = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.pricePaidByPatient = const Value.absent(),
    this.discount = const Value.absent(),
    this.doctorIncentive = const Value.absent(),
    this.dateOfTestDone = const Value.absent(),
  });
  DiagnosisModelCompanion.insert({
    this.id = const Value.absent(),
    required String patientName,
    required String doctorName,
    required String typeOfTest,
    required String testRemark,
    required String totalPrice,
    required String pricePaidByPatient,
    required String discount,
    required String doctorIncentive,
    required DateTime dateOfTestDone,
  })  : patientName = Value(patientName),
        doctorName = Value(doctorName),
        typeOfTest = Value(typeOfTest),
        testRemark = Value(testRemark),
        totalPrice = Value(totalPrice),
        pricePaidByPatient = Value(pricePaidByPatient),
        discount = Value(discount),
        doctorIncentive = Value(doctorIncentive),
        dateOfTestDone = Value(dateOfTestDone);
  static Insertable<DiagnosisModelData> custom({
    Expression<int>? id,
    Expression<String>? patientName,
    Expression<String>? doctorName,
    Expression<String>? typeOfTest,
    Expression<String>? testRemark,
    Expression<String>? totalPrice,
    Expression<String>? pricePaidByPatient,
    Expression<String>? discount,
    Expression<String>? doctorIncentive,
    Expression<DateTime>? dateOfTestDone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientName != null) 'patient_name': patientName,
      if (doctorName != null) 'doctor_name': doctorName,
      if (typeOfTest != null) 'type_of_test': typeOfTest,
      if (testRemark != null) 'test_remark': testRemark,
      if (totalPrice != null) 'total_price': totalPrice,
      if (pricePaidByPatient != null)
        'price_paid_by_patient': pricePaidByPatient,
      if (discount != null) 'discount': discount,
      if (doctorIncentive != null) 'doctor_incentive': doctorIncentive,
      if (dateOfTestDone != null) 'date_of_test_done': dateOfTestDone,
    });
  }

  DiagnosisModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? patientName,
      Value<String>? doctorName,
      Value<String>? typeOfTest,
      Value<String>? testRemark,
      Value<String>? totalPrice,
      Value<String>? pricePaidByPatient,
      Value<String>? discount,
      Value<String>? doctorIncentive,
      Value<DateTime>? dateOfTestDone}) {
    return DiagnosisModelCompanion(
      id: id ?? this.id,
      patientName: patientName ?? this.patientName,
      doctorName: doctorName ?? this.doctorName,
      typeOfTest: typeOfTest ?? this.typeOfTest,
      testRemark: testRemark ?? this.testRemark,
      totalPrice: totalPrice ?? this.totalPrice,
      pricePaidByPatient: pricePaidByPatient ?? this.pricePaidByPatient,
      discount: discount ?? this.discount,
      doctorIncentive: doctorIncentive ?? this.doctorIncentive,
      dateOfTestDone: dateOfTestDone ?? this.dateOfTestDone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientName.present) {
      map['patient_name'] = Variable<String>(patientName.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (typeOfTest.present) {
      map['type_of_test'] = Variable<String>(typeOfTest.value);
    }
    if (testRemark.present) {
      map['test_remark'] = Variable<String>(testRemark.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<String>(totalPrice.value);
    }
    if (pricePaidByPatient.present) {
      map['price_paid_by_patient'] = Variable<String>(pricePaidByPatient.value);
    }
    if (discount.present) {
      map['discount'] = Variable<String>(discount.value);
    }
    if (doctorIncentive.present) {
      map['doctor_incentive'] = Variable<String>(doctorIncentive.value);
    }
    if (dateOfTestDone.present) {
      map['date_of_test_done'] = Variable<DateTime>(dateOfTestDone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiagnosisModelCompanion(')
          ..write('id: $id, ')
          ..write('patientName: $patientName, ')
          ..write('doctorName: $doctorName, ')
          ..write('typeOfTest: $typeOfTest, ')
          ..write('testRemark: $testRemark, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('pricePaidByPatient: $pricePaidByPatient, ')
          ..write('discount: $discount, ')
          ..write('doctorIncentive: $doctorIncentive, ')
          ..write('dateOfTestDone: $dateOfTestDone')
          ..write(')'))
        .toString();
  }
}

class $CenterInformationModelTable extends CenterInformationModel
    with TableInfo<$CenterInformationModelTable, CenterInformationModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CenterInformationModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _centerNameMeta =
      const VerificationMeta('centerName');
  @override
  late final GeneratedColumn<String> centerName = GeneratedColumn<String>(
      'center_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerAddressMeta =
      const VerificationMeta('centerAddress');
  @override
  late final GeneratedColumn<String> centerAddress = GeneratedColumn<String>(
      'center_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerEmailMeta =
      const VerificationMeta('centerEmail');
  @override
  late final GeneratedColumn<String> centerEmail = GeneratedColumn<String>(
      'center_email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, centerName, centerAddress, centerEmail];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'center_information_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<CenterInformationModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('center_name')) {
      context.handle(
          _centerNameMeta,
          centerName.isAcceptableOrUnknown(
              data['center_name']!, _centerNameMeta));
    } else if (isInserting) {
      context.missing(_centerNameMeta);
    }
    if (data.containsKey('center_address')) {
      context.handle(
          _centerAddressMeta,
          centerAddress.isAcceptableOrUnknown(
              data['center_address']!, _centerAddressMeta));
    } else if (isInserting) {
      context.missing(_centerAddressMeta);
    }
    if (data.containsKey('center_email')) {
      context.handle(
          _centerEmailMeta,
          centerEmail.isAcceptableOrUnknown(
              data['center_email']!, _centerEmailMeta));
    } else if (isInserting) {
      context.missing(_centerEmailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CenterInformationModelData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CenterInformationModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      centerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_name'])!,
      centerAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_address'])!,
      centerEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_email'])!,
    );
  }

  @override
  $CenterInformationModelTable createAlias(String alias) {
    return $CenterInformationModelTable(attachedDatabase, alias);
  }
}

class CenterInformationModelData extends DataClass
    implements Insertable<CenterInformationModelData> {
  final int id;
  final String centerName;
  final String centerAddress;
  final String centerEmail;
  const CenterInformationModelData(
      {required this.id,
      required this.centerName,
      required this.centerAddress,
      required this.centerEmail});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['center_name'] = Variable<String>(centerName);
    map['center_address'] = Variable<String>(centerAddress);
    map['center_email'] = Variable<String>(centerEmail);
    return map;
  }

  CenterInformationModelCompanion toCompanion(bool nullToAbsent) {
    return CenterInformationModelCompanion(
      id: Value(id),
      centerName: Value(centerName),
      centerAddress: Value(centerAddress),
      centerEmail: Value(centerEmail),
    );
  }

  factory CenterInformationModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CenterInformationModelData(
      id: serializer.fromJson<int>(json['id']),
      centerName: serializer.fromJson<String>(json['centerName']),
      centerAddress: serializer.fromJson<String>(json['centerAddress']),
      centerEmail: serializer.fromJson<String>(json['centerEmail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'centerName': serializer.toJson<String>(centerName),
      'centerAddress': serializer.toJson<String>(centerAddress),
      'centerEmail': serializer.toJson<String>(centerEmail),
    };
  }

  CenterInformationModelData copyWith(
          {int? id,
          String? centerName,
          String? centerAddress,
          String? centerEmail}) =>
      CenterInformationModelData(
        id: id ?? this.id,
        centerName: centerName ?? this.centerName,
        centerAddress: centerAddress ?? this.centerAddress,
        centerEmail: centerEmail ?? this.centerEmail,
      );
  @override
  String toString() {
    return (StringBuffer('CenterInformationModelData(')
          ..write('id: $id, ')
          ..write('centerName: $centerName, ')
          ..write('centerAddress: $centerAddress, ')
          ..write('centerEmail: $centerEmail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, centerName, centerAddress, centerEmail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CenterInformationModelData &&
          other.id == this.id &&
          other.centerName == this.centerName &&
          other.centerAddress == this.centerAddress &&
          other.centerEmail == this.centerEmail);
}

class CenterInformationModelCompanion
    extends UpdateCompanion<CenterInformationModelData> {
  final Value<int> id;
  final Value<String> centerName;
  final Value<String> centerAddress;
  final Value<String> centerEmail;
  const CenterInformationModelCompanion({
    this.id = const Value.absent(),
    this.centerName = const Value.absent(),
    this.centerAddress = const Value.absent(),
    this.centerEmail = const Value.absent(),
  });
  CenterInformationModelCompanion.insert({
    this.id = const Value.absent(),
    required String centerName,
    required String centerAddress,
    required String centerEmail,
  })  : centerName = Value(centerName),
        centerAddress = Value(centerAddress),
        centerEmail = Value(centerEmail);
  static Insertable<CenterInformationModelData> custom({
    Expression<int>? id,
    Expression<String>? centerName,
    Expression<String>? centerAddress,
    Expression<String>? centerEmail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (centerName != null) 'center_name': centerName,
      if (centerAddress != null) 'center_address': centerAddress,
      if (centerEmail != null) 'center_email': centerEmail,
    });
  }

  CenterInformationModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? centerName,
      Value<String>? centerAddress,
      Value<String>? centerEmail}) {
    return CenterInformationModelCompanion(
      id: id ?? this.id,
      centerName: centerName ?? this.centerName,
      centerAddress: centerAddress ?? this.centerAddress,
      centerEmail: centerEmail ?? this.centerEmail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (centerName.present) {
      map['center_name'] = Variable<String>(centerName.value);
    }
    if (centerAddress.present) {
      map['center_address'] = Variable<String>(centerAddress.value);
    }
    if (centerEmail.present) {
      map['center_email'] = Variable<String>(centerEmail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CenterInformationModelCompanion(')
          ..write('id: $id, ')
          ..write('centerName: $centerName, ')
          ..write('centerAddress: $centerAddress, ')
          ..write('centerEmail: $centerEmail')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $DoctorModelTable doctorModel = $DoctorModelTable(this);
  late final $DiagnosisModelTable diagnosisModel = $DiagnosisModelTable(this);
  late final $CenterInformationModelTable centerInformationModel =
      $CenterInformationModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [doctorModel, diagnosisModel, centerInformationModel];
}
