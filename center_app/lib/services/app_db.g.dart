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
  static const VerificationMeta _doctorsIncentiveMeta =
      const VerificationMeta('doctorsIncentive');
  @override
  late final GeneratedColumn<String> doctorsIncentive = GeneratedColumn<String>(
      'doctor_incentive', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  static const VerificationMeta _doctorPhoneMeta =
      const VerificationMeta('doctorPhone');
  @override
  late final GeneratedColumn<String> doctorPhone = GeneratedColumn<String>(
      'doctor_phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, doctorsIncentive, doctorName, doctorAddress, doctorPhone];
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
    if (data.containsKey('doctor_incentive')) {
      context.handle(
          _doctorsIncentiveMeta,
          doctorsIncentive.isAcceptableOrUnknown(
              data['doctor_incentive']!, _doctorsIncentiveMeta));
    } else if (isInserting) {
      context.missing(_doctorsIncentiveMeta);
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
    if (data.containsKey('doctor_phone')) {
      context.handle(
          _doctorPhoneMeta,
          doctorPhone.isAcceptableOrUnknown(
              data['doctor_phone']!, _doctorPhoneMeta));
    } else if (isInserting) {
      context.missing(_doctorPhoneMeta);
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
      doctorsIncentive: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}doctor_incentive'])!,
      doctorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_name'])!,
      doctorAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_address'])!,
      doctorPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_phone'])!,
    );
  }

  @override
  $DoctorModelTable createAlias(String alias) {
    return $DoctorModelTable(attachedDatabase, alias);
  }
}

