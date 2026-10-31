// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TrainersTable extends Trainers with TableInfo<$TrainersTable, Trainer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordSaltMeta = const VerificationMeta(
    'passwordSalt',
  );
  @override
  late final GeneratedColumn<String> passwordSalt = GeneratedColumn<String>(
    'password_salt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _avatarUrlMeta = const VerificationMeta(
    'avatarUrl',
  );
  @override
  late final GeneratedColumn<String> avatarUrl = GeneratedColumn<String>(
    'avatar_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    passwordSalt,
    passwordHash,
    phone,
    avatarUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trainers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Trainer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password_salt')) {
      context.handle(
        _passwordSaltMeta,
        passwordSalt.isAcceptableOrUnknown(
          data['password_salt']!,
          _passwordSaltMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordSaltMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('avatar_url')) {
      context.handle(
        _avatarUrlMeta,
        avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trainer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trainer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      passwordSalt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_salt'],
      )!,
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      avatarUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_url'],
      ),
    );
  }

  @override
  $TrainersTable createAlias(String alias) {
    return $TrainersTable(attachedDatabase, alias);
  }
}

class Trainer extends DataClass implements Insertable<Trainer> {
  final int id;
  final String name;
  final String email;
  final String passwordSalt;
  final String passwordHash;
  final String phone;
  final String? avatarUrl;
  const Trainer({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordSalt,
    required this.passwordHash,
    required this.phone,
    this.avatarUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password_salt'] = Variable<String>(passwordSalt);
    map['password_hash'] = Variable<String>(passwordHash);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || avatarUrl != null) {
      map['avatar_url'] = Variable<String>(avatarUrl);
    }
    return map;
  }

