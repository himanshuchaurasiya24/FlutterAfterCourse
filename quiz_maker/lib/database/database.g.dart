// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $QuestionModelTable extends QuestionModel
    with TableInfo<$QuestionModelTable, QuestionModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctOptionMeta =
      const VerificationMeta('correctOption');
  @override
  late final GeneratedColumn<String> correctOption = GeneratedColumn<String>(
      'correctOption', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _secondOptionMeta =
      const VerificationMeta('secondOption');
  @override
  late final GeneratedColumn<String> secondOption = GeneratedColumn<String>(
      'secondOption', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thirdOptionMeta =
      const VerificationMeta('thirdOption');
  @override
  late final GeneratedColumn<String> thirdOption = GeneratedColumn<String>(
      'thirdOption', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fourthOptionMeta =
      const VerificationMeta('fourthOption');
  @override
  late final GeneratedColumn<String> fourthOption = GeneratedColumn<String>(
      'fourthOption', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [question, correctOption, secondOption, thirdOption, fourthOption];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question_model';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('correctOption')) {
      context.handle(
          _correctOptionMeta,
          correctOption.isAcceptableOrUnknown(
              data['correctOption']!, _correctOptionMeta));
    } else if (isInserting) {
      context.missing(_correctOptionMeta);
    }
    if (data.containsKey('secondOption')) {
      context.handle(
          _secondOptionMeta,
          secondOption.isAcceptableOrUnknown(
              data['secondOption']!, _secondOptionMeta));
    } else if (isInserting) {
      context.missing(_secondOptionMeta);
    }
    if (data.containsKey('thirdOption')) {
      context.handle(
          _thirdOptionMeta,
          thirdOption.isAcceptableOrUnknown(
              data['thirdOption']!, _thirdOptionMeta));
    } else if (isInserting) {
      context.missing(_thirdOptionMeta);
    }
    if (data.containsKey('fourthOption')) {
      context.handle(
          _fourthOptionMeta,
          fourthOption.isAcceptableOrUnknown(
              data['fourthOption']!, _fourthOptionMeta));
    } else if (isInserting) {
      context.missing(_fourthOptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  QuestionModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionModelData(
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      correctOption: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}correctOption'])!,
      secondOption: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secondOption'])!,
      thirdOption: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thirdOption'])!,
      fourthOption: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fourthOption'])!,
    );
  }

  @override
  $QuestionModelTable createAlias(String alias) {
    return $QuestionModelTable(attachedDatabase, alias);
  }
}

class QuestionModelData extends DataClass
    implements Insertable<QuestionModelData> {
  final String question;
  final String correctOption;
  final String secondOption;
  final String thirdOption;
  final String fourthOption;
  const QuestionModelData(
      {required this.question,
      required this.correctOption,
      required this.secondOption,
      required this.thirdOption,
      required this.fourthOption});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['question'] = Variable<String>(question);
    map['correctOption'] = Variable<String>(correctOption);
    map['secondOption'] = Variable<String>(secondOption);
    map['thirdOption'] = Variable<String>(thirdOption);
    map['fourthOption'] = Variable<String>(fourthOption);
    return map;
  }

  QuestionModelCompanion toCompanion(bool nullToAbsent) {
    return QuestionModelCompanion(
      question: Value(question),
      correctOption: Value(correctOption),
      secondOption: Value(secondOption),
      thirdOption: Value(thirdOption),
      fourthOption: Value(fourthOption),
    );
  }

  factory QuestionModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionModelData(
      question: serializer.fromJson<String>(json['question']),
      correctOption: serializer.fromJson<String>(json['correctOption']),
      secondOption: serializer.fromJson<String>(json['secondOption']),
      thirdOption: serializer.fromJson<String>(json['thirdOption']),
      fourthOption: serializer.fromJson<String>(json['fourthOption']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'question': serializer.toJson<String>(question),
      'correctOption': serializer.toJson<String>(correctOption),
      'secondOption': serializer.toJson<String>(secondOption),
      'thirdOption': serializer.toJson<String>(thirdOption),
      'fourthOption': serializer.toJson<String>(fourthOption),
    };
  }

  QuestionModelData copyWith(
          {String? question,
          String? correctOption,
          String? secondOption,
          String? thirdOption,
          String? fourthOption}) =>
      QuestionModelData(
        question: question ?? this.question,
        correctOption: correctOption ?? this.correctOption,
        secondOption: secondOption ?? this.secondOption,
        thirdOption: thirdOption ?? this.thirdOption,
        fourthOption: fourthOption ?? this.fourthOption,
      );
  @override
  String toString() {
    return (StringBuffer('QuestionModelData(')
          ..write('question: $question, ')
          ..write('correctOption: $correctOption, ')
          ..write('secondOption: $secondOption, ')
          ..write('thirdOption: $thirdOption, ')
          ..write('fourthOption: $fourthOption')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      question, correctOption, secondOption, thirdOption, fourthOption);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionModelData &&
          other.question == this.question &&
          other.correctOption == this.correctOption &&
          other.secondOption == this.secondOption &&
          other.thirdOption == this.thirdOption &&
          other.fourthOption == this.fourthOption);
}

class QuestionModelCompanion extends UpdateCompanion<QuestionModelData> {
  final Value<String> question;
  final Value<String> correctOption;
  final Value<String> secondOption;
  final Value<String> thirdOption;
  final Value<String> fourthOption;
  final Value<int> rowid;
  const QuestionModelCompanion({
    this.question = const Value.absent(),
    this.correctOption = const Value.absent(),
    this.secondOption = const Value.absent(),
    this.thirdOption = const Value.absent(),
    this.fourthOption = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionModelCompanion.insert({
    required String question,
    required String correctOption,
    required String secondOption,
    required String thirdOption,
    required String fourthOption,
    this.rowid = const Value.absent(),
  })  : question = Value(question),
        correctOption = Value(correctOption),
        secondOption = Value(secondOption),
        thirdOption = Value(thirdOption),
        fourthOption = Value(fourthOption);
  static Insertable<QuestionModelData> custom({
    Expression<String>? question,
    Expression<String>? correctOption,
    Expression<String>? secondOption,
    Expression<String>? thirdOption,
    Expression<String>? fourthOption,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (question != null) 'question': question,
      if (correctOption != null) 'correctOption': correctOption,
      if (secondOption != null) 'secondOption': secondOption,
      if (thirdOption != null) 'thirdOption': thirdOption,
      if (fourthOption != null) 'fourthOption': fourthOption,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionModelCompanion copyWith(
      {Value<String>? question,
      Value<String>? correctOption,
      Value<String>? secondOption,
      Value<String>? thirdOption,
      Value<String>? fourthOption,
      Value<int>? rowid}) {
    return QuestionModelCompanion(
      question: question ?? this.question,
      correctOption: correctOption ?? this.correctOption,
      secondOption: secondOption ?? this.secondOption,
      thirdOption: thirdOption ?? this.thirdOption,
      fourthOption: fourthOption ?? this.fourthOption,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (correctOption.present) {
      map['correctOption'] = Variable<String>(correctOption.value);
    }
    if (secondOption.present) {
      map['secondOption'] = Variable<String>(secondOption.value);
    }
    if (thirdOption.present) {
      map['thirdOption'] = Variable<String>(thirdOption.value);
    }
    if (fourthOption.present) {
      map['fourthOption'] = Variable<String>(fourthOption.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionModelCompanion(')
          ..write('question: $question, ')
          ..write('correctOption: $correctOption, ')
          ..write('secondOption: $secondOption, ')
          ..write('thirdOption: $thirdOption, ')
          ..write('fourthOption: $fourthOption, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $QuestionModelTable questionModel = $QuestionModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [questionModel];
}