class DoctorModelData extends DataClass implements Insertable<DoctorModelData> {
  final int id;
  final String doctorsIncentive;
  final String doctorName;
  final String doctorAddress;
  final String doctorPhone;
  const DoctorModelData(
      {required this.id,
      required this.doctorsIncentive,
      required this.doctorName,
      required this.doctorAddress,
      required this.doctorPhone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['doctor_incentive'] = Variable<String>(doctorsIncentive);
    map['doctor_name'] = Variable<String>(doctorName);
    map['doctor_address'] = Variable<String>(doctorAddress);
    map['doctor_phone'] = Variable<String>(doctorPhone);
    return map;
  }

  DoctorModelCompanion toCompanion(bool nullToAbsent) {
    return DoctorModelCompanion(
      id: Value(id),
      doctorsIncentive: Value(doctorsIncentive),
      doctorName: Value(doctorName),
      doctorAddress: Value(doctorAddress),
      doctorPhone: Value(doctorPhone),
    );
  }

  factory DoctorModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoctorModelData(
      id: serializer.fromJson<int>(json['id']),
      doctorsIncentive: serializer.fromJson<String>(json['doctorsIncentive']),
      doctorName: serializer.fromJson<String>(json['doctorName']),
      doctorAddress: serializer.fromJson<String>(json['doctorAddress']),
      doctorPhone: serializer.fromJson<String>(json['doctorPhone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'doctorsIncentive': serializer.toJson<String>(doctorsIncentive),
      'doctorName': serializer.toJson<String>(doctorName),
      'doctorAddress': serializer.toJson<String>(doctorAddress),
      'doctorPhone': serializer.toJson<String>(doctorPhone),
    };
  }

  DoctorModelData copyWith(
          {int? id,
          String? doctorsIncentive,
          String? doctorName,
          String? doctorAddress,
          String? doctorPhone}) =>
      DoctorModelData(
        id: id ?? this.id,
        doctorsIncentive: doctorsIncentive ?? this.doctorsIncentive,
        doctorName: doctorName ?? this.doctorName,
        doctorAddress: doctorAddress ?? this.doctorAddress,
        doctorPhone: doctorPhone ?? this.doctorPhone,
      );
  @override
  String toString() {
    return (StringBuffer('DoctorModelData(')
          ..write('id: $id, ')
          ..write('doctorsIncentive: $doctorsIncentive, ')
          ..write('doctorName: $doctorName, ')
          ..write('doctorAddress: $doctorAddress, ')
          ..write('doctorPhone: $doctorPhone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, doctorsIncentive, doctorName, doctorAddress, doctorPhone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorModelData &&
          other.id == this.id &&
          other.doctorsIncentive == this.doctorsIncentive &&
          other.doctorName == this.doctorName &&
          other.doctorAddress == this.doctorAddress &&
          other.doctorPhone == this.doctorPhone);
}

class DoctorModelCompanion extends UpdateCompanion<DoctorModelData> {
  final Value<int> id;
  final Value<String> doctorsIncentive;
  final Value<String> doctorName;
  final Value<String> doctorAddress;
  final Value<String> doctorPhone;
  const DoctorModelCompanion({
    this.id = const Value.absent(),
    this.doctorsIncentive = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.doctorAddress = const Value.absent(),
    this.doctorPhone = const Value.absent(),
  });
  DoctorModelCompanion.insert({
    this.id = const Value.absent(),
    required String doctorsIncentive,
    required String doctorName,
    required String doctorAddress,
    required String doctorPhone,
  })  : doctorsIncentive = Value(doctorsIncentive),
        doctorName = Value(doctorName),
        doctorAddress = Value(doctorAddress),
        doctorPhone = Value(doctorPhone);
  static Insertable<DoctorModelData> custom({
    Expression<int>? id,
    Expression<String>? doctorsIncentive,
    Expression<String>? doctorName,
    Expression<String>? doctorAddress,
    Expression<String>? doctorPhone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (doctorsIncentive != null) 'doctor_incentive': doctorsIncentive,
      if (doctorName != null) 'doctor_name': doctorName,
      if (doctorAddress != null) 'doctor_address': doctorAddress,
      if (doctorPhone != null) 'doctor_phone': doctorPhone,
    });
  }

  DoctorModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? doctorsIncentive,
      Value<String>? doctorName,
      Value<String>? doctorAddress,
      Value<String>? doctorPhone}) {
    return DoctorModelCompanion(
      id: id ?? this.id,
      doctorsIncentive: doctorsIncentive ?? this.doctorsIncentive,
      doctorName: doctorName ?? this.doctorName,
      doctorAddress: doctorAddress ?? this.doctorAddress,
      doctorPhone: doctorPhone ?? this.doctorPhone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (doctorsIncentive.present) {
      map['doctor_incentive'] = Variable<String>(doctorsIncentive.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (doctorAddress.present) {
      map['doctor_address'] = Variable<String>(doctorAddress.value);
    }
    if (doctorPhone.present) {
      map['doctor_phone'] = Variable<String>(doctorPhone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorModelCompanion(')
          ..write('id: $id, ')
          ..write('doctorsIncentive: $doctorsIncentive, ')
          ..write('doctorName: $doctorName, ')
          ..write('doctorAddress: $doctorAddress, ')
          ..write('doctorPhone: $doctorPhone')
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
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<int> totalPrice = GeneratedColumn<int>(
      'total_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pricePaidByPatientMeta =
      const VerificationMeta('pricePaidByPatient');
  @override
  late final GeneratedColumn<int> pricePaidByPatient = GeneratedColumn<int>(
      'price_paid_by_patient', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<int> discount = GeneratedColumn<int>(
      'discount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _doctorsIncentiveMeta =
      const VerificationMeta('doctorsIncentive');
  @override
  late final GeneratedColumn<int> doctorsIncentive = GeneratedColumn<int>(
      'doctor_incentive', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
        totalPrice,
        pricePaidByPatient,
        discount,
        doctorsIncentive,
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
          _doctorsIncentiveMeta,
          doctorsIncentive.isAcceptableOrUnknown(
              data['doctor_incentive']!, _doctorsIncentiveMeta));
    } else if (isInserting) {
      context.missing(_doctorsIncentiveMeta);
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
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_price'])!,
      pricePaidByPatient: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}price_paid_by_patient'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}discount'])!,
      doctorsIncentive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}doctor_incentive'])!,
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
  final int totalPrice;
  final int pricePaidByPatient;
  final int discount;
  final int doctorsIncentive;
  final DateTime dateOfTestDone;
  const DiagnosisModelData(
      {required this.id,
      required this.patientName,
      required this.doctorName,
      required this.typeOfTest,
      required this.totalPrice,
      required this.pricePaidByPatient,
      required this.discount,
      required this.doctorsIncentive,
      required this.dateOfTestDone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_name'] = Variable<String>(patientName);
    map['doctor_name'] = Variable<String>(doctorName);
    map['type_of_test'] = Variable<String>(typeOfTest);
    map['total_price'] = Variable<int>(totalPrice);
    map['price_paid_by_patient'] = Variable<int>(pricePaidByPatient);
    map['discount'] = Variable<int>(discount);
    map['doctor_incentive'] = Variable<int>(doctorsIncentive);
    map['date_of_test_done'] = Variable<DateTime>(dateOfTestDone);
    return map;
  }

  DiagnosisModelCompanion toCompanion(bool nullToAbsent) {
    return DiagnosisModelCompanion(
      id: Value(id),
      patientName: Value(patientName),
      doctorName: Value(doctorName),
      typeOfTest: Value(typeOfTest),
      totalPrice: Value(totalPrice),
      pricePaidByPatient: Value(pricePaidByPatient),
      discount: Value(discount),
      doctorsIncentive: Value(doctorsIncentive),
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
      totalPrice: serializer.fromJson<int>(json['totalPrice']),
      pricePaidByPatient: serializer.fromJson<int>(json['pricePaidByPatient']),
      discount: serializer.fromJson<int>(json['discount']),
      doctorsIncentive: serializer.fromJson<int>(json['doctorsIncentive']),
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
      'totalPrice': serializer.toJson<int>(totalPrice),
      'pricePaidByPatient': serializer.toJson<int>(pricePaidByPatient),
      'discount': serializer.toJson<int>(discount),
      'doctorsIncentive': serializer.toJson<int>(doctorsIncentive),
      'dateOfTestDone': serializer.toJson<DateTime>(dateOfTestDone),
    };
  }

  DiagnosisModelData copyWith(
          {int? id,
          String? patientName,
          String? doctorName,
          String? typeOfTest,
          int? totalPrice,
          int? pricePaidByPatient,
          int? discount,
          int? doctorsIncentive,
          DateTime? dateOfTestDone}) =>
      DiagnosisModelData(
        id: id ?? this.id,
        patientName: patientName ?? this.patientName,
        doctorName: doctorName ?? this.doctorName,
        typeOfTest: typeOfTest ?? this.typeOfTest,
        totalPrice: totalPrice ?? this.totalPrice,
        pricePaidByPatient: pricePaidByPatient ?? this.pricePaidByPatient,
        discount: discount ?? this.discount,
        doctorsIncentive: doctorsIncentive ?? this.doctorsIncentive,
        dateOfTestDone: dateOfTestDone ?? this.dateOfTestDone,
      );
  @override
  String toString() {
    return (StringBuffer('DiagnosisModelData(')
          ..write('id: $id, ')
          ..write('patientName: $patientName, ')
          ..write('doctorName: $doctorName, ')
          ..write('typeOfTest: $typeOfTest, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('pricePaidByPatient: $pricePaidByPatient, ')
          ..write('discount: $discount, ')
          ..write('doctorsIncentive: $doctorsIncentive, ')
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
      totalPrice,
      pricePaidByPatient,
      discount,
      doctorsIncentive,
      dateOfTestDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiagnosisModelData &&
          other.id == this.id &&
          other.patientName == this.patientName &&
          other.doctorName == this.doctorName &&
          other.typeOfTest == this.typeOfTest &&
          other.totalPrice == this.totalPrice &&
          other.pricePaidByPatient == this.pricePaidByPatient &&
          other.discount == this.discount &&
          other.doctorsIncentive == this.doctorsIncentive &&
          other.dateOfTestDone == this.dateOfTestDone);
}

class DiagnosisModelCompanion extends UpdateCompanion<DiagnosisModelData> {
  final Value<int> id;
  final Value<String> patientName;
  final Value<String> doctorName;
  final Value<String> typeOfTest;
  final Value<int> totalPrice;
  final Value<int> pricePaidByPatient;
  final Value<int> discount;
  final Value<int> doctorsIncentive;
  final Value<DateTime> dateOfTestDone;
  const DiagnosisModelCompanion({
    this.id = const Value.absent(),
    this.patientName = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.typeOfTest = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.pricePaidByPatient = const Value.absent(),
    this.discount = const Value.absent(),
    this.doctorsIncentive = const Value.absent(),
    this.dateOfTestDone = const Value.absent(),
  });
  DiagnosisModelCompanion.insert({
    this.id = const Value.absent(),
    required String patientName,
    required String doctorName,
    required String typeOfTest,
    required int totalPrice,
    required int pricePaidByPatient,
    required int discount,
    required int doctorsIncentive,
    required DateTime dateOfTestDone,
  })  : patientName = Value(patientName),
        doctorName = Value(doctorName),
        typeOfTest = Value(typeOfTest),
        totalPrice = Value(totalPrice),
        pricePaidByPatient = Value(pricePaidByPatient),
        discount = Value(discount),
        doctorsIncentive = Value(doctorsIncentive),
        dateOfTestDone = Value(dateOfTestDone);
  static Insertable<DiagnosisModelData> custom({
    Expression<int>? id,
    Expression<String>? patientName,
    Expression<String>? doctorName,
    Expression<String>? typeOfTest,
    Expression<int>? totalPrice,
    Expression<int>? pricePaidByPatient,
    Expression<int>? discount,
    Expression<int>? doctorsIncentive,
    Expression<DateTime>? dateOfTestDone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientName != null) 'patient_name': patientName,
      if (doctorName != null) 'doctor_name': doctorName,
      if (typeOfTest != null) 'type_of_test': typeOfTest,
      if (totalPrice != null) 'total_price': totalPrice,
      if (pricePaidByPatient != null)
        'price_paid_by_patient': pricePaidByPatient,
      if (discount != null) 'discount': discount,
      if (doctorsIncentive != null) 'doctor_incentive': doctorsIncentive,
      if (dateOfTestDone != null) 'date_of_test_done': dateOfTestDone,
    });
  }

  DiagnosisModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? patientName,
      Value<String>? doctorName,
      Value<String>? typeOfTest,
      Value<int>? totalPrice,
      Value<int>? pricePaidByPatient,
      Value<int>? discount,
      Value<int>? doctorsIncentive,
      Value<DateTime>? dateOfTestDone}) {
    return DiagnosisModelCompanion(
      id: id ?? this.id,
      patientName: patientName ?? this.patientName,
      doctorName: doctorName ?? this.doctorName,
      typeOfTest: typeOfTest ?? this.typeOfTest,
      totalPrice: totalPrice ?? this.totalPrice,
      pricePaidByPatient: pricePaidByPatient ?? this.pricePaidByPatient,
      discount: discount ?? this.discount,
      doctorsIncentive: doctorsIncentive ?? this.doctorsIncentive,
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
    if (totalPrice.present) {
      map['total_price'] = Variable<int>(totalPrice.value);
    }
    if (pricePaidByPatient.present) {
      map['price_paid_by_patient'] = Variable<int>(pricePaidByPatient.value);
    }
    if (discount.present) {
      map['discount'] = Variable<int>(discount.value);
    }
    if (doctorsIncentive.present) {
      map['doctor_incentive'] = Variable<int>(doctorsIncentive.value);
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
          ..write('totalPrice: $totalPrice, ')
          ..write('pricePaidByPatient: $pricePaidByPatient, ')
          ..write('discount: $discount, ')
          ..write('doctorsIncentive: $doctorsIncentive, ')
          ..write('dateOfTestDone: $dateOfTestDone')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $DoctorModelTable doctorModel = $DoctorModelTable(this);
  late final $DiagnosisModelTable diagnosisModel = $DiagnosisModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [doctorModel, diagnosisModel];
}