  TrainersCompanion toCompanion(bool nullToAbsent) {
    return TrainersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      passwordSalt: Value(passwordSalt),
      passwordHash: Value(passwordHash),
      phone: Value(phone),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
    );
  }

  factory Trainer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trainer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      passwordSalt: serializer.fromJson<String>(json['passwordSalt']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      phone: serializer.fromJson<String>(json['phone']),
      avatarUrl: serializer.fromJson<String?>(json['avatarUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'passwordSalt': serializer.toJson<String>(passwordSalt),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'phone': serializer.toJson<String>(phone),
      'avatarUrl': serializer.toJson<String?>(avatarUrl),
    };
  }

  Trainer copyWith({
    int? id,
    String? name,
    String? email,
    String? passwordSalt,
    String? passwordHash,
    String? phone,
    Value<String?> avatarUrl = const Value.absent(),
  }) => Trainer(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    passwordSalt: passwordSalt ?? this.passwordSalt,
    passwordHash: passwordHash ?? this.passwordHash,
    phone: phone ?? this.phone,
    avatarUrl: avatarUrl.present ? avatarUrl.value : this.avatarUrl,
  );
  Trainer copyWithCompanion(TrainersCompanion data) {
    return Trainer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      passwordSalt: data.passwordSalt.present
          ? data.passwordSalt.value
          : this.passwordSalt,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      phone: data.phone.present ? data.phone.value : this.phone,
      avatarUrl: data.avatarUrl.present ? data.avatarUrl.value : this.avatarUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trainer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('passwordSalt: $passwordSalt, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('phone: $phone, ')
          ..write('avatarUrl: $avatarUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    email,
    passwordSalt,
    passwordHash,
    phone,
    avatarUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trainer &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.passwordSalt == this.passwordSalt &&
          other.passwordHash == this.passwordHash &&
          other.phone == this.phone &&
          other.avatarUrl == this.avatarUrl);
}

class TrainersCompanion extends UpdateCompanion<Trainer> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> passwordSalt;
  final Value<String> passwordHash;
  final Value<String> phone;
  final Value<String?> avatarUrl;
  const TrainersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.passwordSalt = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.phone = const Value.absent(),
    this.avatarUrl = const Value.absent(),
  });
  TrainersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String passwordSalt,
    required String passwordHash,
    this.phone = const Value.absent(),
    this.avatarUrl = const Value.absent(),
  }) : name = Value(name),
       email = Value(email),
       passwordSalt = Value(passwordSalt),
       passwordHash = Value(passwordHash);
  static Insertable<Trainer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? passwordSalt,
    Expression<String>? passwordHash,
    Expression<String>? phone,
    Expression<String>? avatarUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (passwordSalt != null) 'password_salt': passwordSalt,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (phone != null) 'phone': phone,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
    });
  }

  TrainersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? email,
    Value<String>? passwordSalt,
    Value<String>? passwordHash,
    Value<String>? phone,
    Value<String?>? avatarUrl,
  }) {
    return TrainersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      passwordSalt: passwordSalt ?? this.passwordSalt,
      passwordHash: passwordHash ?? this.passwordHash,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (passwordSalt.present) {
      map['password_salt'] = Variable<String>(passwordSalt.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String>(avatarUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('passwordSalt: $passwordSalt, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('phone: $phone, ')
          ..write('avatarUrl: $avatarUrl')
          ..write(')'))
        .toString();
  }
}

class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _trainerIdMeta = const VerificationMeta(
    'trainerId',
  );
  @override
  late final GeneratedColumn<int> trainerId = GeneratedColumn<int>(
    'trainer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES trainers (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactMeta = const VerificationMeta(
    'contact',
  );
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
    'contact',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _heightCmMeta = const VerificationMeta(
    'heightCm',
  );
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
    'height_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _initialWeightKgMeta = const VerificationMeta(
    'initialWeightKg',
  );
  @override
  late final GeneratedColumn<double> initialWeightKg = GeneratedColumn<double>(
    'initial_weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goalMeta = const VerificationMeta('goal');
  @override
  late final GeneratedColumn<String> goal = GeneratedColumn<String>(
    'goal',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _medicalHistoryMeta = const VerificationMeta(
    'medicalHistory',
  );
  @override
  late final GeneratedColumn<String> medicalHistory = GeneratedColumn<String>(
    'medical_history',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _injuryHistoryMeta = const VerificationMeta(
    'injuryHistory',
  );
  @override
  late final GeneratedColumn<String> injuryHistory = GeneratedColumn<String>(
    'injury_history',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _assessmentNotesMeta = const VerificationMeta(
    'assessmentNotes',
  );
  @override
  late final GeneratedColumn<String> assessmentNotes = GeneratedColumn<String>(
    'assessment_notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    trainerId,
    name,
    age,
    contact,
    heightCm,
    initialWeightKg,
    goal,
    medicalHistory,
    injuryHistory,
    assessmentNotes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Client> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trainer_id')) {
      context.handle(
        _trainerIdMeta,
        trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trainerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(
        _contactMeta,
        contact.isAcceptableOrUnknown(data['contact']!, _contactMeta),
      );
    }
    if (data.containsKey('height_cm')) {
      context.handle(
        _heightCmMeta,
        heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta),
      );
    }
    if (data.containsKey('initial_weight_kg')) {
      context.handle(
        _initialWeightKgMeta,
        initialWeightKg.isAcceptableOrUnknown(
          data['initial_weight_kg']!,
          _initialWeightKgMeta,
        ),
      );
    }
    if (data.containsKey('goal')) {
      context.handle(
        _goalMeta,
        goal.isAcceptableOrUnknown(data['goal']!, _goalMeta),
      );
    }
    if (data.containsKey('medical_history')) {
      context.handle(
        _medicalHistoryMeta,
        medicalHistory.isAcceptableOrUnknown(
          data['medical_history']!,
          _medicalHistoryMeta,
        ),
      );
    }
    if (data.containsKey('injury_history')) {
      context.handle(
        _injuryHistoryMeta,
        injuryHistory.isAcceptableOrUnknown(
          data['injury_history']!,
          _injuryHistoryMeta,
        ),
      );
    }
    if (data.containsKey('assessment_notes')) {
      context.handle(
        _assessmentNotesMeta,
        assessmentNotes.isAcceptableOrUnknown(
          data['assessment_notes']!,
          _assessmentNotesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      trainerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trainer_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      contact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact'],
      )!,
      heightCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_cm'],
      ),
      initialWeightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}initial_weight_kg'],
      ),
      goal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal'],
      )!,
      medicalHistory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medical_history'],
      )!,
      injuryHistory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}injury_history'],
      )!,
      assessmentNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assessment_notes'],
      )!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final int id;
  final int trainerId;
  final String name;
  final int age;
  final String contact;
  final double? heightCm;
  final double? initialWeightKg;
  final String goal;
  final String medicalHistory;
  final String injuryHistory;
  final String assessmentNotes;
  const Client({
    required this.id,
    required this.trainerId,
    required this.name,
    required this.age,
    required this.contact,
    this.heightCm,
    this.initialWeightKg,
    required this.goal,
    required this.medicalHistory,
    required this.injuryHistory,
    required this.assessmentNotes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['trainer_id'] = Variable<int>(trainerId);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['contact'] = Variable<String>(contact);
    if (!nullToAbsent || heightCm != null) {
      map['height_cm'] = Variable<double>(heightCm);
    }
    if (!nullToAbsent || initialWeightKg != null) {
      map['initial_weight_kg'] = Variable<double>(initialWeightKg);
    }
    map['goal'] = Variable<String>(goal);
    map['medical_history'] = Variable<String>(medicalHistory);
    map['injury_history'] = Variable<String>(injuryHistory);
    map['assessment_notes'] = Variable<String>(assessmentNotes);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      trainerId: Value(trainerId),
      name: Value(name),
      age: Value(age),
      contact: Value(contact),
      heightCm: heightCm == null && nullToAbsent
          ? const Value.absent()
          : Value(heightCm),
      initialWeightKg: initialWeightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(initialWeightKg),
      goal: Value(goal),
      medicalHistory: Value(medicalHistory),
      injuryHistory: Value(injuryHistory),
      assessmentNotes: Value(assessmentNotes),
    );
  }

  factory Client.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<int>(json['id']),
      trainerId: serializer.fromJson<int>(json['trainerId']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      contact: serializer.fromJson<String>(json['contact']),
      heightCm: serializer.fromJson<double?>(json['heightCm']),
      initialWeightKg: serializer.fromJson<double?>(json['initialWeightKg']),
      goal: serializer.fromJson<String>(json['goal']),
      medicalHistory: serializer.fromJson<String>(json['medicalHistory']),
      injuryHistory: serializer.fromJson<String>(json['injuryHistory']),
      assessmentNotes: serializer.fromJson<String>(json['assessmentNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trainerId': serializer.toJson<int>(trainerId),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'contact': serializer.toJson<String>(contact),
      'heightCm': serializer.toJson<double?>(heightCm),
      'initialWeightKg': serializer.toJson<double?>(initialWeightKg),
      'goal': serializer.toJson<String>(goal),
      'medicalHistory': serializer.toJson<String>(medicalHistory),
      'injuryHistory': serializer.toJson<String>(injuryHistory),
      'assessmentNotes': serializer.toJson<String>(assessmentNotes),
    };
  }

  Client copyWith({
    int? id,
    int? trainerId,
    String? name,
    int? age,
    String? contact,
    Value<double?> heightCm = const Value.absent(),
    Value<double?> initialWeightKg = const Value.absent(),
    String? goal,
    String? medicalHistory,
    String? injuryHistory,
    String? assessmentNotes,
  }) => Client(
    id: id ?? this.id,
    trainerId: trainerId ?? this.trainerId,
    name: name ?? this.name,
    age: age ?? this.age,
    contact: contact ?? this.contact,
    heightCm: heightCm.present ? heightCm.value : this.heightCm,
    initialWeightKg: initialWeightKg.present
        ? initialWeightKg.value
        : this.initialWeightKg,
    goal: goal ?? this.goal,
    medicalHistory: medicalHistory ?? this.medicalHistory,
    injuryHistory: injuryHistory ?? this.injuryHistory,
    assessmentNotes: assessmentNotes ?? this.assessmentNotes,
  );
  Client copyWithCompanion(ClientsCompanion data) {
    return Client(
      id: data.id.present ? data.id.value : this.id,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      contact: data.contact.present ? data.contact.value : this.contact,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      initialWeightKg: data.initialWeightKg.present
          ? data.initialWeightKg.value
          : this.initialWeightKg,
      goal: data.goal.present ? data.goal.value : this.goal,
      medicalHistory: data.medicalHistory.present
          ? data.medicalHistory.value
          : this.medicalHistory,
      injuryHistory: data.injuryHistory.present
          ? data.injuryHistory.value
          : this.injuryHistory,
      assessmentNotes: data.assessmentNotes.present
          ? data.assessmentNotes.value
          : this.assessmentNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('trainerId: $trainerId, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('contact: $contact, ')
          ..write('heightCm: $heightCm, ')
          ..write('initialWeightKg: $initialWeightKg, ')
          ..write('goal: $goal, ')
          ..write('medicalHistory: $medicalHistory, ')
          ..write('injuryHistory: $injuryHistory, ')
          ..write('assessmentNotes: $assessmentNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    trainerId,
    name,
    age,
    contact,
    heightCm,
    initialWeightKg,
    goal,
    medicalHistory,
    injuryHistory,
    assessmentNotes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.trainerId == this.trainerId &&
          other.name == this.name &&
          other.age == this.age &&
          other.contact == this.contact &&
          other.heightCm == this.heightCm &&
          other.initialWeightKg == this.initialWeightKg &&
          other.goal == this.goal &&
          other.medicalHistory == this.medicalHistory &&
          other.injuryHistory == this.injuryHistory &&
          other.assessmentNotes == this.assessmentNotes);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<int> trainerId;
  final Value<String> name;
  final Value<int> age;
  final Value<String> contact;
  final Value<double?> heightCm;
  final Value<double?> initialWeightKg;
  final Value<String> goal;
  final Value<String> medicalHistory;
  final Value<String> injuryHistory;
  final Value<String> assessmentNotes;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.contact = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.initialWeightKg = const Value.absent(),
    this.goal = const Value.absent(),
    this.medicalHistory = const Value.absent(),
    this.injuryHistory = const Value.absent(),
    this.assessmentNotes = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required int trainerId,
    required String name,
    required int age,
    this.contact = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.initialWeightKg = const Value.absent(),
    this.goal = const Value.absent(),
    this.medicalHistory = const Value.absent(),
    this.injuryHistory = const Value.absent(),
    this.assessmentNotes = const Value.absent(),
  }) : trainerId = Value(trainerId),
       name = Value(name),
       age = Value(age);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<int>? trainerId,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? contact,
    Expression<double>? heightCm,
    Expression<double>? initialWeightKg,
    Expression<String>? goal,
    Expression<String>? medicalHistory,
    Expression<String>? injuryHistory,
    Expression<String>? assessmentNotes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainerId != null) 'trainer_id': trainerId,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (contact != null) 'contact': contact,
      if (heightCm != null) 'height_cm': heightCm,
      if (initialWeightKg != null) 'initial_weight_kg': initialWeightKg,
      if (goal != null) 'goal': goal,
      if (medicalHistory != null) 'medical_history': medicalHistory,
      if (injuryHistory != null) 'injury_history': injuryHistory,
      if (assessmentNotes != null) 'assessment_notes': assessmentNotes,
    });
  }

  ClientsCompanion copyWith({
    Value<int>? id,
    Value<int>? trainerId,
    Value<String>? name,
    Value<int>? age,
    Value<String>? contact,
    Value<double?>? heightCm,
    Value<double?>? initialWeightKg,
    Value<String>? goal,
    Value<String>? medicalHistory,
    Value<String>? injuryHistory,
    Value<String>? assessmentNotes,
  }) {
    return ClientsCompanion(
      id: id ?? this.id,
      trainerId: trainerId ?? this.trainerId,
      name: name ?? this.name,
      age: age ?? this.age,
      contact: contact ?? this.contact,
      heightCm: heightCm ?? this.heightCm,
      initialWeightKg: initialWeightKg ?? this.initialWeightKg,
      goal: goal ?? this.goal,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      injuryHistory: injuryHistory ?? this.injuryHistory,
      assessmentNotes: assessmentNotes ?? this.assessmentNotes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<int>(trainerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (initialWeightKg.present) {
      map['initial_weight_kg'] = Variable<double>(initialWeightKg.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String>(goal.value);
    }
    if (medicalHistory.present) {
      map['medical_history'] = Variable<String>(medicalHistory.value);
    }
    if (injuryHistory.present) {
      map['injury_history'] = Variable<String>(injuryHistory.value);
    }
    if (assessmentNotes.present) {
      map['assessment_notes'] = Variable<String>(assessmentNotes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('trainerId: $trainerId, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('contact: $contact, ')
          ..write('heightCm: $heightCm, ')
          ..write('initialWeightKg: $initialWeightKg, ')
          ..write('goal: $goal, ')
          ..write('medicalHistory: $medicalHistory, ')
          ..write('injuryHistory: $injuryHistory, ')
          ..write('assessmentNotes: $assessmentNotes')
          ..write(')'))
        .toString();
  }
}

class $PtPackagesTable extends PtPackages
    with TableInfo<$PtPackagesTable, PtPackage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PtPackagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _totalSessionsMeta = const VerificationMeta(
    'totalSessions',
  );
  @override
  late final GeneratedColumn<int> totalSessions = GeneratedColumn<int>(
    'total_sessions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _closedAtMeta = const VerificationMeta(
    'closedAt',
  );
  @override
  late final GeneratedColumn<DateTime> closedAt = GeneratedColumn<DateTime>(
    'closed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    totalSessions,
    status,
    createdAt,
    closedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pt_packages';
  @override
  VerificationContext validateIntegrity(
    Insertable<PtPackage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('total_sessions')) {
      context.handle(
        _totalSessionsMeta,
        totalSessions.isAcceptableOrUnknown(
          data['total_sessions']!,
          _totalSessionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalSessionsMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('closed_at')) {
      context.handle(
        _closedAtMeta,
        closedAt.isAcceptableOrUnknown(data['closed_at']!, _closedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PtPackage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PtPackage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      totalSessions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sessions'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      closedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}closed_at'],
      ),
    );
  }

  @override
  $PtPackagesTable createAlias(String alias) {
    return $PtPackagesTable(attachedDatabase, alias);
  }
}

class PtPackage extends DataClass implements Insertable<PtPackage> {
  final int id;
  final int clientId;
  final int totalSessions;
  final String status;
  final DateTime createdAt;
  final DateTime? closedAt;
  const PtPackage({
    required this.id,
    required this.clientId,
    required this.totalSessions,
    required this.status,
    required this.createdAt,
    this.closedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['total_sessions'] = Variable<int>(totalSessions);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || closedAt != null) {
      map['closed_at'] = Variable<DateTime>(closedAt);
    }
    return map;
  }

  PtPackagesCompanion toCompanion(bool nullToAbsent) {
    return PtPackagesCompanion(
      id: Value(id),
      clientId: Value(clientId),
      totalSessions: Value(totalSessions),
      status: Value(status),
      createdAt: Value(createdAt),
      closedAt: closedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(closedAt),
    );
  }

  factory PtPackage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PtPackage(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      totalSessions: serializer.fromJson<int>(json['totalSessions']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      closedAt: serializer.fromJson<DateTime?>(json['closedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'totalSessions': serializer.toJson<int>(totalSessions),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'closedAt': serializer.toJson<DateTime?>(closedAt),
    };
  }

  PtPackage copyWith({
    int? id,
    int? clientId,
    int? totalSessions,
    String? status,
    DateTime? createdAt,
    Value<DateTime?> closedAt = const Value.absent(),
  }) => PtPackage(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    totalSessions: totalSessions ?? this.totalSessions,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    closedAt: closedAt.present ? closedAt.value : this.closedAt,
  );
  PtPackage copyWithCompanion(PtPackagesCompanion data) {
    return PtPackage(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      totalSessions: data.totalSessions.present
          ? data.totalSessions.value
          : this.totalSessions,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      closedAt: data.closedAt.present ? data.closedAt.value : this.closedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PtPackage(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('totalSessions: $totalSessions, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('closedAt: $closedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, clientId, totalSessions, status, createdAt, closedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PtPackage &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.totalSessions == this.totalSessions &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.closedAt == this.closedAt);
}

class PtPackagesCompanion extends UpdateCompanion<PtPackage> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<int> totalSessions;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime?> closedAt;
  const PtPackagesCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.totalSessions = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.closedAt = const Value.absent(),
  });
  PtPackagesCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required int totalSessions,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.closedAt = const Value.absent(),
  }) : clientId = Value(clientId),
       totalSessions = Value(totalSessions);
  static Insertable<PtPackage> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<int>? totalSessions,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? closedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (totalSessions != null) 'total_sessions': totalSessions,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (closedAt != null) 'closed_at': closedAt,
    });
  }

  PtPackagesCompanion copyWith({
    Value<int>? id,
    Value<int>? clientId,
    Value<int>? totalSessions,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime?>? closedAt,
  }) {
    return PtPackagesCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      totalSessions: totalSessions ?? this.totalSessions,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      closedAt: closedAt ?? this.closedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (totalSessions.present) {
      map['total_sessions'] = Variable<int>(totalSessions.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (closedAt.present) {
      map['closed_at'] = Variable<DateTime>(closedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PtPackagesCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('totalSessions: $totalSessions, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('closedAt: $closedAt')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _packageIdMeta = const VerificationMeta(
    'packageId',
  );
  @override
  late final GeneratedColumn<int> packageId = GeneratedColumn<int>(
    'package_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pt_packages (id)',
    ),
  );
  static const VerificationMeta _sessionNumberMeta = const VerificationMeta(
    'sessionNumber',
  );
  @override
  late final GeneratedColumn<int> sessionNumber = GeneratedColumn<int>(
    'session_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('scheduled'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packageId,
    sessionNumber,
    scheduledAt,
    status,
    notes,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Session> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('package_id')) {
      context.handle(
        _packageIdMeta,
        packageId.isAcceptableOrUnknown(data['package_id']!, _packageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packageIdMeta);
    }
    if (data.containsKey('session_number')) {
      context.handle(
        _sessionNumberMeta,
        sessionNumber.isAcceptableOrUnknown(
          data['session_number']!,
          _sessionNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionNumberMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {packageId, sessionNumber},
  ];
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      packageId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}package_id'],
      )!,
      sessionNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_number'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int id;
  final int packageId;
  final int sessionNumber;
  final DateTime scheduledAt;
  final String status;
  final String notes;
  final DateTime? completedAt;
  const Session({
    required this.id,
    required this.packageId,
    required this.sessionNumber,
    required this.scheduledAt,
    required this.status,
    required this.notes,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['package_id'] = Variable<int>(packageId);
    map['session_number'] = Variable<int>(sessionNumber);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['status'] = Variable<String>(status);
    map['notes'] = Variable<String>(notes);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      packageId: Value(packageId),
      sessionNumber: Value(sessionNumber),
      scheduledAt: Value(scheduledAt),
      status: Value(status),
      notes: Value(notes),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory Session.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<int>(json['id']),
      packageId: serializer.fromJson<int>(json['packageId']),
      sessionNumber: serializer.fromJson<int>(json['sessionNumber']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String>(json['notes']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'packageId': serializer.toJson<int>(packageId),
      'sessionNumber': serializer.toJson<int>(sessionNumber),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String>(notes),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  Session copyWith({
    int? id,
    int? packageId,
    int? sessionNumber,
    DateTime? scheduledAt,
    String? status,
    String? notes,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => Session(
    id: id ?? this.id,
    packageId: packageId ?? this.packageId,
    sessionNumber: sessionNumber ?? this.sessionNumber,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    status: status ?? this.status,
    notes: notes ?? this.notes,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      packageId: data.packageId.present ? data.packageId.value : this.packageId,
      sessionNumber: data.sessionNumber.present
          ? data.sessionNumber.value
          : this.sessionNumber,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('packageId: $packageId, ')
          ..write('sessionNumber: $sessionNumber, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    packageId,
    sessionNumber,
    scheduledAt,
    status,
    notes,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.packageId == this.packageId &&
          other.sessionNumber == this.sessionNumber &&
          other.scheduledAt == this.scheduledAt &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.completedAt == this.completedAt);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> id;
  final Value<int> packageId;
  final Value<int> sessionNumber;
  final Value<DateTime> scheduledAt;
  final Value<String> status;
  final Value<String> notes;
  final Value<DateTime?> completedAt;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.packageId = const Value.absent(),
    this.sessionNumber = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.id = const Value.absent(),
    required int packageId,
    required int sessionNumber,
    required DateTime scheduledAt,
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
  }) : packageId = Value(packageId),
       sessionNumber = Value(sessionNumber),
       scheduledAt = Value(scheduledAt);
  static Insertable<Session> custom({
    Expression<int>? id,
    Expression<int>? packageId,
    Expression<int>? sessionNumber,
    Expression<DateTime>? scheduledAt,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packageId != null) 'package_id': packageId,
      if (sessionNumber != null) 'session_number': sessionNumber,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  SessionsCompanion copyWith({
    Value<int>? id,
    Value<int>? packageId,
    Value<int>? sessionNumber,
    Value<DateTime>? scheduledAt,
    Value<String>? status,
    Value<String>? notes,
    Value<DateTime?>? completedAt,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      packageId: packageId ?? this.packageId,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (packageId.present) {
      map['package_id'] = Variable<int>(packageId.value);
    }
    if (sessionNumber.present) {
      map['session_number'] = Variable<int>(sessionNumber.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('packageId: $packageId, ')
          ..write('sessionNumber: $sessionNumber, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $ExerciseCatalogTable extends ExerciseCatalog
    with TableInfo<$ExerciseCatalogTable, ExerciseCatalogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseCatalogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _externalIdMeta = const VerificationMeta(
    'externalId',
  );
  @override
  late final GeneratedColumn<int> externalId = GeneratedColumn<int>(
    'external_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    source,
    externalId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_catalog';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseCatalogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('external_id')) {
      context.handle(
        _externalIdMeta,
        externalId.isAcceptableOrUnknown(data['external_id']!, _externalIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name, category},
  ];
  @override
  ExerciseCatalogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseCatalogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      externalId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}external_id'],
      ),
    );
  }

  @override
  $ExerciseCatalogTable createAlias(String alias) {
    return $ExerciseCatalogTable(attachedDatabase, alias);
  }
}

class ExerciseCatalogData extends DataClass
    implements Insertable<ExerciseCatalogData> {
  final int id;
  final String name;
  final String category;
  final String source;
  final int? externalId;
  const ExerciseCatalogData({
    required this.id,
    required this.name,
    required this.category,
    required this.source,
    this.externalId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || externalId != null) {
      map['external_id'] = Variable<int>(externalId);
    }
    return map;
  }

  ExerciseCatalogCompanion toCompanion(bool nullToAbsent) {
    return ExerciseCatalogCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      source: Value(source),
      externalId: externalId == null && nullToAbsent
          ? const Value.absent()
          : Value(externalId),
    );
  }

  factory ExerciseCatalogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseCatalogData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      source: serializer.fromJson<String>(json['source']),
      externalId: serializer.fromJson<int?>(json['externalId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'source': serializer.toJson<String>(source),
      'externalId': serializer.toJson<int?>(externalId),
    };
  }

  ExerciseCatalogData copyWith({
    int? id,
    String? name,
    String? category,
    String? source,
    Value<int?> externalId = const Value.absent(),
  }) => ExerciseCatalogData(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    source: source ?? this.source,
    externalId: externalId.present ? externalId.value : this.externalId,
  );
  ExerciseCatalogData copyWithCompanion(ExerciseCatalogCompanion data) {
    return ExerciseCatalogData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      source: data.source.present ? data.source.value : this.source,
      externalId: data.externalId.present
          ? data.externalId.value
          : this.externalId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseCatalogData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('source: $source, ')
          ..write('externalId: $externalId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, category, source, externalId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseCatalogData &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.source == this.source &&
          other.externalId == this.externalId);
}

class ExerciseCatalogCompanion extends UpdateCompanion<ExerciseCatalogData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> source;
  final Value<int?> externalId;
  const ExerciseCatalogCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.source = const Value.absent(),
    this.externalId = const Value.absent(),
  });
  ExerciseCatalogCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    this.source = const Value.absent(),
    this.externalId = const Value.absent(),
  }) : name = Value(name),
       category = Value(category);
  static Insertable<ExerciseCatalogData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? source,
    Expression<int>? externalId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (source != null) 'source': source,
      if (externalId != null) 'external_id': externalId,
    });
  }

  ExerciseCatalogCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String>? source,
    Value<int?>? externalId,
  }) {
    return ExerciseCatalogCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      source: source ?? this.source,
      externalId: externalId ?? this.externalId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (externalId.present) {
      map['external_id'] = Variable<int>(externalId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseCatalogCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('source: $source, ')
          ..write('externalId: $externalId')
          ..write(')'))
        .toString();
  }
}

class $WorkoutLogsTable extends WorkoutLogs
    with TableInfo<$WorkoutLogsTable, WorkoutLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _packageIdMeta = const VerificationMeta(
    'packageId',
  );
  @override
  late final GeneratedColumn<int> packageId = GeneratedColumn<int>(
    'package_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pt_packages (id)',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sessions (id)',
    ),
  );
  static const VerificationMeta _performedAtMeta = const VerificationMeta(
    'performedAt',
  );
  @override
  late final GeneratedColumn<DateTime> performedAt = GeneratedColumn<DateTime>(
    'performed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    packageId,
    sessionId,
    performedAt,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('package_id')) {
      context.handle(
        _packageIdMeta,
        packageId.isAcceptableOrUnknown(data['package_id']!, _packageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packageIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    }
    if (data.containsKey('performed_at')) {
      context.handle(
        _performedAtMeta,
        performedAt.isAcceptableOrUnknown(
          data['performed_at']!,
          _performedAtMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      packageId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}package_id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      ),
      performedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}performed_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $WorkoutLogsTable createAlias(String alias) {
    return $WorkoutLogsTable(attachedDatabase, alias);
  }
}

class WorkoutLog extends DataClass implements Insertable<WorkoutLog> {
  final int id;
  final int clientId;
  final int packageId;
  final int? sessionId;
  final DateTime performedAt;
  final String notes;
  const WorkoutLog({
    required this.id,
    required this.clientId,
    required this.packageId,
    this.sessionId,
    required this.performedAt,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['package_id'] = Variable<int>(packageId);
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<int>(sessionId);
    }
    map['performed_at'] = Variable<DateTime>(performedAt);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  WorkoutLogsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutLogsCompanion(
      id: Value(id),
      clientId: Value(clientId),
      packageId: Value(packageId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      performedAt: Value(performedAt),
      notes: Value(notes),
    );
  }

  factory WorkoutLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutLog(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      packageId: serializer.fromJson<int>(json['packageId']),
      sessionId: serializer.fromJson<int?>(json['sessionId']),
      performedAt: serializer.fromJson<DateTime>(json['performedAt']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'packageId': serializer.toJson<int>(packageId),
      'sessionId': serializer.toJson<int?>(sessionId),
      'performedAt': serializer.toJson<DateTime>(performedAt),
      'notes': serializer.toJson<String>(notes),
    };
  }

  WorkoutLog copyWith({
    int? id,
    int? clientId,
    int? packageId,
    Value<int?> sessionId = const Value.absent(),
    DateTime? performedAt,
    String? notes,
  }) => WorkoutLog(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    packageId: packageId ?? this.packageId,
    sessionId: sessionId.present ? sessionId.value : this.sessionId,
    performedAt: performedAt ?? this.performedAt,
    notes: notes ?? this.notes,
  );
  WorkoutLog copyWithCompanion(WorkoutLogsCompanion data) {
    return WorkoutLog(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      packageId: data.packageId.present ? data.packageId.value : this.packageId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      performedAt: data.performedAt.present
          ? data.performedAt.value
          : this.performedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutLog(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('packageId: $packageId, ')
          ..write('sessionId: $sessionId, ')
          ..write('performedAt: $performedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, clientId, packageId, sessionId, performedAt, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutLog &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.packageId == this.packageId &&
          other.sessionId == this.sessionId &&
          other.performedAt == this.performedAt &&
          other.notes == this.notes);
}

class WorkoutLogsCompanion extends UpdateCompanion<WorkoutLog> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<int> packageId;
  final Value<int?> sessionId;
  final Value<DateTime> performedAt;
  final Value<String> notes;
  const WorkoutLogsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.packageId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.performedAt = const Value.absent(),
    this.notes = const Value.absent(),
  });
  WorkoutLogsCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required int packageId,
    this.sessionId = const Value.absent(),
    this.performedAt = const Value.absent(),
    this.notes = const Value.absent(),
  }) : clientId = Value(clientId),
       packageId = Value(packageId);
  static Insertable<WorkoutLog> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<int>? packageId,
    Expression<int>? sessionId,
    Expression<DateTime>? performedAt,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (packageId != null) 'package_id': packageId,
      if (sessionId != null) 'session_id': sessionId,
      if (performedAt != null) 'performed_at': performedAt,
      if (notes != null) 'notes': notes,
    });
  }

  WorkoutLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? clientId,
    Value<int>? packageId,
    Value<int?>? sessionId,
    Value<DateTime>? performedAt,
    Value<String>? notes,
  }) {
    return WorkoutLogsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      packageId: packageId ?? this.packageId,
      sessionId: sessionId ?? this.sessionId,
      performedAt: performedAt ?? this.performedAt,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (packageId.present) {
      map['package_id'] = Variable<int>(packageId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (performedAt.present) {
      map['performed_at'] = Variable<DateTime>(performedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutLogsCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('packageId: $packageId, ')
          ..write('sessionId: $sessionId, ')
          ..write('performedAt: $performedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $WorkoutExercisesTable extends WorkoutExercises
    with TableInfo<$WorkoutExercisesTable, WorkoutExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _logIdMeta = const VerificationMeta('logId');
  @override
  late final GeneratedColumn<int> logId = GeneratedColumn<int>(
    'log_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_logs (id)',
    ),
  );
  static const VerificationMeta _catalogIdMeta = const VerificationMeta(
    'catalogId',
  );
  @override
  late final GeneratedColumn<int> catalogId = GeneratedColumn<int>(
    'catalog_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercise_catalog (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _equipmentMeta = const VerificationMeta(
    'equipment',
  );
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
    'equipment',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Straight Set'),
  );
  static const VerificationMeta _groupKeyMeta = const VerificationMeta(
    'groupKey',
  );
  @override
  late final GeneratedColumn<String> groupKey = GeneratedColumn<String>(
    'group_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<double> rpe = GeneratedColumn<double>(
    'rpe',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rirMeta = const VerificationMeta('rir');
  @override
  late final GeneratedColumn<int> rir = GeneratedColumn<int>(
    'rir',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    logId,
    catalogId,
    name,
    equipment,
    method,
    groupKey,
    rpe,
    rir,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutExercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('log_id')) {
      context.handle(
        _logIdMeta,
        logId.isAcceptableOrUnknown(data['log_id']!, _logIdMeta),
      );
    } else if (isInserting) {
      context.missing(_logIdMeta);
    }
    if (data.containsKey('catalog_id')) {
      context.handle(
        _catalogIdMeta,
        catalogId.isAcceptableOrUnknown(data['catalog_id']!, _catalogIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('equipment')) {
      context.handle(
        _equipmentMeta,
        equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta),
      );
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    }
    if (data.containsKey('group_key')) {
      context.handle(
        _groupKeyMeta,
        groupKey.isAcceptableOrUnknown(data['group_key']!, _groupKeyMeta),
      );
    }
    if (data.containsKey('rpe')) {
      context.handle(
        _rpeMeta,
        rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta),
      );
    }
    if (data.containsKey('rir')) {
      context.handle(
        _rirMeta,
        rir.isAcceptableOrUnknown(data['rir']!, _rirMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutExercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      logId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}log_id'],
      )!,
      catalogId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}catalog_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      equipment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      groupKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_key'],
      ),
      rpe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rpe'],
      ),
      rir: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rir'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $WorkoutExercisesTable createAlias(String alias) {
    return $WorkoutExercisesTable(attachedDatabase, alias);
  }
}

class WorkoutExercise extends DataClass implements Insertable<WorkoutExercise> {
  final int id;
  final int logId;
  final int? catalogId;
  final String name;
  final String equipment;
  final String method;
  final String? groupKey;
  final double? rpe;
  final int? rir;
  final String notes;
  const WorkoutExercise({
    required this.id,
    required this.logId,
    this.catalogId,
    required this.name,
    required this.equipment,
    required this.method,
    this.groupKey,
    this.rpe,
    this.rir,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['log_id'] = Variable<int>(logId);
    if (!nullToAbsent || catalogId != null) {
      map['catalog_id'] = Variable<int>(catalogId);
    }
    map['name'] = Variable<String>(name);
    map['equipment'] = Variable<String>(equipment);
    map['method'] = Variable<String>(method);
    if (!nullToAbsent || groupKey != null) {
      map['group_key'] = Variable<String>(groupKey);
    }
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<double>(rpe);
    }
    if (!nullToAbsent || rir != null) {
      map['rir'] = Variable<int>(rir);
    }
    map['notes'] = Variable<String>(notes);
    return map;
  }

  WorkoutExercisesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutExercisesCompanion(
      id: Value(id),
      logId: Value(logId),
      catalogId: catalogId == null && nullToAbsent
          ? const Value.absent()
          : Value(catalogId),
      name: Value(name),
      equipment: Value(equipment),
      method: Value(method),
      groupKey: groupKey == null && nullToAbsent
          ? const Value.absent()
          : Value(groupKey),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      rir: rir == null && nullToAbsent ? const Value.absent() : Value(rir),
      notes: Value(notes),
    );
  }

  factory WorkoutExercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutExercise(
      id: serializer.fromJson<int>(json['id']),
      logId: serializer.fromJson<int>(json['logId']),
      catalogId: serializer.fromJson<int?>(json['catalogId']),
      name: serializer.fromJson<String>(json['name']),
      equipment: serializer.fromJson<String>(json['equipment']),
      method: serializer.fromJson<String>(json['method']),
      groupKey: serializer.fromJson<String?>(json['groupKey']),
      rpe: serializer.fromJson<double?>(json['rpe']),
      rir: serializer.fromJson<int?>(json['rir']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'logId': serializer.toJson<int>(logId),
      'catalogId': serializer.toJson<int?>(catalogId),
      'name': serializer.toJson<String>(name),
      'equipment': serializer.toJson<String>(equipment),
      'method': serializer.toJson<String>(method),
      'groupKey': serializer.toJson<String?>(groupKey),
      'rpe': serializer.toJson<double?>(rpe),
      'rir': serializer.toJson<int?>(rir),
      'notes': serializer.toJson<String>(notes),
    };
  }

  WorkoutExercise copyWith({
    int? id,
    int? logId,
    Value<int?> catalogId = const Value.absent(),
    String? name,
    String? equipment,
    String? method,
    Value<String?> groupKey = const Value.absent(),
    Value<double?> rpe = const Value.absent(),
    Value<int?> rir = const Value.absent(),
    String? notes,
  }) => WorkoutExercise(
    id: id ?? this.id,
    logId: logId ?? this.logId,
    catalogId: catalogId.present ? catalogId.value : this.catalogId,
    name: name ?? this.name,
    equipment: equipment ?? this.equipment,
    method: method ?? this.method,
    groupKey: groupKey.present ? groupKey.value : this.groupKey,
    rpe: rpe.present ? rpe.value : this.rpe,
    rir: rir.present ? rir.value : this.rir,
    notes: notes ?? this.notes,
  );
  WorkoutExercise copyWithCompanion(WorkoutExercisesCompanion data) {
    return WorkoutExercise(
      id: data.id.present ? data.id.value : this.id,
      logId: data.logId.present ? data.logId.value : this.logId,
      catalogId: data.catalogId.present ? data.catalogId.value : this.catalogId,
      name: data.name.present ? data.name.value : this.name,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      method: data.method.present ? data.method.value : this.method,
      groupKey: data.groupKey.present ? data.groupKey.value : this.groupKey,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      rir: data.rir.present ? data.rir.value : this.rir,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutExercise(')
          ..write('id: $id, ')
          ..write('logId: $logId, ')
          ..write('catalogId: $catalogId, ')
          ..write('name: $name, ')
          ..write('equipment: $equipment, ')
          ..write('method: $method, ')
          ..write('groupKey: $groupKey, ')
          ..write('rpe: $rpe, ')
          ..write('rir: $rir, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    logId,
    catalogId,
    name,
    equipment,
    method,
    groupKey,
    rpe,
    rir,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutExercise &&
          other.id == this.id &&
          other.logId == this.logId &&
          other.catalogId == this.catalogId &&
          other.name == this.name &&
          other.equipment == this.equipment &&
          other.method == this.method &&
          other.groupKey == this.groupKey &&
          other.rpe == this.rpe &&
          other.rir == this.rir &&
          other.notes == this.notes);
}

class WorkoutExercisesCompanion extends UpdateCompanion<WorkoutExercise> {
  final Value<int> id;
  final Value<int> logId;
  final Value<int?> catalogId;
  final Value<String> name;
  final Value<String> equipment;
  final Value<String> method;
  final Value<String?> groupKey;
  final Value<double?> rpe;
  final Value<int?> rir;
  final Value<String> notes;
  const WorkoutExercisesCompanion({
    this.id = const Value.absent(),
    this.logId = const Value.absent(),
    this.catalogId = const Value.absent(),
    this.name = const Value.absent(),
    this.equipment = const Value.absent(),
    this.method = const Value.absent(),
    this.groupKey = const Value.absent(),
    this.rpe = const Value.absent(),
    this.rir = const Value.absent(),
    this.notes = const Value.absent(),
  });
  WorkoutExercisesCompanion.insert({
    this.id = const Value.absent(),
    required int logId,
    this.catalogId = const Value.absent(),
    required String name,
    this.equipment = const Value.absent(),
    this.method = const Value.absent(),
    this.groupKey = const Value.absent(),
    this.rpe = const Value.absent(),
    this.rir = const Value.absent(),
    this.notes = const Value.absent(),
  }) : logId = Value(logId),
       name = Value(name);
  static Insertable<WorkoutExercise> custom({
    Expression<int>? id,
    Expression<int>? logId,
    Expression<int>? catalogId,
    Expression<String>? name,
    Expression<String>? equipment,
    Expression<String>? method,
    Expression<String>? groupKey,
    Expression<double>? rpe,
    Expression<int>? rir,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (logId != null) 'log_id': logId,
      if (catalogId != null) 'catalog_id': catalogId,
      if (name != null) 'name': name,
      if (equipment != null) 'equipment': equipment,
      if (method != null) 'method': method,
      if (groupKey != null) 'group_key': groupKey,
      if (rpe != null) 'rpe': rpe,
      if (rir != null) 'rir': rir,
      if (notes != null) 'notes': notes,
    });
  }

  WorkoutExercisesCompanion copyWith({
    Value<int>? id,
    Value<int>? logId,
    Value<int?>? catalogId,
    Value<String>? name,
    Value<String>? equipment,
    Value<String>? method,
    Value<String?>? groupKey,
    Value<double?>? rpe,
    Value<int?>? rir,
    Value<String>? notes,
  }) {
    return WorkoutExercisesCompanion(
      id: id ?? this.id,
      logId: logId ?? this.logId,
      catalogId: catalogId ?? this.catalogId,
      name: name ?? this.name,
      equipment: equipment ?? this.equipment,
      method: method ?? this.method,
      groupKey: groupKey ?? this.groupKey,
      rpe: rpe ?? this.rpe,
      rir: rir ?? this.rir,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (logId.present) {
      map['log_id'] = Variable<int>(logId.value);
    }
    if (catalogId.present) {
      map['catalog_id'] = Variable<int>(catalogId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (groupKey.present) {
      map['group_key'] = Variable<String>(groupKey.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<double>(rpe.value);
    }
    if (rir.present) {
      map['rir'] = Variable<int>(rir.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutExercisesCompanion(')
          ..write('id: $id, ')
          ..write('logId: $logId, ')
          ..write('catalogId: $catalogId, ')
          ..write('name: $name, ')
          ..write('equipment: $equipment, ')
          ..write('method: $method, ')
          ..write('groupKey: $groupKey, ')
          ..write('rpe: $rpe, ')
          ..write('rir: $rir, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSetsTable extends WorkoutSets
    with TableInfo<$WorkoutSetsTable, WorkoutSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_exercises (id)',
    ),
  );
  static const VerificationMeta _setNumberMeta = const VerificationMeta(
    'setNumber',
  );
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
    'set_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stageMeta = const VerificationMeta('stage');
  @override
  late final GeneratedColumn<int> stage = GeneratedColumn<int>(
    'stage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    exerciseId,
    setNumber,
    stage,
    reps,
    weightKg,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(
        _setNumberMeta,
        setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('stage')) {
      context.handle(
        _stageMeta,
        stage.isAcceptableOrUnknown(data['stage']!, _stageMeta),
      );
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_id'],
      )!,
      setNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_number'],
      )!,
      stage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stage'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
    );
  }

  @override
  $WorkoutSetsTable createAlias(String alias) {
    return $WorkoutSetsTable(attachedDatabase, alias);
  }
}

class WorkoutSet extends DataClass implements Insertable<WorkoutSet> {
  final int id;
  final int exerciseId;
  final int setNumber;
  final int stage;
  final int reps;
  final double? weightKg;
  const WorkoutSet({
    required this.id,
    required this.exerciseId,
    required this.setNumber,
    required this.stage,
    required this.reps,
    this.weightKg,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['set_number'] = Variable<int>(setNumber);
    map['stage'] = Variable<int>(stage);
    map['reps'] = Variable<int>(reps);
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    return map;
  }

  WorkoutSetsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSetsCompanion(
      id: Value(id),
      exerciseId: Value(exerciseId),
      setNumber: Value(setNumber),
      stage: Value(stage),
      reps: Value(reps),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
    );
  }

  factory WorkoutSet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSet(
      id: serializer.fromJson<int>(json['id']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      stage: serializer.fromJson<int>(json['stage']),
      reps: serializer.fromJson<int>(json['reps']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'setNumber': serializer.toJson<int>(setNumber),
      'stage': serializer.toJson<int>(stage),
      'reps': serializer.toJson<int>(reps),
      'weightKg': serializer.toJson<double?>(weightKg),
    };
  }

  WorkoutSet copyWith({
    int? id,
    int? exerciseId,
    int? setNumber,
    int? stage,
    int? reps,
    Value<double?> weightKg = const Value.absent(),
  }) => WorkoutSet(
    id: id ?? this.id,
    exerciseId: exerciseId ?? this.exerciseId,
    setNumber: setNumber ?? this.setNumber,
    stage: stage ?? this.stage,
    reps: reps ?? this.reps,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
  );
  WorkoutSet copyWithCompanion(WorkoutSetsCompanion data) {
    return WorkoutSet(
      id: data.id.present ? data.id.value : this.id,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      stage: data.stage.present ? data.stage.value : this.stage,
      reps: data.reps.present ? data.reps.value : this.reps,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSet(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('stage: $stage, ')
          ..write('reps: $reps, ')
          ..write('weightKg: $weightKg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, exerciseId, setNumber, stage, reps, weightKg);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSet &&
          other.id == this.id &&
          other.exerciseId == this.exerciseId &&
          other.setNumber == this.setNumber &&
          other.stage == this.stage &&
          other.reps == this.reps &&
          other.weightKg == this.weightKg);
}

class WorkoutSetsCompanion extends UpdateCompanion<WorkoutSet> {
  final Value<int> id;
  final Value<int> exerciseId;
  final Value<int> setNumber;
  final Value<int> stage;
  final Value<int> reps;
  final Value<double?> weightKg;
  const WorkoutSetsCompanion({
    this.id = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.stage = const Value.absent(),
    this.reps = const Value.absent(),
    this.weightKg = const Value.absent(),
  });
  WorkoutSetsCompanion.insert({
    this.id = const Value.absent(),
    required int exerciseId,
    required int setNumber,
    this.stage = const Value.absent(),
    required int reps,
    this.weightKg = const Value.absent(),
  }) : exerciseId = Value(exerciseId),
       setNumber = Value(setNumber),
       reps = Value(reps);
  static Insertable<WorkoutSet> custom({
    Expression<int>? id,
    Expression<int>? exerciseId,
    Expression<int>? setNumber,
    Expression<int>? stage,
    Expression<int>? reps,
    Expression<double>? weightKg,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (setNumber != null) 'set_number': setNumber,
      if (stage != null) 'stage': stage,
      if (reps != null) 'reps': reps,
      if (weightKg != null) 'weight_kg': weightKg,
    });
  }

  WorkoutSetsCompanion copyWith({
    Value<int>? id,
    Value<int>? exerciseId,
    Value<int>? setNumber,
    Value<int>? stage,
    Value<int>? reps,
    Value<double?>? weightKg,
  }) {
    return WorkoutSetsCompanion(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      setNumber: setNumber ?? this.setNumber,
      stage: stage ?? this.stage,
      reps: reps ?? this.reps,
      weightKg: weightKg ?? this.weightKg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (stage.present) {
      map['stage'] = Variable<int>(stage.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSetsCompanion(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('stage: $stage, ')
          ..write('reps: $reps, ')
          ..write('weightKg: $weightKg')
          ..write(')'))
        .toString();
  }
}

class $PostPtEvaluationsTable extends PostPtEvaluations
    with TableInfo<$PostPtEvaluationsTable, PostPtEvaluation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostPtEvaluationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _packageIdMeta = const VerificationMeta(
    'packageId',
  );
  @override
  late final GeneratedColumn<int> packageId = GeneratedColumn<int>(
    'package_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES pt_packages (id)',
    ),
  );
  static const VerificationMeta _finalWeightKgMeta = const VerificationMeta(
    'finalWeightKg',
  );
  @override
  late final GeneratedColumn<double> finalWeightKg = GeneratedColumn<double>(
    'final_weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bodyFatStartMeta = const VerificationMeta(
    'bodyFatStart',
  );
  @override
  late final GeneratedColumn<double> bodyFatStart = GeneratedColumn<double>(
    'body_fat_start',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bodyFatEndMeta = const VerificationMeta(
    'bodyFatEnd',
  );
  @override
  late final GeneratedColumn<double> bodyFatEnd = GeneratedColumn<double>(
    'body_fat_end',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _muscleStartMeta = const VerificationMeta(
    'muscleStart',
  );
  @override
  late final GeneratedColumn<double> muscleStart = GeneratedColumn<double>(
    'muscle_start',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _muscleEndMeta = const VerificationMeta(
    'muscleEnd',
  );
  @override
  late final GeneratedColumn<double> muscleEnd = GeneratedColumn<double>(
    'muscle_end',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _armRightMeta = const VerificationMeta(
    'armRight',
  );
  @override
  late final GeneratedColumn<double> armRight = GeneratedColumn<double>(
    'arm_right',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _armLeftMeta = const VerificationMeta(
    'armLeft',
  );
  @override
  late final GeneratedColumn<double> armLeft = GeneratedColumn<double>(
    'arm_left',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thighRightMeta = const VerificationMeta(
    'thighRight',
  );
  @override
  late final GeneratedColumn<double> thighRight = GeneratedColumn<double>(
    'thigh_right',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thighLeftMeta = const VerificationMeta(
    'thighLeft',
  );
  @override
  late final GeneratedColumn<double> thighLeft = GeneratedColumn<double>(
    'thigh_left',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _achievementMeta = const VerificationMeta(
    'achievement',
  );
  @override
  late final GeneratedColumn<String> achievement = GeneratedColumn<String>(
    'achievement',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _evaluationMeta = const VerificationMeta(
    'evaluation',
  );
  @override
  late final GeneratedColumn<String> evaluation = GeneratedColumn<String>(
    'evaluation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recommendationMeta = const VerificationMeta(
    'recommendation',
  );
  @override
  late final GeneratedColumn<String> recommendation = GeneratedColumn<String>(
    'recommendation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conclusionMeta = const VerificationMeta(
    'conclusion',
  );
  @override
  late final GeneratedColumn<String> conclusion = GeneratedColumn<String>(
    'conclusion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finalizedAtMeta = const VerificationMeta(
    'finalizedAt',
  );
  @override
  late final GeneratedColumn<DateTime> finalizedAt = GeneratedColumn<DateTime>(
    'finalized_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packageId,
    finalWeightKg,
    bodyFatStart,
    bodyFatEnd,
    muscleStart,
    muscleEnd,
    armRight,
    armLeft,
    thighRight,
    thighLeft,
    achievement,
    evaluation,
    recommendation,
    conclusion,
    finalizedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'post_pt_evaluations';
  @override
  VerificationContext validateIntegrity(
    Insertable<PostPtEvaluation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('package_id')) {
      context.handle(
        _packageIdMeta,
        packageId.isAcceptableOrUnknown(data['package_id']!, _packageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packageIdMeta);
    }
    if (data.containsKey('final_weight_kg')) {
      context.handle(
        _finalWeightKgMeta,
        finalWeightKg.isAcceptableOrUnknown(
          data['final_weight_kg']!,
          _finalWeightKgMeta,
        ),
      );
    }
    if (data.containsKey('body_fat_start')) {
      context.handle(
        _bodyFatStartMeta,
        bodyFatStart.isAcceptableOrUnknown(
          data['body_fat_start']!,
          _bodyFatStartMeta,
        ),
      );
    }
    if (data.containsKey('body_fat_end')) {
      context.handle(
        _bodyFatEndMeta,
        bodyFatEnd.isAcceptableOrUnknown(
          data['body_fat_end']!,
          _bodyFatEndMeta,
        ),
      );
    }
    if (data.containsKey('muscle_start')) {
      context.handle(
        _muscleStartMeta,
        muscleStart.isAcceptableOrUnknown(
          data['muscle_start']!,
          _muscleStartMeta,
        ),
      );
    }
    if (data.containsKey('muscle_end')) {
      context.handle(
        _muscleEndMeta,
        muscleEnd.isAcceptableOrUnknown(data['muscle_end']!, _muscleEndMeta),
      );
    }
    if (data.containsKey('arm_right')) {
      context.handle(
        _armRightMeta,
        armRight.isAcceptableOrUnknown(data['arm_right']!, _armRightMeta),
      );
    }
    if (data.containsKey('arm_left')) {
      context.handle(
        _armLeftMeta,
        armLeft.isAcceptableOrUnknown(data['arm_left']!, _armLeftMeta),
      );
    }
    if (data.containsKey('thigh_right')) {
      context.handle(
        _thighRightMeta,
        thighRight.isAcceptableOrUnknown(data['thigh_right']!, _thighRightMeta),
      );
    }
    if (data.containsKey('thigh_left')) {
      context.handle(
        _thighLeftMeta,
        thighLeft.isAcceptableOrUnknown(data['thigh_left']!, _thighLeftMeta),
      );
    }
    if (data.containsKey('achievement')) {
      context.handle(
        _achievementMeta,
        achievement.isAcceptableOrUnknown(
          data['achievement']!,
          _achievementMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_achievementMeta);
    }
    if (data.containsKey('evaluation')) {
      context.handle(
        _evaluationMeta,
        evaluation.isAcceptableOrUnknown(data['evaluation']!, _evaluationMeta),
      );
    } else if (isInserting) {
      context.missing(_evaluationMeta);
    }
    if (data.containsKey('recommendation')) {
      context.handle(
        _recommendationMeta,
        recommendation.isAcceptableOrUnknown(
          data['recommendation']!,
          _recommendationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recommendationMeta);
    }
    if (data.containsKey('conclusion')) {
      context.handle(
        _conclusionMeta,
        conclusion.isAcceptableOrUnknown(data['conclusion']!, _conclusionMeta),
      );
    } else if (isInserting) {
      context.missing(_conclusionMeta);
    }
    if (data.containsKey('finalized_at')) {
      context.handle(
        _finalizedAtMeta,
        finalizedAt.isAcceptableOrUnknown(
          data['finalized_at']!,
          _finalizedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostPtEvaluation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostPtEvaluation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      packageId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}package_id'],
      )!,
      finalWeightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}final_weight_kg'],
      ),
      bodyFatStart: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}body_fat_start'],
      ),
      bodyFatEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}body_fat_end'],
      ),
      muscleStart: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}muscle_start'],
      ),
      muscleEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}muscle_end'],
      ),
      armRight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}arm_right'],
      ),
      armLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}arm_left'],
      ),
      thighRight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}thigh_right'],
      ),
      thighLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}thigh_left'],
      ),
      achievement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievement'],
      )!,
      evaluation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evaluation'],
      )!,
      recommendation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recommendation'],
      )!,
      conclusion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conclusion'],
      )!,
      finalizedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}finalized_at'],
      )!,
    );
  }

  @override
  $PostPtEvaluationsTable createAlias(String alias) {
    return $PostPtEvaluationsTable(attachedDatabase, alias);
  }
}

class PostPtEvaluation extends DataClass
    implements Insertable<PostPtEvaluation> {
  final int id;
  final int packageId;
  final double? finalWeightKg;
  final double? bodyFatStart;
  final double? bodyFatEnd;
  final double? muscleStart;
  final double? muscleEnd;
  final double? armRight;
  final double? armLeft;
  final double? thighRight;
  final double? thighLeft;
  final String achievement;
  final String evaluation;
  final String recommendation;
  final String conclusion;
  final DateTime finalizedAt;
  const PostPtEvaluation({
    required this.id,
    required this.packageId,
    this.finalWeightKg,
    this.bodyFatStart,
    this.bodyFatEnd,
    this.muscleStart,
    this.muscleEnd,
    this.armRight,
    this.armLeft,
    this.thighRight,
    this.thighLeft,
    required this.achievement,
    required this.evaluation,
    required this.recommendation,
    required this.conclusion,
    required this.finalizedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['package_id'] = Variable<int>(packageId);
    if (!nullToAbsent || finalWeightKg != null) {
      map['final_weight_kg'] = Variable<double>(finalWeightKg);
    }
    if (!nullToAbsent || bodyFatStart != null) {
      map['body_fat_start'] = Variable<double>(bodyFatStart);
    }
    if (!nullToAbsent || bodyFatEnd != null) {
      map['body_fat_end'] = Variable<double>(bodyFatEnd);
    }
    if (!nullToAbsent || muscleStart != null) {
      map['muscle_start'] = Variable<double>(muscleStart);
    }
    if (!nullToAbsent || muscleEnd != null) {
      map['muscle_end'] = Variable<double>(muscleEnd);
    }
    if (!nullToAbsent || armRight != null) {
      map['arm_right'] = Variable<double>(armRight);
    }
    if (!nullToAbsent || armLeft != null) {
      map['arm_left'] = Variable<double>(armLeft);
    }
    if (!nullToAbsent || thighRight != null) {
      map['thigh_right'] = Variable<double>(thighRight);
    }
    if (!nullToAbsent || thighLeft != null) {
      map['thigh_left'] = Variable<double>(thighLeft);
    }
    map['achievement'] = Variable<String>(achievement);
    map['evaluation'] = Variable<String>(evaluation);
    map['recommendation'] = Variable<String>(recommendation);
    map['conclusion'] = Variable<String>(conclusion);
    map['finalized_at'] = Variable<DateTime>(finalizedAt);
    return map;
  }

  PostPtEvaluationsCompanion toCompanion(bool nullToAbsent) {
    return PostPtEvaluationsCompanion(
      id: Value(id),
      packageId: Value(packageId),
      finalWeightKg: finalWeightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(finalWeightKg),
      bodyFatStart: bodyFatStart == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFatStart),
      bodyFatEnd: bodyFatEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFatEnd),
      muscleStart: muscleStart == null && nullToAbsent
          ? const Value.absent()
          : Value(muscleStart),
      muscleEnd: muscleEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(muscleEnd),
      armRight: armRight == null && nullToAbsent
          ? const Value.absent()
          : Value(armRight),
      armLeft: armLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(armLeft),
      thighRight: thighRight == null && nullToAbsent
          ? const Value.absent()
          : Value(thighRight),
      thighLeft: thighLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(thighLeft),
      achievement: Value(achievement),
      evaluation: Value(evaluation),
      recommendation: Value(recommendation),
      conclusion: Value(conclusion),
      finalizedAt: Value(finalizedAt),
    );
  }

  factory PostPtEvaluation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostPtEvaluation(
      id: serializer.fromJson<int>(json['id']),
      packageId: serializer.fromJson<int>(json['packageId']),
      finalWeightKg: serializer.fromJson<double?>(json['finalWeightKg']),
      bodyFatStart: serializer.fromJson<double?>(json['bodyFatStart']),
      bodyFatEnd: serializer.fromJson<double?>(json['bodyFatEnd']),
      muscleStart: serializer.fromJson<double?>(json['muscleStart']),
      muscleEnd: serializer.fromJson<double?>(json['muscleEnd']),
      armRight: serializer.fromJson<double?>(json['armRight']),
      armLeft: serializer.fromJson<double?>(json['armLeft']),
      thighRight: serializer.fromJson<double?>(json['thighRight']),
      thighLeft: serializer.fromJson<double?>(json['thighLeft']),
      achievement: serializer.fromJson<String>(json['achievement']),
      evaluation: serializer.fromJson<String>(json['evaluation']),
      recommendation: serializer.fromJson<String>(json['recommendation']),
      conclusion: serializer.fromJson<String>(json['conclusion']),
      finalizedAt: serializer.fromJson<DateTime>(json['finalizedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'packageId': serializer.toJson<int>(packageId),
      'finalWeightKg': serializer.toJson<double?>(finalWeightKg),
      'bodyFatStart': serializer.toJson<double?>(bodyFatStart),
      'bodyFatEnd': serializer.toJson<double?>(bodyFatEnd),
      'muscleStart': serializer.toJson<double?>(muscleStart),
      'muscleEnd': serializer.toJson<double?>(muscleEnd),
      'armRight': serializer.toJson<double?>(armRight),
      'armLeft': serializer.toJson<double?>(armLeft),
      'thighRight': serializer.toJson<double?>(thighRight),
      'thighLeft': serializer.toJson<double?>(thighLeft),
      'achievement': serializer.toJson<String>(achievement),
      'evaluation': serializer.toJson<String>(evaluation),
      'recommendation': serializer.toJson<String>(recommendation),
      'conclusion': serializer.toJson<String>(conclusion),
      'finalizedAt': serializer.toJson<DateTime>(finalizedAt),
    };
  }

  PostPtEvaluation copyWith({
    int? id,
    int? packageId,
    Value<double?> finalWeightKg = const Value.absent(),
    Value<double?> bodyFatStart = const Value.absent(),
    Value<double?> bodyFatEnd = const Value.absent(),
    Value<double?> muscleStart = const Value.absent(),
    Value<double?> muscleEnd = const Value.absent(),
    Value<double?> armRight = const Value.absent(),
    Value<double?> armLeft = const Value.absent(),
    Value<double?> thighRight = const Value.absent(),
    Value<double?> thighLeft = const Value.absent(),
    String? achievement,
    String? evaluation,
    String? recommendation,
    String? conclusion,
    DateTime? finalizedAt,
  }) => PostPtEvaluation(
    id: id ?? this.id,
    packageId: packageId ?? this.packageId,
    finalWeightKg: finalWeightKg.present
        ? finalWeightKg.value
        : this.finalWeightKg,
    bodyFatStart: bodyFatStart.present ? bodyFatStart.value : this.bodyFatStart,
    bodyFatEnd: bodyFatEnd.present ? bodyFatEnd.value : this.bodyFatEnd,
    muscleStart: muscleStart.present ? muscleStart.value : this.muscleStart,
    muscleEnd: muscleEnd.present ? muscleEnd.value : this.muscleEnd,
    armRight: armRight.present ? armRight.value : this.armRight,
    armLeft: armLeft.present ? armLeft.value : this.armLeft,
    thighRight: thighRight.present ? thighRight.value : this.thighRight,
    thighLeft: thighLeft.present ? thighLeft.value : this.thighLeft,
    achievement: achievement ?? this.achievement,
    evaluation: evaluation ?? this.evaluation,
    recommendation: recommendation ?? this.recommendation,
    conclusion: conclusion ?? this.conclusion,
    finalizedAt: finalizedAt ?? this.finalizedAt,
  );
  PostPtEvaluation copyWithCompanion(PostPtEvaluationsCompanion data) {
    return PostPtEvaluation(
      id: data.id.present ? data.id.value : this.id,
      packageId: data.packageId.present ? data.packageId.value : this.packageId,
      finalWeightKg: data.finalWeightKg.present
          ? data.finalWeightKg.value
          : this.finalWeightKg,
      bodyFatStart: data.bodyFatStart.present
          ? data.bodyFatStart.value
          : this.bodyFatStart,
      bodyFatEnd: data.bodyFatEnd.present
          ? data.bodyFatEnd.value
          : this.bodyFatEnd,
      muscleStart: data.muscleStart.present
          ? data.muscleStart.value
          : this.muscleStart,
      muscleEnd: data.muscleEnd.present ? data.muscleEnd.value : this.muscleEnd,
      armRight: data.armRight.present ? data.armRight.value : this.armRight,
      armLeft: data.armLeft.present ? data.armLeft.value : this.armLeft,
      thighRight: data.thighRight.present
          ? data.thighRight.value
          : this.thighRight,
      thighLeft: data.thighLeft.present ? data.thighLeft.value : this.thighLeft,
      achievement: data.achievement.present
          ? data.achievement.value
          : this.achievement,
      evaluation: data.evaluation.present
          ? data.evaluation.value
          : this.evaluation,
      recommendation: data.recommendation.present
          ? data.recommendation.value
          : this.recommendation,
      conclusion: data.conclusion.present
          ? data.conclusion.value
          : this.conclusion,
      finalizedAt: data.finalizedAt.present
          ? data.finalizedAt.value
          : this.finalizedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PostPtEvaluation(')
          ..write('id: $id, ')
          ..write('packageId: $packageId, ')
          ..write('finalWeightKg: $finalWeightKg, ')
          ..write('bodyFatStart: $bodyFatStart, ')
          ..write('bodyFatEnd: $bodyFatEnd, ')
          ..write('muscleStart: $muscleStart, ')
          ..write('muscleEnd: $muscleEnd, ')
          ..write('armRight: $armRight, ')
          ..write('armLeft: $armLeft, ')
          ..write('thighRight: $thighRight, ')
          ..write('thighLeft: $thighLeft, ')
          ..write('achievement: $achievement, ')
          ..write('evaluation: $evaluation, ')
          ..write('recommendation: $recommendation, ')
          ..write('conclusion: $conclusion, ')
          ..write('finalizedAt: $finalizedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    packageId,
    finalWeightKg,
    bodyFatStart,
    bodyFatEnd,
    muscleStart,
    muscleEnd,
    armRight,
    armLeft,
    thighRight,
    thighLeft,
    achievement,
    evaluation,
    recommendation,
    conclusion,
    finalizedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostPtEvaluation &&
          other.id == this.id &&
          other.packageId == this.packageId &&
          other.finalWeightKg == this.finalWeightKg &&
          other.bodyFatStart == this.bodyFatStart &&
          other.bodyFatEnd == this.bodyFatEnd &&
          other.muscleStart == this.muscleStart &&
          other.muscleEnd == this.muscleEnd &&
          other.armRight == this.armRight &&
          other.armLeft == this.armLeft &&
          other.thighRight == this.thighRight &&
          other.thighLeft == this.thighLeft &&
          other.achievement == this.achievement &&
          other.evaluation == this.evaluation &&
          other.recommendation == this.recommendation &&
          other.conclusion == this.conclusion &&
          other.finalizedAt == this.finalizedAt);
}

class PostPtEvaluationsCompanion extends UpdateCompanion<PostPtEvaluation> {
  final Value<int> id;
  final Value<int> packageId;
  final Value<double?> finalWeightKg;
  final Value<double?> bodyFatStart;
  final Value<double?> bodyFatEnd;
  final Value<double?> muscleStart;
  final Value<double?> muscleEnd;
  final Value<double?> armRight;
  final Value<double?> armLeft;
  final Value<double?> thighRight;
  final Value<double?> thighLeft;
  final Value<String> achievement;
  final Value<String> evaluation;
  final Value<String> recommendation;
  final Value<String> conclusion;
  final Value<DateTime> finalizedAt;
  const PostPtEvaluationsCompanion({
    this.id = const Value.absent(),
    this.packageId = const Value.absent(),
    this.finalWeightKg = const Value.absent(),
    this.bodyFatStart = const Value.absent(),
    this.bodyFatEnd = const Value.absent(),
    this.muscleStart = const Value.absent(),
    this.muscleEnd = const Value.absent(),
    this.armRight = const Value.absent(),
    this.armLeft = const Value.absent(),
    this.thighRight = const Value.absent(),
    this.thighLeft = const Value.absent(),
    this.achievement = const Value.absent(),
    this.evaluation = const Value.absent(),
    this.recommendation = const Value.absent(),
    this.conclusion = const Value.absent(),
    this.finalizedAt = const Value.absent(),
  });
  PostPtEvaluationsCompanion.insert({
    this.id = const Value.absent(),
    required int packageId,
    this.finalWeightKg = const Value.absent(),
    this.bodyFatStart = const Value.absent(),
    this.bodyFatEnd = const Value.absent(),
    this.muscleStart = const Value.absent(),
    this.muscleEnd = const Value.absent(),
    this.armRight = const Value.absent(),
    this.armLeft = const Value.absent(),
    this.thighRight = const Value.absent(),
    this.thighLeft = const Value.absent(),
    required String achievement,
    required String evaluation,
    required String recommendation,
    required String conclusion,
    this.finalizedAt = const Value.absent(),
  }) : packageId = Value(packageId),
       achievement = Value(achievement),
       evaluation = Value(evaluation),
       recommendation = Value(recommendation),
       conclusion = Value(conclusion);
  static Insertable<PostPtEvaluation> custom({
    Expression<int>? id,
    Expression<int>? packageId,
    Expression<double>? finalWeightKg,
    Expression<double>? bodyFatStart,
    Expression<double>? bodyFatEnd,
    Expression<double>? muscleStart,
    Expression<double>? muscleEnd,
    Expression<double>? armRight,
    Expression<double>? armLeft,
    Expression<double>? thighRight,
    Expression<double>? thighLeft,
    Expression<String>? achievement,
    Expression<String>? evaluation,
    Expression<String>? recommendation,
    Expression<String>? conclusion,
    Expression<DateTime>? finalizedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packageId != null) 'package_id': packageId,
      if (finalWeightKg != null) 'final_weight_kg': finalWeightKg,
      if (bodyFatStart != null) 'body_fat_start': bodyFatStart,
      if (bodyFatEnd != null) 'body_fat_end': bodyFatEnd,
      if (muscleStart != null) 'muscle_start': muscleStart,
      if (muscleEnd != null) 'muscle_end': muscleEnd,
      if (armRight != null) 'arm_right': armRight,
      if (armLeft != null) 'arm_left': armLeft,
      if (thighRight != null) 'thigh_right': thighRight,
      if (thighLeft != null) 'thigh_left': thighLeft,
      if (achievement != null) 'achievement': achievement,
      if (evaluation != null) 'evaluation': evaluation,
      if (recommendation != null) 'recommendation': recommendation,
      if (conclusion != null) 'conclusion': conclusion,
      if (finalizedAt != null) 'finalized_at': finalizedAt,
    });
  }

  PostPtEvaluationsCompanion copyWith({
    Value<int>? id,
    Value<int>? packageId,
    Value<double?>? finalWeightKg,
    Value<double?>? bodyFatStart,
    Value<double?>? bodyFatEnd,
    Value<double?>? muscleStart,
    Value<double?>? muscleEnd,
    Value<double?>? armRight,
    Value<double?>? armLeft,
    Value<double?>? thighRight,
    Value<double?>? thighLeft,
    Value<String>? achievement,
    Value<String>? evaluation,
    Value<String>? recommendation,
    Value<String>? conclusion,
    Value<DateTime>? finalizedAt,
  }) {
    return PostPtEvaluationsCompanion(
      id: id ?? this.id,
      packageId: packageId ?? this.packageId,
      finalWeightKg: finalWeightKg ?? this.finalWeightKg,
      bodyFatStart: bodyFatStart ?? this.bodyFatStart,
      bodyFatEnd: bodyFatEnd ?? this.bodyFatEnd,
      muscleStart: muscleStart ?? this.muscleStart,
      muscleEnd: muscleEnd ?? this.muscleEnd,
      armRight: armRight ?? this.armRight,
      armLeft: armLeft ?? this.armLeft,
      thighRight: thighRight ?? this.thighRight,
      thighLeft: thighLeft ?? this.thighLeft,
      achievement: achievement ?? this.achievement,
      evaluation: evaluation ?? this.evaluation,
      recommendation: recommendation ?? this.recommendation,
      conclusion: conclusion ?? this.conclusion,
      finalizedAt: finalizedAt ?? this.finalizedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (packageId.present) {
      map['package_id'] = Variable<int>(packageId.value);
    }
    if (finalWeightKg.present) {
      map['final_weight_kg'] = Variable<double>(finalWeightKg.value);
    }
    if (bodyFatStart.present) {
      map['body_fat_start'] = Variable<double>(bodyFatStart.value);
    }
    if (bodyFatEnd.present) {
      map['body_fat_end'] = Variable<double>(bodyFatEnd.value);
    }
    if (muscleStart.present) {
      map['muscle_start'] = Variable<double>(muscleStart.value);
    }
    if (muscleEnd.present) {
      map['muscle_end'] = Variable<double>(muscleEnd.value);
    }
    if (armRight.present) {
      map['arm_right'] = Variable<double>(armRight.value);
    }
    if (armLeft.present) {
      map['arm_left'] = Variable<double>(armLeft.value);
    }
    if (thighRight.present) {
      map['thigh_right'] = Variable<double>(thighRight.value);
    }
    if (thighLeft.present) {
      map['thigh_left'] = Variable<double>(thighLeft.value);
    }
    if (achievement.present) {
      map['achievement'] = Variable<String>(achievement.value);
    }
    if (evaluation.present) {
      map['evaluation'] = Variable<String>(evaluation.value);
    }
    if (recommendation.present) {
      map['recommendation'] = Variable<String>(recommendation.value);
    }
    if (conclusion.present) {
      map['conclusion'] = Variable<String>(conclusion.value);
    }
    if (finalizedAt.present) {
      map['finalized_at'] = Variable<DateTime>(finalizedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostPtEvaluationsCompanion(')
          ..write('id: $id, ')
          ..write('packageId: $packageId, ')
          ..write('finalWeightKg: $finalWeightKg, ')
          ..write('bodyFatStart: $bodyFatStart, ')
          ..write('bodyFatEnd: $bodyFatEnd, ')
          ..write('muscleStart: $muscleStart, ')
          ..write('muscleEnd: $muscleEnd, ')
          ..write('armRight: $armRight, ')
          ..write('armLeft: $armLeft, ')
          ..write('thighRight: $thighRight, ')
          ..write('thighLeft: $thighLeft, ')
          ..write('achievement: $achievement, ')
          ..write('evaluation: $evaluation, ')
          ..write('recommendation: $recommendation, ')
          ..write('conclusion: $conclusion, ')
          ..write('finalizedAt: $finalizedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TrainersTable trainers = $TrainersTable(this);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $PtPackagesTable ptPackages = $PtPackagesTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $ExerciseCatalogTable exerciseCatalog = $ExerciseCatalogTable(
    this,
  );
  late final $WorkoutLogsTable workoutLogs = $WorkoutLogsTable(this);
  late final $WorkoutExercisesTable workoutExercises = $WorkoutExercisesTable(
    this,
  );
  late final $WorkoutSetsTable workoutSets = $WorkoutSetsTable(this);
  late final $PostPtEvaluationsTable postPtEvaluations =
      $PostPtEvaluationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    trainers,
    clients,
    ptPackages,
    sessions,
    exerciseCatalog,
    workoutLogs,
    workoutExercises,
    workoutSets,
    postPtEvaluations,
  ];
}

typedef $$TrainersTableCreateCompanionBuilder = TrainersCompanion Function({
  Value<int> id,
  required String name,
  required String email,
  required String passwordSalt,
  required String passwordHash,
  Value<String> phone,
  Value<String?> avatarUrl,
});
typedef $$TrainersTableUpdateCompanionBuilder = TrainersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
  Value<String> passwordSalt,
  Value<String> passwordHash,
  Value<String> phone,
  Value<String?> avatarUrl,
});

final class $$TrainersTableReferences
    extends BaseReferences<_$AppDatabase, $TrainersTable, Trainer> {
  $$TrainersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ClientsTable, List<Client>> _clientsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.clients,
    aliasName: 'trainers__id__clients__trainer_id',
  );

  $$ClientsTableProcessedTableManager get clientsRefs {
    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.trainerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_clientsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TrainersTableFilterComposer
    extends Composer<_$AppDatabase, $TrainersTable> {
  $$TrainersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordSalt => $composableBuilder(
    column: $table.passwordSalt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarUrl => $composableBuilder(
    column: $table.avatarUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> clientsRefs(
    Expression<bool> Function($$ClientsTableFilterComposer f) f,
  ) {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.trainerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TrainersTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainersTable> {
  $$TrainersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordSalt => $composableBuilder(
    column: $table.passwordSalt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarUrl => $composableBuilder(
    column: $table.avatarUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrainersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainersTable> {
  $$TrainersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get passwordSalt => $composableBuilder(
    column: $table.passwordSalt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get avatarUrl =>
      $composableBuilder(column: $table.avatarUrl, builder: (column) => column);

  Expression<T> clientsRefs<T extends Object>(
    Expression<T> Function($$ClientsTableAnnotationComposer a) f,
  ) {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.trainerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TrainersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrainersTable,
          Trainer,
          $$TrainersTableFilterComposer,
          $$TrainersTableOrderingComposer,
          $$TrainersTableAnnotationComposer,
          $$TrainersTableCreateCompanionBuilder,
          $$TrainersTableUpdateCompanionBuilder,
          (Trainer, $$TrainersTableReferences),
          Trainer,
          PrefetchHooks Function({bool clientsRefs})
        > {
  $$TrainersTableTableManager(_$AppDatabase db, $TrainersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> passwordSalt = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String?> avatarUrl = const Value.absent(),
              }) => TrainersCompanion(
                id: id,
                name: name,
                email: email,
                passwordSalt: passwordSalt,
                passwordHash: passwordHash,
                phone: phone,
                avatarUrl: avatarUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String email,
                required String passwordSalt,
                required String passwordHash,
                Value<String> phone = const Value.absent(),
                Value<String?> avatarUrl = const Value.absent(),
              }) => TrainersCompanion.insert(
                id: id,
                name: name,
                email: email,
                passwordSalt: passwordSalt,
                passwordHash: passwordHash,
                phone: phone,
                avatarUrl: avatarUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TrainersTable, Trainer>(table),
                  $$TrainersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({clientsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (clientsRefs) db.clients],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (clientsRefs)
                    await $_getPrefetchedDataByColumns<
                      Trainer,
                      $TrainersTable,
                      Client,
                      $ClientsTable
                    >(
                      currentTable: table,
                      referencedTable: $$TrainersTableReferences
                          ._clientsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TrainersTableReferences(db, table, p0).clientsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'trainer_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TrainersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrainersTable,
      Trainer,
      $$TrainersTableFilterComposer,
      $$TrainersTableOrderingComposer,
      $$TrainersTableAnnotationComposer,
      $$TrainersTableCreateCompanionBuilder,
      $$TrainersTableUpdateCompanionBuilder,
      (Trainer, $$TrainersTableReferences),
      Trainer,
      PrefetchHooks Function({bool clientsRefs})
    >;
typedef $$ClientsTableCreateCompanionBuilder = ClientsCompanion Function({
  Value<int> id,
  required int trainerId,
  required String name,
  required int age,
  Value<String> contact,
  Value<double?> heightCm,
  Value<double?> initialWeightKg,
  Value<String> goal,
  Value<String> medicalHistory,
  Value<String> injuryHistory,
  Value<String> assessmentNotes,
});
typedef $$ClientsTableUpdateCompanionBuilder = ClientsCompanion Function({
  Value<int> id,
  Value<int> trainerId,
  Value<String> name,
  Value<int> age,
  Value<String> contact,
  Value<double?> heightCm,
  Value<double?> initialWeightKg,
  Value<String> goal,
  Value<String> medicalHistory,
  Value<String> injuryHistory,
  Value<String> assessmentNotes,
});

final class $$ClientsTableReferences
    extends BaseReferences<_$AppDatabase, $ClientsTable, Client> {
  $$ClientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TrainersTable _trainerIdTable(_$AppDatabase db) =>
      db.trainers.createAlias('clients__trainer_id__trainers__id');

  $$TrainersTableProcessedTableManager get trainerId {
    final $_column = $_itemColumn<int>('trainer_id')!;

    final manager = $$TrainersTableTableManager(
      $_db,
      $_db.trainers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_trainerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PtPackagesTable, List<PtPackage>>
  _ptPackagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ptPackages,
    aliasName: 'clients__id__pt_packages__client_id',
  );

  $$PtPackagesTableProcessedTableManager get ptPackagesRefs {
    final manager = $$PtPackagesTableTableManager(
      $_db,
      $_db.ptPackages,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ptPackagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutLogsTable, List<WorkoutLog>>
  _workoutLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutLogs,
    aliasName: 'clients__id__workout_logs__client_id',
  );

  $$WorkoutLogsTableProcessedTableManager get workoutLogsRefs {
    final manager = $$WorkoutLogsTableTableManager(
      $_db,
      $_db.workoutLogs,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workoutLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClientsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get initialWeightKg => $composableBuilder(
    column: $table.initialWeightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicalHistory => $composableBuilder(
    column: $table.medicalHistory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get injuryHistory => $composableBuilder(
    column: $table.injuryHistory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assessmentNotes => $composableBuilder(
    column: $table.assessmentNotes,
    builder: (column) => ColumnFilters(column),
  );

  $$TrainersTableFilterComposer get trainerId {
    final $$TrainersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trainerId,
      referencedTable: $db.trainers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainersTableFilterComposer(
            $db: $db,
            $table: $db.trainers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ptPackagesRefs(
    Expression<bool> Function($$PtPackagesTableFilterComposer f) f,
  ) {
    final $$PtPackagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableFilterComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutLogsRefs(
    Expression<bool> Function($$WorkoutLogsTableFilterComposer f) f,
  ) {
    final $$WorkoutLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableFilterComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get initialWeightKg => $composableBuilder(
    column: $table.initialWeightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicalHistory => $composableBuilder(
    column: $table.medicalHistory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get injuryHistory => $composableBuilder(
    column: $table.injuryHistory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assessmentNotes => $composableBuilder(
    column: $table.assessmentNotes,
    builder: (column) => ColumnOrderings(column),
  );

  $$TrainersTableOrderingComposer get trainerId {
    final $$TrainersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trainerId,
      referencedTable: $db.trainers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainersTableOrderingComposer(
            $db: $db,
            $table: $db.trainers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<double> get initialWeightKg => $composableBuilder(
    column: $table.initialWeightKg,
    builder: (column) => column,
  );

  GeneratedColumn<String> get goal =>
      $composableBuilder(column: $table.goal, builder: (column) => column);

  GeneratedColumn<String> get medicalHistory => $composableBuilder(
    column: $table.medicalHistory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get injuryHistory => $composableBuilder(
    column: $table.injuryHistory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get assessmentNotes => $composableBuilder(
    column: $table.assessmentNotes,
    builder: (column) => column,
  );

  $$TrainersTableAnnotationComposer get trainerId {
    final $$TrainersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trainerId,
      referencedTable: $db.trainers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainersTableAnnotationComposer(
            $db: $db,
            $table: $db.trainers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> ptPackagesRefs<T extends Object>(
    Expression<T> Function($$PtPackagesTableAnnotationComposer a) f,
  ) {
    final $$PtPackagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableAnnotationComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workoutLogsRefs<T extends Object>(
    Expression<T> Function($$WorkoutLogsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientsTable,
          Client,
          $$ClientsTableFilterComposer,
          $$ClientsTableOrderingComposer,
          $$ClientsTableAnnotationComposer,
          $$ClientsTableCreateCompanionBuilder,
          $$ClientsTableUpdateCompanionBuilder,
          (Client, $$ClientsTableReferences),
          Client,
          PrefetchHooks Function({
            bool trainerId,
            bool ptPackagesRefs,
            bool workoutLogsRefs,
          })
        > {
  $$ClientsTableTableManager(_$AppDatabase db, $ClientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> trainerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<String> contact = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<double?> initialWeightKg = const Value.absent(),
                Value<String> goal = const Value.absent(),
                Value<String> medicalHistory = const Value.absent(),
                Value<String> injuryHistory = const Value.absent(),
                Value<String> assessmentNotes = const Value.absent(),
              }) => ClientsCompanion(
                id: id,
                trainerId: trainerId,
                name: name,
                age: age,
                contact: contact,
                heightCm: heightCm,
                initialWeightKg: initialWeightKg,
                goal: goal,
                medicalHistory: medicalHistory,
                injuryHistory: injuryHistory,
                assessmentNotes: assessmentNotes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int trainerId,
                required String name,
                required int age,
                Value<String> contact = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<double?> initialWeightKg = const Value.absent(),
                Value<String> goal = const Value.absent(),
                Value<String> medicalHistory = const Value.absent(),
                Value<String> injuryHistory = const Value.absent(),
                Value<String> assessmentNotes = const Value.absent(),
              }) => ClientsCompanion.insert(
                id: id,
                trainerId: trainerId,
                name: name,
                age: age,
                contact: contact,
                heightCm: heightCm,
                initialWeightKg: initialWeightKg,
                goal: goal,
                medicalHistory: medicalHistory,
                injuryHistory: injuryHistory,
                assessmentNotes: assessmentNotes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ClientsTable, Client>(table),
                  $$ClientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                trainerId = false,
                ptPackagesRefs = false,
                workoutLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (ptPackagesRefs) db.ptPackages,
                    if (workoutLogsRefs) db.workoutLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (trainerId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.trainerId,
                            referencedTable: $$ClientsTableReferences
                                ._trainerIdTable(db),
                            referencedColumn: $$ClientsTableReferences
                                ._trainerIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (ptPackagesRefs)
                        await $_getPrefetchedDataByColumns<
                          Client,
                          $ClientsTable,
                          PtPackage,
                          $PtPackagesTable
                        >(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._ptPackagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(
                                db,
                                table,
                                p0,
                              ).ptPackagesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'client_id',
                          typedResults: items,
                        ),
                      if (workoutLogsRefs)
                        await $_getPrefetchedDataByColumns<
                          Client,
                          $ClientsTable,
                          WorkoutLog,
                          $WorkoutLogsTable
                        >(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._workoutLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutLogsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'client_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ClientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientsTable,
      Client,
      $$ClientsTableFilterComposer,
      $$ClientsTableOrderingComposer,
      $$ClientsTableAnnotationComposer,
      $$ClientsTableCreateCompanionBuilder,
      $$ClientsTableUpdateCompanionBuilder,
      (Client, $$ClientsTableReferences),
      Client,
      PrefetchHooks Function({
        bool trainerId,
        bool ptPackagesRefs,
        bool workoutLogsRefs,
      })
    >;
typedef $$PtPackagesTableCreateCompanionBuilder = PtPackagesCompanion Function({
  Value<int> id,
  required int clientId,
  required int totalSessions,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime?> closedAt,
});
typedef $$PtPackagesTableUpdateCompanionBuilder = PtPackagesCompanion Function({
  Value<int> id,
  Value<int> clientId,
  Value<int> totalSessions,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime?> closedAt,
});

final class $$PtPackagesTableReferences
    extends BaseReferences<_$AppDatabase, $PtPackagesTable, PtPackage> {
  $$PtPackagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) =>
      db.clients.createAlias('pt_packages__client_id__clients__id');

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SessionsTable, List<Session>> _sessionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.sessions,
    aliasName: 'pt_packages__id__sessions__package_id',
  );

  $$SessionsTableProcessedTableManager get sessionsRefs {
    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.packageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutLogsTable, List<WorkoutLog>>
  _workoutLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutLogs,
    aliasName: 'pt_packages__id__workout_logs__package_id',
  );

  $$WorkoutLogsTableProcessedTableManager get workoutLogsRefs {
    final manager = $$WorkoutLogsTableTableManager(
      $_db,
      $_db.workoutLogs,
    ).filter((f) => f.packageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workoutLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PostPtEvaluationsTable, List<PostPtEvaluation>>
  _postPtEvaluationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.postPtEvaluations,
        aliasName: 'pt_packages__id__post_pt_evaluations__package_id',
      );

  $$PostPtEvaluationsTableProcessedTableManager get postPtEvaluationsRefs {
    final manager = $$PostPtEvaluationsTableTableManager(
      $_db,
      $_db.postPtEvaluations,
    ).filter((f) => f.packageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _postPtEvaluationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PtPackagesTableFilterComposer
    extends Composer<_$AppDatabase, $PtPackagesTable> {
  $$PtPackagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSessions => $composableBuilder(
    column: $table.totalSessions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> sessionsRefs(
    Expression<bool> Function($$SessionsTableFilterComposer f) f,
  ) {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutLogsRefs(
    Expression<bool> Function($$WorkoutLogsTableFilterComposer f) f,
  ) {
    final $$WorkoutLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableFilterComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> postPtEvaluationsRefs(
    Expression<bool> Function($$PostPtEvaluationsTableFilterComposer f) f,
  ) {
    final $$PostPtEvaluationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.postPtEvaluations,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PostPtEvaluationsTableFilterComposer(
            $db: $db,
            $table: $db.postPtEvaluations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PtPackagesTableOrderingComposer
    extends Composer<_$AppDatabase, $PtPackagesTable> {
  $$PtPackagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSessions => $composableBuilder(
    column: $table.totalSessions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PtPackagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PtPackagesTable> {
  $$PtPackagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get totalSessions => $composableBuilder(
    column: $table.totalSessions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get closedAt =>
      $composableBuilder(column: $table.closedAt, builder: (column) => column);

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> sessionsRefs<T extends Object>(
    Expression<T> Function($$SessionsTableAnnotationComposer a) f,
  ) {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workoutLogsRefs<T extends Object>(
    Expression<T> Function($$WorkoutLogsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.packageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> postPtEvaluationsRefs<T extends Object>(
    Expression<T> Function($$PostPtEvaluationsTableAnnotationComposer a) f,
  ) {
    final $$PostPtEvaluationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.postPtEvaluations,
          getReferencedColumn: (t) => t.packageId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PostPtEvaluationsTableAnnotationComposer(
                $db: $db,
                $table: $db.postPtEvaluations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PtPackagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PtPackagesTable,
          PtPackage,
          $$PtPackagesTableFilterComposer,
          $$PtPackagesTableOrderingComposer,
          $$PtPackagesTableAnnotationComposer,
          $$PtPackagesTableCreateCompanionBuilder,
          $$PtPackagesTableUpdateCompanionBuilder,
          (PtPackage, $$PtPackagesTableReferences),
          PtPackage,
          PrefetchHooks Function({
            bool clientId,
            bool sessionsRefs,
            bool workoutLogsRefs,
            bool postPtEvaluationsRefs,
          })
        > {
  $$PtPackagesTableTableManager(_$AppDatabase db, $PtPackagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PtPackagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PtPackagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PtPackagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<int> totalSessions = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> closedAt = const Value.absent(),
              }) => PtPackagesCompanion(
                id: id,
                clientId: clientId,
                totalSessions: totalSessions,
                status: status,
                createdAt: createdAt,
                closedAt: closedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int clientId,
                required int totalSessions,
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> closedAt = const Value.absent(),
              }) => PtPackagesCompanion.insert(
                id: id,
                clientId: clientId,
                totalSessions: totalSessions,
                status: status,
                createdAt: createdAt,
                closedAt: closedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PtPackagesTable, PtPackage>(table),
                  $$PtPackagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                clientId = false,
                sessionsRefs = false,
                workoutLogsRefs = false,
                postPtEvaluationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sessionsRefs) db.sessions,
                    if (workoutLogsRefs) db.workoutLogs,
                    if (postPtEvaluationsRefs) db.postPtEvaluations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (clientId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.clientId,
                            referencedTable: $$PtPackagesTableReferences
                                ._clientIdTable(db),
                            referencedColumn: $$PtPackagesTableReferences
                                ._clientIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sessionsRefs)
                        await $_getPrefetchedDataByColumns<
                          PtPackage,
                          $PtPackagesTable,
                          Session,
                          $SessionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$PtPackagesTableReferences
                              ._sessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PtPackagesTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'package_id',
                          typedResults: items,
                        ),
                      if (workoutLogsRefs)
                        await $_getPrefetchedDataByColumns<
                          PtPackage,
                          $PtPackagesTable,
                          WorkoutLog,
                          $WorkoutLogsTable
                        >(
                          currentTable: table,
                          referencedTable: $$PtPackagesTableReferences
                              ._workoutLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PtPackagesTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutLogsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'package_id',
                          typedResults: items,
                        ),
                      if (postPtEvaluationsRefs)
                        await $_getPrefetchedDataByColumns<
                          PtPackage,
                          $PtPackagesTable,
                          PostPtEvaluation,
                          $PostPtEvaluationsTable
                        >(
                          currentTable: table,
                          referencedTable: $$PtPackagesTableReferences
                              ._postPtEvaluationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PtPackagesTableReferences(
                                db,
                                table,
                                p0,
                              ).postPtEvaluationsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'package_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PtPackagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PtPackagesTable,
      PtPackage,
      $$PtPackagesTableFilterComposer,
      $$PtPackagesTableOrderingComposer,
      $$PtPackagesTableAnnotationComposer,
      $$PtPackagesTableCreateCompanionBuilder,
      $$PtPackagesTableUpdateCompanionBuilder,
      (PtPackage, $$PtPackagesTableReferences),
      PtPackage,
      PrefetchHooks Function({
        bool clientId,
        bool sessionsRefs,
        bool workoutLogsRefs,
        bool postPtEvaluationsRefs,
      })
    >;
typedef $$SessionsTableCreateCompanionBuilder = SessionsCompanion Function({
  Value<int> id,
  required int packageId,
  required int sessionNumber,
  required DateTime scheduledAt,
  Value<String> status,
  Value<String> notes,
  Value<DateTime?> completedAt,
});
typedef $$SessionsTableUpdateCompanionBuilder = SessionsCompanion Function({
  Value<int> id,
  Value<int> packageId,
  Value<int> sessionNumber,
  Value<DateTime> scheduledAt,
  Value<String> status,
  Value<String> notes,
  Value<DateTime?> completedAt,
});

final class $$SessionsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionsTable, Session> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PtPackagesTable _packageIdTable(_$AppDatabase db) =>
      db.ptPackages.createAlias('sessions__package_id__pt_packages__id');

  $$PtPackagesTableProcessedTableManager get packageId {
    final $_column = $_itemColumn<int>('package_id')!;

    final manager = $$PtPackagesTableTableManager(
      $_db,
      $_db.ptPackages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_packageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WorkoutLogsTable, List<WorkoutLog>>
  _workoutLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutLogs,
    aliasName: 'sessions__id__workout_logs__session_id',
  );

  $$WorkoutLogsTableProcessedTableManager get workoutLogsRefs {
    final manager = $$WorkoutLogsTableTableManager(
      $_db,
      $_db.workoutLogs,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workoutLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sessionNumber => $composableBuilder(
    column: $table.sessionNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PtPackagesTableFilterComposer get packageId {
    final $$PtPackagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableFilterComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> workoutLogsRefs(
    Expression<bool> Function($$WorkoutLogsTableFilterComposer f) f,
  ) {
    final $$WorkoutLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableFilterComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sessionNumber => $composableBuilder(
    column: $table.sessionNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PtPackagesTableOrderingComposer get packageId {
    final $$PtPackagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableOrderingComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sessionNumber => $composableBuilder(
    column: $table.sessionNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  $$PtPackagesTableAnnotationComposer get packageId {
    final $$PtPackagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableAnnotationComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> workoutLogsRefs<T extends Object>(
    Expression<T> Function($$WorkoutLogsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionsTable,
          Session,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (Session, $$SessionsTableReferences),
          Session,
          PrefetchHooks Function({bool packageId, bool workoutLogsRefs})
        > {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> packageId = const Value.absent(),
                Value<int> sessionNumber = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => SessionsCompanion(
                id: id,
                packageId: packageId,
                sessionNumber: sessionNumber,
                scheduledAt: scheduledAt,
                status: status,
                notes: notes,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int packageId,
                required int sessionNumber,
                required DateTime scheduledAt,
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                packageId: packageId,
                sessionNumber: sessionNumber,
                scheduledAt: scheduledAt,
                status: status,
                notes: notes,
                completedAt: completedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SessionsTable, Session>(table),
                  $$SessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({packageId = false, workoutLogsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workoutLogsRefs) db.workoutLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (packageId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.packageId,
                            referencedTable: $$SessionsTableReferences
                                ._packageIdTable(db),
                            referencedColumn: $$SessionsTableReferences
                                ._packageIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workoutLogsRefs)
                        await $_getPrefetchedDataByColumns<
                          Session,
                          $SessionsTable,
                          WorkoutLog,
                          $WorkoutLogsTable
                        >(
                          currentTable: table,
                          referencedTable: $$SessionsTableReferences
                              ._workoutLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutLogsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionsTable,
      Session,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (Session, $$SessionsTableReferences),
      Session,
      PrefetchHooks Function({bool packageId, bool workoutLogsRefs})
    >;
typedef $$ExerciseCatalogTableCreateCompanionBuilder =
    ExerciseCatalogCompanion Function({
      Value<int> id,
      required String name,
      required String category,
      Value<String> source,
      Value<int?> externalId,
    });
typedef $$ExerciseCatalogTableUpdateCompanionBuilder =
    ExerciseCatalogCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> category,
      Value<String> source,
      Value<int?> externalId,
    });

final class $$ExerciseCatalogTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExerciseCatalogTable,
          ExerciseCatalogData
        > {
  $$ExerciseCatalogTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$WorkoutExercisesTable, List<WorkoutExercise>>
  _workoutExercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutExercises,
    aliasName: 'exercise_catalog__id__workout_exercises__catalog_id',
  );

  $$WorkoutExercisesTableProcessedTableManager get workoutExercisesRefs {
    final manager = $$WorkoutExercisesTableTableManager(
      $_db,
      $_db.workoutExercises,
    ).filter((f) => f.catalogId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExerciseCatalogTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseCatalogTable> {
  $$ExerciseCatalogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> workoutExercisesRefs(
    Expression<bool> Function($$WorkoutExercisesTableFilterComposer f) f,
  ) {
    final $$WorkoutExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutExercises,
      getReferencedColumn: (t) => t.catalogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutExercisesTableFilterComposer(
            $db: $db,
            $table: $db.workoutExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExerciseCatalogTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseCatalogTable> {
  $$ExerciseCatalogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExerciseCatalogTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseCatalogTable> {
  $$ExerciseCatalogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<int> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => column,
  );

  Expression<T> workoutExercisesRefs<T extends Object>(
    Expression<T> Function($$WorkoutExercisesTableAnnotationComposer a) f,
  ) {
    final $$WorkoutExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutExercises,
      getReferencedColumn: (t) => t.catalogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExerciseCatalogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseCatalogTable,
          ExerciseCatalogData,
          $$ExerciseCatalogTableFilterComposer,
          $$ExerciseCatalogTableOrderingComposer,
          $$ExerciseCatalogTableAnnotationComposer,
          $$ExerciseCatalogTableCreateCompanionBuilder,
          $$ExerciseCatalogTableUpdateCompanionBuilder,
          (ExerciseCatalogData, $$ExerciseCatalogTableReferences),
          ExerciseCatalogData,
          PrefetchHooks Function({bool workoutExercisesRefs})
        > {
  $$ExerciseCatalogTableTableManager(
    _$AppDatabase db,
    $ExerciseCatalogTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseCatalogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseCatalogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseCatalogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int?> externalId = const Value.absent(),
              }) => ExerciseCatalogCompanion(
                id: id,
                name: name,
                category: category,
                source: source,
                externalId: externalId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String category,
                Value<String> source = const Value.absent(),
                Value<int?> externalId = const Value.absent(),
              }) => ExerciseCatalogCompanion.insert(
                id: id,
                name: name,
                category: category,
                source: source,
                externalId: externalId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExerciseCatalogTable, ExerciseCatalogData>(
                    table,
                  ),
                  $$ExerciseCatalogTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workoutExercisesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (workoutExercisesRefs) db.workoutExercises,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (workoutExercisesRefs)
                    await $_getPrefetchedDataByColumns<
                      ExerciseCatalogData,
                      $ExerciseCatalogTable,
                      WorkoutExercise,
                      $WorkoutExercisesTable
                    >(
                      currentTable: table,
                      referencedTable: $$ExerciseCatalogTableReferences
                          ._workoutExercisesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ExerciseCatalogTableReferences(
                            db,
                            table,
                            p0,
                          ).workoutExercisesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'catalog_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ExerciseCatalogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseCatalogTable,
      ExerciseCatalogData,
      $$ExerciseCatalogTableFilterComposer,
      $$ExerciseCatalogTableOrderingComposer,
      $$ExerciseCatalogTableAnnotationComposer,
      $$ExerciseCatalogTableCreateCompanionBuilder,
      $$ExerciseCatalogTableUpdateCompanionBuilder,
      (ExerciseCatalogData, $$ExerciseCatalogTableReferences),
      ExerciseCatalogData,
      PrefetchHooks Function({bool workoutExercisesRefs})
    >;
typedef $$WorkoutLogsTableCreateCompanionBuilder =
    WorkoutLogsCompanion Function({
      Value<int> id,
      required int clientId,
      required int packageId,
      Value<int?> sessionId,
      Value<DateTime> performedAt,
      Value<String> notes,
    });
typedef $$WorkoutLogsTableUpdateCompanionBuilder =
    WorkoutLogsCompanion Function({
      Value<int> id,
      Value<int> clientId,
      Value<int> packageId,
      Value<int?> sessionId,
      Value<DateTime> performedAt,
      Value<String> notes,
    });

final class $$WorkoutLogsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutLogsTable, WorkoutLog> {
  $$WorkoutLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) =>
      db.clients.createAlias('workout_logs__client_id__clients__id');

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PtPackagesTable _packageIdTable(_$AppDatabase db) =>
      db.ptPackages.createAlias('workout_logs__package_id__pt_packages__id');

  $$PtPackagesTableProcessedTableManager get packageId {
    final $_column = $_itemColumn<int>('package_id')!;

    final manager = $$PtPackagesTableTableManager(
      $_db,
      $_db.ptPackages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_packageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.sessions.createAlias('workout_logs__session_id__sessions__id');

  $$SessionsTableProcessedTableManager? get sessionId {
    final $_column = $_itemColumn<int>('session_id');
    if ($_column == null) return null;
    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WorkoutExercisesTable, List<WorkoutExercise>>
  _workoutExercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutExercises,
    aliasName: 'workout_logs__id__workout_exercises__log_id',
  );

  $$WorkoutExercisesTableProcessedTableManager get workoutExercisesRefs {
    final manager = $$WorkoutExercisesTableTableManager(
      $_db,
      $_db.workoutExercises,
    ).filter((f) => f.logId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutLogsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PtPackagesTableFilterComposer get packageId {
    final $$PtPackagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableFilterComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> workoutExercisesRefs(
    Expression<bool> Function($$WorkoutExercisesTableFilterComposer f) f,
  ) {
    final $$WorkoutExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutExercises,
      getReferencedColumn: (t) => t.logId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutExercisesTableFilterComposer(
            $db: $db,
            $table: $db.workoutExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PtPackagesTableOrderingComposer get packageId {
    final $$PtPackagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableOrderingComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutLogsTable> {
  $$WorkoutLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PtPackagesTableAnnotationComposer get packageId {
    final $$PtPackagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableAnnotationComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> workoutExercisesRefs<T extends Object>(
    Expression<T> Function($$WorkoutExercisesTableAnnotationComposer a) f,
  ) {
    final $$WorkoutExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutExercises,
      getReferencedColumn: (t) => t.logId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutLogsTable,
          WorkoutLog,
          $$WorkoutLogsTableFilterComposer,
          $$WorkoutLogsTableOrderingComposer,
          $$WorkoutLogsTableAnnotationComposer,
          $$WorkoutLogsTableCreateCompanionBuilder,
          $$WorkoutLogsTableUpdateCompanionBuilder,
          (WorkoutLog, $$WorkoutLogsTableReferences),
          WorkoutLog,
          PrefetchHooks Function({
            bool clientId,
            bool packageId,
            bool sessionId,
            bool workoutExercisesRefs,
          })
        > {
  $$WorkoutLogsTableTableManager(_$AppDatabase db, $WorkoutLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<int> packageId = const Value.absent(),
                Value<int?> sessionId = const Value.absent(),
                Value<DateTime> performedAt = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => WorkoutLogsCompanion(
                id: id,
                clientId: clientId,
                packageId: packageId,
                sessionId: sessionId,
                performedAt: performedAt,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int clientId,
                required int packageId,
                Value<int?> sessionId = const Value.absent(),
                Value<DateTime> performedAt = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => WorkoutLogsCompanion.insert(
                id: id,
                clientId: clientId,
                packageId: packageId,
                sessionId: sessionId,
                performedAt: performedAt,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WorkoutLogsTable, WorkoutLog>(table),
                  $$WorkoutLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                clientId = false,
                packageId = false,
                sessionId = false,
                workoutExercisesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workoutExercisesRefs) db.workoutExercises,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (clientId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.clientId,
                            referencedTable: $$WorkoutLogsTableReferences
                                ._clientIdTable(db),
                            referencedColumn: $$WorkoutLogsTableReferences
                                ._clientIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (packageId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.packageId,
                            referencedTable: $$WorkoutLogsTableReferences
                                ._packageIdTable(db),
                            referencedColumn: $$WorkoutLogsTableReferences
                                ._packageIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (sessionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.sessionId,
                            referencedTable: $$WorkoutLogsTableReferences
                                ._sessionIdTable(db),
                            referencedColumn: $$WorkoutLogsTableReferences
                                ._sessionIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workoutExercisesRefs)
                        await $_getPrefetchedDataByColumns<
                          WorkoutLog,
                          $WorkoutLogsTable,
                          WorkoutExercise,
                          $WorkoutExercisesTable
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutLogsTableReferences
                              ._workoutExercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutExercisesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'log_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkoutLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutLogsTable,
      WorkoutLog,
      $$WorkoutLogsTableFilterComposer,
      $$WorkoutLogsTableOrderingComposer,
      $$WorkoutLogsTableAnnotationComposer,
      $$WorkoutLogsTableCreateCompanionBuilder,
      $$WorkoutLogsTableUpdateCompanionBuilder,
      (WorkoutLog, $$WorkoutLogsTableReferences),
      WorkoutLog,
      PrefetchHooks Function({
        bool clientId,
        bool packageId,
        bool sessionId,
        bool workoutExercisesRefs,
      })
    >;
typedef $$WorkoutExercisesTableCreateCompanionBuilder =
    WorkoutExercisesCompanion Function({
      Value<int> id,
      required int logId,
      Value<int?> catalogId,
      required String name,
      Value<String> equipment,
      Value<String> method,
      Value<String?> groupKey,
      Value<double?> rpe,
      Value<int?> rir,
      Value<String> notes,
    });
typedef $$WorkoutExercisesTableUpdateCompanionBuilder =
    WorkoutExercisesCompanion Function({
      Value<int> id,
      Value<int> logId,
      Value<int?> catalogId,
      Value<String> name,
      Value<String> equipment,
      Value<String> method,
      Value<String?> groupKey,
      Value<double?> rpe,
      Value<int?> rir,
      Value<String> notes,
    });

final class $$WorkoutExercisesTableReferences
    extends
        BaseReferences<_$AppDatabase, $WorkoutExercisesTable, WorkoutExercise> {
  $$WorkoutExercisesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorkoutLogsTable _logIdTable(_$AppDatabase db) =>
      db.workoutLogs.createAlias('workout_exercises__log_id__workout_logs__id');

  $$WorkoutLogsTableProcessedTableManager get logId {
    final $_column = $_itemColumn<int>('log_id')!;

    final manager = $$WorkoutLogsTableTableManager(
      $_db,
      $_db.workoutLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_logIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExerciseCatalogTable _catalogIdTable(_$AppDatabase db) => db
      .exerciseCatalog
      .createAlias('workout_exercises__catalog_id__exercise_catalog__id');

  $$ExerciseCatalogTableProcessedTableManager? get catalogId {
    final $_column = $_itemColumn<int>('catalog_id');
    if ($_column == null) return null;
    final manager = $$ExerciseCatalogTableTableManager(
      $_db,
      $_db.exerciseCatalog,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_catalogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WorkoutSetsTable, List<WorkoutSet>>
  _workoutSetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutSets,
    aliasName: 'workout_exercises__id__workout_sets__exercise_id',
  );

  $$WorkoutSetsTableProcessedTableManager get workoutSetsRefs {
    final manager = $$WorkoutSetsTableTableManager(
      $_db,
      $_db.workoutSets,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workoutSetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutExercisesTable> {
  $$WorkoutExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupKey => $composableBuilder(
    column: $table.groupKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rir => $composableBuilder(
    column: $table.rir,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutLogsTableFilterComposer get logId {
    final $$WorkoutLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.logId,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableFilterComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExerciseCatalogTableFilterComposer get catalogId {
    final $$ExerciseCatalogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catalogId,
      referencedTable: $db.exerciseCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseCatalogTableFilterComposer(
            $db: $db,
            $table: $db.exerciseCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> workoutSetsRefs(
    Expression<bool> Function($$WorkoutSetsTableFilterComposer f) f,
  ) {
    final $$WorkoutSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSets,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSetsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutExercisesTable> {
  $$WorkoutExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupKey => $composableBuilder(
    column: $table.groupKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rir => $composableBuilder(
    column: $table.rir,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutLogsTableOrderingComposer get logId {
    final $$WorkoutLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.logId,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableOrderingComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExerciseCatalogTableOrderingComposer get catalogId {
    final $$ExerciseCatalogTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catalogId,
      referencedTable: $db.exerciseCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseCatalogTableOrderingComposer(
            $db: $db,
            $table: $db.exerciseCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutExercisesTable> {
  $$WorkoutExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get groupKey =>
      $composableBuilder(column: $table.groupKey, builder: (column) => column);

  GeneratedColumn<double> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  GeneratedColumn<int> get rir =>
      $composableBuilder(column: $table.rir, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$WorkoutLogsTableAnnotationComposer get logId {
    final $$WorkoutLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.logId,
      referencedTable: $db.workoutLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExerciseCatalogTableAnnotationComposer get catalogId {
    final $$ExerciseCatalogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catalogId,
      referencedTable: $db.exerciseCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseCatalogTableAnnotationComposer(
            $db: $db,
            $table: $db.exerciseCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> workoutSetsRefs<T extends Object>(
    Expression<T> Function($$WorkoutSetsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSets,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutExercisesTable,
          WorkoutExercise,
          $$WorkoutExercisesTableFilterComposer,
          $$WorkoutExercisesTableOrderingComposer,
          $$WorkoutExercisesTableAnnotationComposer,
          $$WorkoutExercisesTableCreateCompanionBuilder,
          $$WorkoutExercisesTableUpdateCompanionBuilder,
          (WorkoutExercise, $$WorkoutExercisesTableReferences),
          WorkoutExercise,
          PrefetchHooks Function({
            bool logId,
            bool catalogId,
            bool workoutSetsRefs,
          })
        > {
  $$WorkoutExercisesTableTableManager(
    _$AppDatabase db,
    $WorkoutExercisesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> logId = const Value.absent(),
                Value<int?> catalogId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> equipment = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String?> groupKey = const Value.absent(),
                Value<double?> rpe = const Value.absent(),
                Value<int?> rir = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => WorkoutExercisesCompanion(
                id: id,
                logId: logId,
                catalogId: catalogId,
                name: name,
                equipment: equipment,
                method: method,
                groupKey: groupKey,
                rpe: rpe,
                rir: rir,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int logId,
                Value<int?> catalogId = const Value.absent(),
                required String name,
                Value<String> equipment = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String?> groupKey = const Value.absent(),
                Value<double?> rpe = const Value.absent(),
                Value<int?> rir = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => WorkoutExercisesCompanion.insert(
                id: id,
                logId: logId,
                catalogId: catalogId,
                name: name,
                equipment: equipment,
                method: method,
                groupKey: groupKey,
                rpe: rpe,
                rir: rir,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WorkoutExercisesTable, WorkoutExercise>(table),
                  $$WorkoutExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({logId = false, catalogId = false, workoutSetsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workoutSetsRefs) db.workoutSets,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (logId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.logId,
                            referencedTable: $$WorkoutExercisesTableReferences
                                ._logIdTable(db),
                            referencedColumn: $$WorkoutExercisesTableReferences
                                ._logIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (catalogId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.catalogId,
                            referencedTable: $$WorkoutExercisesTableReferences
                                ._catalogIdTable(db),
                            referencedColumn: $$WorkoutExercisesTableReferences
                                ._catalogIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workoutSetsRefs)
                        await $_getPrefetchedDataByColumns<
                          WorkoutExercise,
                          $WorkoutExercisesTable,
                          WorkoutSet,
                          $WorkoutSetsTable
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutExercisesTableReferences
                              ._workoutSetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutSetsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'exercise_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkoutExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutExercisesTable,
      WorkoutExercise,
      $$WorkoutExercisesTableFilterComposer,
      $$WorkoutExercisesTableOrderingComposer,
      $$WorkoutExercisesTableAnnotationComposer,
      $$WorkoutExercisesTableCreateCompanionBuilder,
      $$WorkoutExercisesTableUpdateCompanionBuilder,
      (WorkoutExercise, $$WorkoutExercisesTableReferences),
      WorkoutExercise,
      PrefetchHooks Function({bool logId, bool catalogId, bool workoutSetsRefs})
    >;
typedef $$WorkoutSetsTableCreateCompanionBuilder =
    WorkoutSetsCompanion Function({
      Value<int> id,
      required int exerciseId,
      required int setNumber,
      Value<int> stage,
      required int reps,
      Value<double?> weightKg,
    });
typedef $$WorkoutSetsTableUpdateCompanionBuilder =
    WorkoutSetsCompanion Function({
      Value<int> id,
      Value<int> exerciseId,
      Value<int> setNumber,
      Value<int> stage,
      Value<int> reps,
      Value<double?> weightKg,
    });

final class $$WorkoutSetsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutSetsTable, WorkoutSet> {
  $$WorkoutSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutExercisesTable _exerciseIdTable(_$AppDatabase db) => db
      .workoutExercises
      .createAlias('workout_sets__exercise_id__workout_exercises__id');

  $$WorkoutExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<int>('exercise_id')!;

    final manager = $$WorkoutExercisesTableTableManager(
      $_db,
      $_db.workoutExercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkoutSetsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSetsTable> {
  $$WorkoutSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stage => $composableBuilder(
    column: $table.stage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutExercisesTableFilterComposer get exerciseId {
    final $$WorkoutExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.workoutExercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutExercisesTableFilterComposer(
            $db: $db,
            $table: $db.workoutExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSetsTable> {
  $$WorkoutSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stage => $composableBuilder(
    column: $table.stage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutExercisesTableOrderingComposer get exerciseId {
    final $$WorkoutExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.workoutExercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.workoutExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSetsTable> {
  $$WorkoutSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get stage =>
      $composableBuilder(column: $table.stage, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  $$WorkoutExercisesTableAnnotationComposer get exerciseId {
    final $$WorkoutExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.workoutExercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSetsTable,
          WorkoutSet,
          $$WorkoutSetsTableFilterComposer,
          $$WorkoutSetsTableOrderingComposer,
          $$WorkoutSetsTableAnnotationComposer,
          $$WorkoutSetsTableCreateCompanionBuilder,
          $$WorkoutSetsTableUpdateCompanionBuilder,
          (WorkoutSet, $$WorkoutSetsTableReferences),
          WorkoutSet,
          PrefetchHooks Function({bool exerciseId})
        > {
  $$WorkoutSetsTableTableManager(_$AppDatabase db, $WorkoutSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> exerciseId = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<int> stage = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
              }) => WorkoutSetsCompanion(
                id: id,
                exerciseId: exerciseId,
                setNumber: setNumber,
                stage: stage,
                reps: reps,
                weightKg: weightKg,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int exerciseId,
                required int setNumber,
                Value<int> stage = const Value.absent(),
                required int reps,
                Value<double?> weightKg = const Value.absent(),
              }) => WorkoutSetsCompanion.insert(
                id: id,
                exerciseId: exerciseId,
                setNumber: setNumber,
                stage: stage,
                reps: reps,
                weightKg: weightKg,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WorkoutSetsTable, WorkoutSet>(table),
                  $$WorkoutSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({exerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (exerciseId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.exerciseId,
                        referencedTable: $$WorkoutSetsTableReferences
                            ._exerciseIdTable(db),
                        referencedColumn: $$WorkoutSetsTableReferences
                            ._exerciseIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WorkoutSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSetsTable,
      WorkoutSet,
      $$WorkoutSetsTableFilterComposer,
      $$WorkoutSetsTableOrderingComposer,
      $$WorkoutSetsTableAnnotationComposer,
      $$WorkoutSetsTableCreateCompanionBuilder,
      $$WorkoutSetsTableUpdateCompanionBuilder,
      (WorkoutSet, $$WorkoutSetsTableReferences),
      WorkoutSet,
      PrefetchHooks Function({bool exerciseId})
    >;
typedef $$PostPtEvaluationsTableCreateCompanionBuilder =
    PostPtEvaluationsCompanion Function({
      Value<int> id,
      required int packageId,
      Value<double?> finalWeightKg,
      Value<double?> bodyFatStart,
      Value<double?> bodyFatEnd,
      Value<double?> muscleStart,
      Value<double?> muscleEnd,
      Value<double?> armRight,
      Value<double?> armLeft,
      Value<double?> thighRight,
      Value<double?> thighLeft,
      required String achievement,
      required String evaluation,
      required String recommendation,
      required String conclusion,
      Value<DateTime> finalizedAt,
    });
typedef $$PostPtEvaluationsTableUpdateCompanionBuilder =
    PostPtEvaluationsCompanion Function({
      Value<int> id,
      Value<int> packageId,
      Value<double?> finalWeightKg,
      Value<double?> bodyFatStart,
      Value<double?> bodyFatEnd,
      Value<double?> muscleStart,
      Value<double?> muscleEnd,
      Value<double?> armRight,
      Value<double?> armLeft,
      Value<double?> thighRight,
      Value<double?> thighLeft,
      Value<String> achievement,
      Value<String> evaluation,
      Value<String> recommendation,
      Value<String> conclusion,
      Value<DateTime> finalizedAt,
    });

final class $$PostPtEvaluationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PostPtEvaluationsTable,
          PostPtEvaluation
        > {
  $$PostPtEvaluationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PtPackagesTable _packageIdTable(_$AppDatabase db) => db.ptPackages
      .createAlias('post_pt_evaluations__package_id__pt_packages__id');

  $$PtPackagesTableProcessedTableManager get packageId {
    final $_column = $_itemColumn<int>('package_id')!;

    final manager = $$PtPackagesTableTableManager(
      $_db,
      $_db.ptPackages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_packageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PostPtEvaluationsTableFilterComposer
    extends Composer<_$AppDatabase, $PostPtEvaluationsTable> {
  $$PostPtEvaluationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get finalWeightKg => $composableBuilder(
    column: $table.finalWeightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bodyFatStart => $composableBuilder(
    column: $table.bodyFatStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bodyFatEnd => $composableBuilder(
    column: $table.bodyFatEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get muscleStart => $composableBuilder(
    column: $table.muscleStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get muscleEnd => $composableBuilder(
    column: $table.muscleEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get armRight => $composableBuilder(
    column: $table.armRight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get armLeft => $composableBuilder(
    column: $table.armLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get thighRight => $composableBuilder(
    column: $table.thighRight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get thighLeft => $composableBuilder(
    column: $table.thighLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get achievement => $composableBuilder(
    column: $table.achievement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get evaluation => $composableBuilder(
    column: $table.evaluation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recommendation => $composableBuilder(
    column: $table.recommendation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conclusion => $composableBuilder(
    column: $table.conclusion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finalizedAt => $composableBuilder(
    column: $table.finalizedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PtPackagesTableFilterComposer get packageId {
    final $$PtPackagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableFilterComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PostPtEvaluationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PostPtEvaluationsTable> {
  $$PostPtEvaluationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get finalWeightKg => $composableBuilder(
    column: $table.finalWeightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bodyFatStart => $composableBuilder(
    column: $table.bodyFatStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bodyFatEnd => $composableBuilder(
    column: $table.bodyFatEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get muscleStart => $composableBuilder(
    column: $table.muscleStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get muscleEnd => $composableBuilder(
    column: $table.muscleEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get armRight => $composableBuilder(
    column: $table.armRight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get armLeft => $composableBuilder(
    column: $table.armLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get thighRight => $composableBuilder(
    column: $table.thighRight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get thighLeft => $composableBuilder(
    column: $table.thighLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievement => $composableBuilder(
    column: $table.achievement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get evaluation => $composableBuilder(
    column: $table.evaluation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recommendation => $composableBuilder(
    column: $table.recommendation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conclusion => $composableBuilder(
    column: $table.conclusion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finalizedAt => $composableBuilder(
    column: $table.finalizedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PtPackagesTableOrderingComposer get packageId {
    final $$PtPackagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableOrderingComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PostPtEvaluationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PostPtEvaluationsTable> {
  $$PostPtEvaluationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get finalWeightKg => $composableBuilder(
    column: $table.finalWeightKg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get bodyFatStart => $composableBuilder(
    column: $table.bodyFatStart,
    builder: (column) => column,
  );

  GeneratedColumn<double> get bodyFatEnd => $composableBuilder(
    column: $table.bodyFatEnd,
    builder: (column) => column,
  );

  GeneratedColumn<double> get muscleStart => $composableBuilder(
    column: $table.muscleStart,
    builder: (column) => column,
  );

  GeneratedColumn<double> get muscleEnd =>
      $composableBuilder(column: $table.muscleEnd, builder: (column) => column);

  GeneratedColumn<double> get armRight =>
      $composableBuilder(column: $table.armRight, builder: (column) => column);

  GeneratedColumn<double> get armLeft =>
      $composableBuilder(column: $table.armLeft, builder: (column) => column);

  GeneratedColumn<double> get thighRight => $composableBuilder(
    column: $table.thighRight,
    builder: (column) => column,
  );

  GeneratedColumn<double> get thighLeft =>
      $composableBuilder(column: $table.thighLeft, builder: (column) => column);

  GeneratedColumn<String> get achievement => $composableBuilder(
    column: $table.achievement,
    builder: (column) => column,
  );

  GeneratedColumn<String> get evaluation => $composableBuilder(
    column: $table.evaluation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recommendation => $composableBuilder(
    column: $table.recommendation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conclusion => $composableBuilder(
    column: $table.conclusion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get finalizedAt => $composableBuilder(
    column: $table.finalizedAt,
    builder: (column) => column,
  );

  $$PtPackagesTableAnnotationComposer get packageId {
    final $$PtPackagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.packageId,
      referencedTable: $db.ptPackages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PtPackagesTableAnnotationComposer(
            $db: $db,
            $table: $db.ptPackages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PostPtEvaluationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PostPtEvaluationsTable,
          PostPtEvaluation,
          $$PostPtEvaluationsTableFilterComposer,
          $$PostPtEvaluationsTableOrderingComposer,
          $$PostPtEvaluationsTableAnnotationComposer,
          $$PostPtEvaluationsTableCreateCompanionBuilder,
          $$PostPtEvaluationsTableUpdateCompanionBuilder,
          (PostPtEvaluation, $$PostPtEvaluationsTableReferences),
          PostPtEvaluation,
          PrefetchHooks Function({bool packageId})
        > {
  $$PostPtEvaluationsTableTableManager(
    _$AppDatabase db,
    $PostPtEvaluationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PostPtEvaluationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PostPtEvaluationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PostPtEvaluationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> packageId = const Value.absent(),
                Value<double?> finalWeightKg = const Value.absent(),
                Value<double?> bodyFatStart = const Value.absent(),
                Value<double?> bodyFatEnd = const Value.absent(),
                Value<double?> muscleStart = const Value.absent(),
                Value<double?> muscleEnd = const Value.absent(),
                Value<double?> armRight = const Value.absent(),
                Value<double?> armLeft = const Value.absent(),
                Value<double?> thighRight = const Value.absent(),
                Value<double?> thighLeft = const Value.absent(),
                Value<String> achievement = const Value.absent(),
                Value<String> evaluation = const Value.absent(),
                Value<String> recommendation = const Value.absent(),
                Value<String> conclusion = const Value.absent(),
                Value<DateTime> finalizedAt = const Value.absent(),
              }) => PostPtEvaluationsCompanion(
                id: id,
                packageId: packageId,
                finalWeightKg: finalWeightKg,
                bodyFatStart: bodyFatStart,
                bodyFatEnd: bodyFatEnd,
                muscleStart: muscleStart,
                muscleEnd: muscleEnd,
                armRight: armRight,
                armLeft: armLeft,
                thighRight: thighRight,
                thighLeft: thighLeft,
                achievement: achievement,
                evaluation: evaluation,
                recommendation: recommendation,
                conclusion: conclusion,
                finalizedAt: finalizedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int packageId,
                Value<double?> finalWeightKg = const Value.absent(),
                Value<double?> bodyFatStart = const Value.absent(),
                Value<double?> bodyFatEnd = const Value.absent(),
                Value<double?> muscleStart = const Value.absent(),
                Value<double?> muscleEnd = const Value.absent(),
                Value<double?> armRight = const Value.absent(),
                Value<double?> armLeft = const Value.absent(),
                Value<double?> thighRight = const Value.absent(),
                Value<double?> thighLeft = const Value.absent(),
                required String achievement,
                required String evaluation,
                required String recommendation,
                required String conclusion,
                Value<DateTime> finalizedAt = const Value.absent(),
              }) => PostPtEvaluationsCompanion.insert(
                id: id,
                packageId: packageId,
                finalWeightKg: finalWeightKg,
                bodyFatStart: bodyFatStart,
                bodyFatEnd: bodyFatEnd,
                muscleStart: muscleStart,
                muscleEnd: muscleEnd,
                armRight: armRight,
                armLeft: armLeft,
                thighRight: thighRight,
                thighLeft: thighLeft,
                achievement: achievement,
                evaluation: evaluation,
                recommendation: recommendation,
                conclusion: conclusion,
                finalizedAt: finalizedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PostPtEvaluationsTable, PostPtEvaluation>(table),
                  $$PostPtEvaluationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({packageId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (packageId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.packageId,
                        referencedTable: $$PostPtEvaluationsTableReferences
                            ._packageIdTable(db),
                        referencedColumn: $$PostPtEvaluationsTableReferences
                            ._packageIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PostPtEvaluationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PostPtEvaluationsTable,
      PostPtEvaluation,
      $$PostPtEvaluationsTableFilterComposer,
      $$PostPtEvaluationsTableOrderingComposer,
      $$PostPtEvaluationsTableAnnotationComposer,
      $$PostPtEvaluationsTableCreateCompanionBuilder,
      $$PostPtEvaluationsTableUpdateCompanionBuilder,
      (PostPtEvaluation, $$PostPtEvaluationsTableReferences),
      PostPtEvaluation,
      PrefetchHooks Function({bool packageId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TrainersTableTableManager get trainers =>
      $$TrainersTableTableManager(_db, _db.trainers);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$PtPackagesTableTableManager get ptPackages =>
      $$PtPackagesTableTableManager(_db, _db.ptPackages);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$ExerciseCatalogTableTableManager get exerciseCatalog =>
      $$ExerciseCatalogTableTableManager(_db, _db.exerciseCatalog);
  $$WorkoutLogsTableTableManager get workoutLogs =>
      $$WorkoutLogsTableTableManager(_db, _db.workoutLogs);
  $$WorkoutExercisesTableTableManager get workoutExercises =>
      $$WorkoutExercisesTableTableManager(_db, _db.workoutExercises);
  $$WorkoutSetsTableTableManager get workoutSets =>
      $$WorkoutSetsTableTableManager(_db, _db.workoutSets);
  $$PostPtEvaluationsTableTableManager get postPtEvaluations =>
      $$PostPtEvaluationsTableTableManager(_db, _db.postPtEvaluations);
}
