// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PersonTable extends Person with TableInfo<$PersonTable, PersonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, username];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person';
  @override
  VerificationContext validateIntegrity(Insertable<PersonData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
    );
  }

  @override
  $PersonTable createAlias(String alias) {
    return $PersonTable(attachedDatabase, alias);
  }
}

class PersonData extends DataClass implements Insertable<PersonData> {
  final int id;
  final String username;
  const PersonData({required this.id, required this.username});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    return map;
  }

  PersonCompanion toCompanion(bool nullToAbsent) {
    return PersonCompanion(
      id: Value(id),
      username: Value(username),
    );
  }

  factory PersonData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
    };
  }

  PersonData copyWith({int? id, String? username}) => PersonData(
        id: id ?? this.id,
        username: username ?? this.username,
      );
  PersonData copyWithCompanion(PersonCompanion data) {
    return PersonData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonData(')
          ..write('id: $id, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonData &&
          other.id == this.id &&
          other.username == this.username);
}

class PersonCompanion extends UpdateCompanion<PersonData> {
  final Value<int> id;
  final Value<String> username;
  const PersonCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
  });
  PersonCompanion.insert({
    this.id = const Value.absent(),
    required String username,
  }) : username = Value(username);
  static Insertable<PersonData> custom({
    Expression<int>? id,
    Expression<String>? username,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
    });
  }

  PersonCompanion copyWith({Value<int>? id, Value<String>? username}) {
    return PersonCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonCompanion(')
          ..write('id: $id, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }
}

class $ProfileTable extends Profile with TableInfo<$ProfileTable, ProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1028),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 40, maxTextLength: 40),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, firstName, lastName, bio, email, phoneNumber, token];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      bio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bio']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
    );
  }

  @override
  $ProfileTable createAlias(String alias) {
    return $ProfileTable(attachedDatabase, alias);
  }
}

class ProfileData extends DataClass implements Insertable<ProfileData> {
  final int id;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? bio;
  final String email;
  final String? phoneNumber;
  final String token;
  const ProfileData(
      {required this.id,
      required this.username,
      this.firstName,
      this.lastName,
      this.bio,
      required this.email,
      this.phoneNumber,
      required this.token});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    map['token'] = Variable<String>(token);
    return map;
  }

  ProfileCompanion toCompanion(bool nullToAbsent) {
    return ProfileCompanion(
      id: Value(id),
      username: Value(username),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      email: Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      token: Value(token),
    );
  }

  factory ProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      bio: serializer.fromJson<String?>(json['bio']),
      email: serializer.fromJson<String>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'bio': serializer.toJson<String?>(bio),
      'email': serializer.toJson<String>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'token': serializer.toJson<String>(token),
    };
  }

  ProfileData copyWith(
          {int? id,
          String? username,
          Value<String?> firstName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> bio = const Value.absent(),
          String? email,
          Value<String?> phoneNumber = const Value.absent(),
          String? token}) =>
      ProfileData(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName.present ? lastName.value : this.lastName,
        bio: bio.present ? bio.value : this.bio,
        email: email ?? this.email,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        token: token ?? this.token,
      );
  ProfileData copyWithCompanion(ProfileCompanion data) {
    return ProfileData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      bio: data.bio.present ? data.bio.value : this.bio,
      email: data.email.present ? data.email.value : this.email,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      token: data.token.present ? data.token.value : this.token,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('bio: $bio, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, username, firstName, lastName, bio, email, phoneNumber, token);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileData &&
          other.id == this.id &&
          other.username == this.username &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.bio == this.bio &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.token == this.token);
}

class ProfileCompanion extends UpdateCompanion<ProfileData> {
  final Value<int> id;
  final Value<String> username;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> bio;
  final Value<String> email;
  final Value<String?> phoneNumber;
  final Value<String> token;
  const ProfileCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.bio = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.token = const Value.absent(),
  });
  ProfileCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.bio = const Value.absent(),
    required String email,
    this.phoneNumber = const Value.absent(),
    required String token,
  })  : username = Value(username),
        email = Value(email),
        token = Value(token);
  static Insertable<ProfileData> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? bio,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<String>? token,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (bio != null) 'bio': bio,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (token != null) 'token': token,
    });
  }

  ProfileCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? bio,
      Value<String>? email,
      Value<String?>? phoneNumber,
      Value<String>? token}) {
    return ProfileCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('bio: $bio, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }
}

class $FriendTable extends Friend with TableInfo<$FriendTable, FriendData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _profileIdMeta =
      const VerificationMeta('profileId');
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
      'profile_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES profile(id) NOT NULL');
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1024),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, profileId, firstName, lastName, bio];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'friend';
  @override
  VerificationContext validateIntegrity(Insertable<FriendData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('profile_id')) {
      context.handle(_profileIdMeta,
          profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta));
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FriendData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FriendData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      profileId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}profile_id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      bio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bio']),
    );
  }

  @override
  $FriendTable createAlias(String alias) {
    return $FriendTable(attachedDatabase, alias);
  }
}

class FriendData extends DataClass implements Insertable<FriendData> {
  final int id;
  final String username;
  final int profileId;
  final String? firstName;
  final String? lastName;
  final String? bio;
  const FriendData(
      {required this.id,
      required this.username,
      required this.profileId,
      this.firstName,
      this.lastName,
      this.bio});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['profile_id'] = Variable<int>(profileId);
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    return map;
  }

  FriendCompanion toCompanion(bool nullToAbsent) {
    return FriendCompanion(
      id: Value(id),
      username: Value(username),
      profileId: Value(profileId),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
    );
  }

  factory FriendData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FriendData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      profileId: serializer.fromJson<int>(json['profileId']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      bio: serializer.fromJson<String?>(json['bio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'profileId': serializer.toJson<int>(profileId),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'bio': serializer.toJson<String?>(bio),
    };
  }

  FriendData copyWith(
          {int? id,
          String? username,
          int? profileId,
          Value<String?> firstName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> bio = const Value.absent()}) =>
      FriendData(
        id: id ?? this.id,
        username: username ?? this.username,
        profileId: profileId ?? this.profileId,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName.present ? lastName.value : this.lastName,
        bio: bio.present ? bio.value : this.bio,
      );
  FriendData copyWithCompanion(FriendCompanion data) {
    return FriendData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      bio: data.bio.present ? data.bio.value : this.bio,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FriendData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('profileId: $profileId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('bio: $bio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, username, profileId, firstName, lastName, bio);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FriendData &&
          other.id == this.id &&
          other.username == this.username &&
          other.profileId == this.profileId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.bio == this.bio);
}

class FriendCompanion extends UpdateCompanion<FriendData> {
  final Value<int> id;
  final Value<String> username;
  final Value<int> profileId;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> bio;
  const FriendCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.profileId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.bio = const Value.absent(),
  });
  FriendCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required int profileId,
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.bio = const Value.absent(),
  })  : username = Value(username),
        profileId = Value(profileId);
  static Insertable<FriendData> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<int>? profileId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? bio,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (profileId != null) 'profile_id': profileId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (bio != null) 'bio': bio,
    });
  }

  FriendCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<int>? profileId,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? bio}) {
    return FriendCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      profileId: profileId ?? this.profileId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('profileId: $profileId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('bio: $bio')
          ..write(')'))
        .toString();
  }
}

class $PictureTable extends Picture with TableInfo<$PictureTable, PictureData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PictureTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _profileIdMeta =
      const VerificationMeta('profileId');
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
      'profile_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES person(id) NOT NULL');
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, profileId, photoPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'picture';
  @override
  VerificationContext validateIntegrity(Insertable<PictureData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(_profileIdMeta,
          profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta));
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    } else if (isInserting) {
      context.missing(_photoPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PictureData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PictureData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      profileId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}profile_id'])!,
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path'])!,
    );
  }

  @override
  $PictureTable createAlias(String alias) {
    return $PictureTable(attachedDatabase, alias);
  }
}

class PictureData extends DataClass implements Insertable<PictureData> {
  final int id;
  final int profileId;
  final String photoPath;
  const PictureData(
      {required this.id, required this.profileId, required this.photoPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['photo_path'] = Variable<String>(photoPath);
    return map;
  }

  PictureCompanion toCompanion(bool nullToAbsent) {
    return PictureCompanion(
      id: Value(id),
      profileId: Value(profileId),
      photoPath: Value(photoPath),
    );
  }

  factory PictureData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PictureData(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      photoPath: serializer.fromJson<String>(json['photoPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'photoPath': serializer.toJson<String>(photoPath),
    };
  }

  PictureData copyWith({int? id, int? profileId, String? photoPath}) =>
      PictureData(
        id: id ?? this.id,
        profileId: profileId ?? this.profileId,
        photoPath: photoPath ?? this.photoPath,
      );
  PictureData copyWithCompanion(PictureCompanion data) {
    return PictureData(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PictureData(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, photoPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PictureData &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.photoPath == this.photoPath);
}

class PictureCompanion extends UpdateCompanion<PictureData> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> photoPath;
  const PictureCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.photoPath = const Value.absent(),
  });
  PictureCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String photoPath,
  })  : profileId = Value(profileId),
        photoPath = Value(photoPath);
  static Insertable<PictureData> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? photoPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (photoPath != null) 'photo_path': photoPath,
    });
  }

  PictureCompanion copyWith(
      {Value<int>? id, Value<int>? profileId, Value<String>? photoPath}) {
    return PictureCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PictureCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }
}

class $GalleryPictureTable extends GalleryPicture
    with TableInfo<$GalleryPictureTable, GalleryPictureData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GalleryPictureTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _profileIdMeta =
      const VerificationMeta('profileId');
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
      'profile_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES person(id) NOT NULL');
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, profileId, photoPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gallery_picture';
  @override
  VerificationContext validateIntegrity(Insertable<GalleryPictureData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(_profileIdMeta,
          profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta));
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    } else if (isInserting) {
      context.missing(_photoPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GalleryPictureData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GalleryPictureData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      profileId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}profile_id'])!,
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path'])!,
    );
  }

  @override
  $GalleryPictureTable createAlias(String alias) {
    return $GalleryPictureTable(attachedDatabase, alias);
  }
}

class GalleryPictureData extends DataClass
    implements Insertable<GalleryPictureData> {
  final int id;
  final int profileId;
  final String photoPath;
  const GalleryPictureData(
      {required this.id, required this.profileId, required this.photoPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['photo_path'] = Variable<String>(photoPath);
    return map;
  }

  GalleryPictureCompanion toCompanion(bool nullToAbsent) {
    return GalleryPictureCompanion(
      id: Value(id),
      profileId: Value(profileId),
      photoPath: Value(photoPath),
    );
  }

  factory GalleryPictureData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GalleryPictureData(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      photoPath: serializer.fromJson<String>(json['photoPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'photoPath': serializer.toJson<String>(photoPath),
    };
  }

  GalleryPictureData copyWith({int? id, int? profileId, String? photoPath}) =>
      GalleryPictureData(
        id: id ?? this.id,
        profileId: profileId ?? this.profileId,
        photoPath: photoPath ?? this.photoPath,
      );
  GalleryPictureData copyWithCompanion(GalleryPictureCompanion data) {
    return GalleryPictureData(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GalleryPictureData(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, photoPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GalleryPictureData &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.photoPath == this.photoPath);
}

class GalleryPictureCompanion extends UpdateCompanion<GalleryPictureData> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> photoPath;
  const GalleryPictureCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.photoPath = const Value.absent(),
  });
  GalleryPictureCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String photoPath,
  })  : profileId = Value(profileId),
        photoPath = Value(photoPath);
  static Insertable<GalleryPictureData> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? photoPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (photoPath != null) 'photo_path': photoPath,
    });
  }

  GalleryPictureCompanion copyWith(
      {Value<int>? id, Value<int>? profileId, Value<String>? photoPath}) {
    return GalleryPictureCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GalleryPictureCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }
}

class $ProfilePictureTable extends ProfilePicture
    with TableInfo<$ProfilePictureTable, ProfilePictureData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilePictureTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _profileIdMeta =
      const VerificationMeta('profileId');
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
      'profile_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES person(id) NOT NULL');
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, profileId, photoPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile_picture';
  @override
  VerificationContext validateIntegrity(Insertable<ProfilePictureData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(_profileIdMeta,
          profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta));
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    } else if (isInserting) {
      context.missing(_photoPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfilePictureData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfilePictureData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      profileId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}profile_id'])!,
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path'])!,
    );
  }

  @override
  $ProfilePictureTable createAlias(String alias) {
    return $ProfilePictureTable(attachedDatabase, alias);
  }
}

class ProfilePictureData extends DataClass
    implements Insertable<ProfilePictureData> {
  final int id;
  final int profileId;
  final String photoPath;
  const ProfilePictureData(
      {required this.id, required this.profileId, required this.photoPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['photo_path'] = Variable<String>(photoPath);
    return map;
  }

  ProfilePictureCompanion toCompanion(bool nullToAbsent) {
    return ProfilePictureCompanion(
      id: Value(id),
      profileId: Value(profileId),
      photoPath: Value(photoPath),
    );
  }

  factory ProfilePictureData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfilePictureData(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      photoPath: serializer.fromJson<String>(json['photoPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'photoPath': serializer.toJson<String>(photoPath),
    };
  }

  ProfilePictureData copyWith({int? id, int? profileId, String? photoPath}) =>
      ProfilePictureData(
        id: id ?? this.id,
        profileId: profileId ?? this.profileId,
        photoPath: photoPath ?? this.photoPath,
      );
  ProfilePictureData copyWithCompanion(ProfilePictureCompanion data) {
    return ProfilePictureData(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfilePictureData(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, photoPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfilePictureData &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.photoPath == this.photoPath);
}

class ProfilePictureCompanion extends UpdateCompanion<ProfilePictureData> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> photoPath;
  const ProfilePictureCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.photoPath = const Value.absent(),
  });
  ProfilePictureCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String photoPath,
  })  : profileId = Value(profileId),
        photoPath = Value(photoPath);
  static Insertable<ProfilePictureData> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? photoPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (photoPath != null) 'photo_path': photoPath,
    });
  }

  ProfilePictureCompanion copyWith(
      {Value<int>? id, Value<int>? profileId, Value<String>? photoPath}) {
    return ProfilePictureCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilePictureCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PersonTable person = $PersonTable(this);
  late final $ProfileTable profile = $ProfileTable(this);
  late final $FriendTable friend = $FriendTable(this);
  late final $PictureTable picture = $PictureTable(this);
  late final $GalleryPictureTable galleryPicture = $GalleryPictureTable(this);
  late final $ProfilePictureTable profilePicture = $ProfilePictureTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [person, profile, friend, picture, galleryPicture, profilePicture];
}

typedef $$PersonTableCreateCompanionBuilder = PersonCompanion Function({
  Value<int> id,
  required String username,
});
typedef $$PersonTableUpdateCompanionBuilder = PersonCompanion Function({
  Value<int> id,
  Value<String> username,
});

final class $$PersonTableReferences
    extends BaseReferences<_$AppDatabase, $PersonTable, PersonData> {
  $$PersonTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PictureTable, List<PictureData>>
      _pictureRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.picture,
          aliasName: $_aliasNameGenerator(db.person.id, db.picture.profileId));

  $$PictureTableProcessedTableManager get pictureRefs {
    final manager = $$PictureTableTableManager($_db, $_db.picture)
        .filter((f) => f.profileId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_pictureRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$GalleryPictureTable, List<GalleryPictureData>>
      _galleryPictureRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.galleryPicture,
              aliasName: $_aliasNameGenerator(
                  db.person.id, db.galleryPicture.profileId));

  $$GalleryPictureTableProcessedTableManager get galleryPictureRefs {
    final manager = $$GalleryPictureTableTableManager($_db, $_db.galleryPicture)
        .filter((f) => f.profileId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_galleryPictureRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ProfilePictureTable, List<ProfilePictureData>>
      _profilePictureRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.profilePicture,
              aliasName: $_aliasNameGenerator(
                  db.person.id, db.profilePicture.profileId));

  $$ProfilePictureTableProcessedTableManager get profilePictureRefs {
    final manager = $$ProfilePictureTableTableManager($_db, $_db.profilePicture)
        .filter((f) => f.profileId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_profilePictureRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PersonTableFilterComposer
    extends Composer<_$AppDatabase, $PersonTable> {
  $$PersonTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  Expression<bool> pictureRefs(
      Expression<bool> Function($$PictureTableFilterComposer f) f) {
    final $$PictureTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.picture,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PictureTableFilterComposer(
              $db: $db,
              $table: $db.picture,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> galleryPictureRefs(
      Expression<bool> Function($$GalleryPictureTableFilterComposer f) f) {
    final $$GalleryPictureTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.galleryPicture,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GalleryPictureTableFilterComposer(
              $db: $db,
              $table: $db.galleryPicture,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> profilePictureRefs(
      Expression<bool> Function($$ProfilePictureTableFilterComposer f) f) {
    final $$ProfilePictureTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.profilePicture,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProfilePictureTableFilterComposer(
              $db: $db,
              $table: $db.profilePicture,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PersonTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonTable> {
  $$PersonTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));
}

class $$PersonTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonTable> {
  $$PersonTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  Expression<T> pictureRefs<T extends Object>(
      Expression<T> Function($$PictureTableAnnotationComposer a) f) {
    final $$PictureTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.picture,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PictureTableAnnotationComposer(
              $db: $db,
              $table: $db.picture,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> galleryPictureRefs<T extends Object>(
      Expression<T> Function($$GalleryPictureTableAnnotationComposer a) f) {
    final $$GalleryPictureTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.galleryPicture,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GalleryPictureTableAnnotationComposer(
              $db: $db,
              $table: $db.galleryPicture,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> profilePictureRefs<T extends Object>(
      Expression<T> Function($$ProfilePictureTableAnnotationComposer a) f) {
    final $$ProfilePictureTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.profilePicture,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProfilePictureTableAnnotationComposer(
              $db: $db,
              $table: $db.profilePicture,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PersonTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PersonTable,
    PersonData,
    $$PersonTableFilterComposer,
    $$PersonTableOrderingComposer,
    $$PersonTableAnnotationComposer,
    $$PersonTableCreateCompanionBuilder,
    $$PersonTableUpdateCompanionBuilder,
    (PersonData, $$PersonTableReferences),
    PersonData,
    PrefetchHooks Function(
        {bool pictureRefs, bool galleryPictureRefs, bool profilePictureRefs})> {
  $$PersonTableTableManager(_$AppDatabase db, $PersonTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
          }) =>
              PersonCompanion(
            id: id,
            username: username,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String username,
          }) =>
              PersonCompanion.insert(
            id: id,
            username: username,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PersonTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {pictureRefs = false,
              galleryPictureRefs = false,
              profilePictureRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pictureRefs) db.picture,
                if (galleryPictureRefs) db.galleryPicture,
                if (profilePictureRefs) db.profilePicture
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pictureRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PersonTableReferences._pictureRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PersonTableReferences(db, table, p0).pictureRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.profileId == item.id),
                        typedResults: items),
                  if (galleryPictureRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PersonTableReferences
                            ._galleryPictureRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PersonTableReferences(db, table, p0)
                                .galleryPictureRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.profileId == item.id),
                        typedResults: items),
                  if (profilePictureRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PersonTableReferences
                            ._profilePictureRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PersonTableReferences(db, table, p0)
                                .profilePictureRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.profileId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PersonTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PersonTable,
    PersonData,
    $$PersonTableFilterComposer,
    $$PersonTableOrderingComposer,
    $$PersonTableAnnotationComposer,
    $$PersonTableCreateCompanionBuilder,
    $$PersonTableUpdateCompanionBuilder,
    (PersonData, $$PersonTableReferences),
    PersonData,
    PrefetchHooks Function(
        {bool pictureRefs, bool galleryPictureRefs, bool profilePictureRefs})>;
typedef $$ProfileTableCreateCompanionBuilder = ProfileCompanion Function({
  Value<int> id,
  required String username,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> bio,
  required String email,
  Value<String?> phoneNumber,
  required String token,
});
typedef $$ProfileTableUpdateCompanionBuilder = ProfileCompanion Function({
  Value<int> id,
  Value<String> username,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> bio,
  Value<String> email,
  Value<String?> phoneNumber,
  Value<String> token,
});

final class $$ProfileTableReferences
    extends BaseReferences<_$AppDatabase, $ProfileTable, ProfileData> {
  $$ProfileTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FriendTable, List<FriendData>> _friendRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.friend,
          aliasName: $_aliasNameGenerator(db.profile.id, db.friend.profileId));

  $$FriendTableProcessedTableManager get friendRefs {
    final manager = $$FriendTableTableManager($_db, $_db.friend)
        .filter((f) => f.profileId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_friendRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProfileTableFilterComposer
    extends Composer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnFilters(column));

  Expression<bool> friendRefs(
      Expression<bool> Function($$FriendTableFilterComposer f) f) {
    final $$FriendTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.friend,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FriendTableFilterComposer(
              $db: $db,
              $table: $db.friend,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProfileTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnOrderings(column));
}

class $$ProfileTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  Expression<T> friendRefs<T extends Object>(
      Expression<T> Function($$FriendTableAnnotationComposer a) f) {
    final $$FriendTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.friend,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FriendTableAnnotationComposer(
              $db: $db,
              $table: $db.friend,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProfileTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProfileTable,
    ProfileData,
    $$ProfileTableFilterComposer,
    $$ProfileTableOrderingComposer,
    $$ProfileTableAnnotationComposer,
    $$ProfileTableCreateCompanionBuilder,
    $$ProfileTableUpdateCompanionBuilder,
    (ProfileData, $$ProfileTableReferences),
    ProfileData,
    PrefetchHooks Function({bool friendRefs})> {
  $$ProfileTableTableManager(_$AppDatabase db, $ProfileTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> bio = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<String> token = const Value.absent(),
          }) =>
              ProfileCompanion(
            id: id,
            username: username,
            firstName: firstName,
            lastName: lastName,
            bio: bio,
            email: email,
            phoneNumber: phoneNumber,
            token: token,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String username,
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> bio = const Value.absent(),
            required String email,
            Value<String?> phoneNumber = const Value.absent(),
            required String token,
          }) =>
              ProfileCompanion.insert(
            id: id,
            username: username,
            firstName: firstName,
            lastName: lastName,
            bio: bio,
            email: email,
            phoneNumber: phoneNumber,
            token: token,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProfileTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({friendRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (friendRefs) db.friend],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (friendRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ProfileTableReferences._friendRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProfileTableReferences(db, table, p0).friendRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.profileId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProfileTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProfileTable,
    ProfileData,
    $$ProfileTableFilterComposer,
    $$ProfileTableOrderingComposer,
    $$ProfileTableAnnotationComposer,
    $$ProfileTableCreateCompanionBuilder,
    $$ProfileTableUpdateCompanionBuilder,
    (ProfileData, $$ProfileTableReferences),
    ProfileData,
    PrefetchHooks Function({bool friendRefs})>;
typedef $$FriendTableCreateCompanionBuilder = FriendCompanion Function({
  Value<int> id,
  required String username,
  required int profileId,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> bio,
});
typedef $$FriendTableUpdateCompanionBuilder = FriendCompanion Function({
  Value<int> id,
  Value<String> username,
  Value<int> profileId,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> bio,
});

final class $$FriendTableReferences
    extends BaseReferences<_$AppDatabase, $FriendTable, FriendData> {
  $$FriendTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProfileTable _profileIdTable(_$AppDatabase db) => db.profile
      .createAlias($_aliasNameGenerator(db.friend.profileId, db.profile.id));

  $$ProfileTableProcessedTableManager? get profileId {
    if ($_item.profileId == null) return null;
    final manager = $$ProfileTableTableManager($_db, $_db.profile)
        .filter((f) => f.id($_item.profileId!));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FriendTableFilterComposer
    extends Composer<_$AppDatabase, $FriendTable> {
  $$FriendTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnFilters(column));

  $$ProfileTableFilterComposer get profileId {
    final $$ProfileTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.profile,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProfileTableFilterComposer(
              $db: $db,
              $table: $db.profile,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FriendTableOrderingComposer
    extends Composer<_$AppDatabase, $FriendTable> {
  $$FriendTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnOrderings(column));

  $$ProfileTableOrderingComposer get profileId {
    final $$ProfileTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.profile,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProfileTableOrderingComposer(
              $db: $db,
              $table: $db.profile,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FriendTableAnnotationComposer
    extends Composer<_$AppDatabase, $FriendTable> {
  $$FriendTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  $$ProfileTableAnnotationComposer get profileId {
    final $$ProfileTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.profile,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProfileTableAnnotationComposer(
              $db: $db,
              $table: $db.profile,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FriendTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FriendTable,
    FriendData,
    $$FriendTableFilterComposer,
    $$FriendTableOrderingComposer,
    $$FriendTableAnnotationComposer,
    $$FriendTableCreateCompanionBuilder,
    $$FriendTableUpdateCompanionBuilder,
    (FriendData, $$FriendTableReferences),
    FriendData,
    PrefetchHooks Function({bool profileId})> {
  $$FriendTableTableManager(_$AppDatabase db, $FriendTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FriendTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FriendTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FriendTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<int> profileId = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> bio = const Value.absent(),
          }) =>
              FriendCompanion(
            id: id,
            username: username,
            profileId: profileId,
            firstName: firstName,
            lastName: lastName,
            bio: bio,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String username,
            required int profileId,
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> bio = const Value.absent(),
          }) =>
              FriendCompanion.insert(
            id: id,
            username: username,
            profileId: profileId,
            firstName: firstName,
            lastName: lastName,
            bio: bio,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$FriendTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (profileId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.profileId,
                    referencedTable:
                        $$FriendTableReferences._profileIdTable(db),
                    referencedColumn:
                        $$FriendTableReferences._profileIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FriendTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FriendTable,
    FriendData,
    $$FriendTableFilterComposer,
    $$FriendTableOrderingComposer,
    $$FriendTableAnnotationComposer,
    $$FriendTableCreateCompanionBuilder,
    $$FriendTableUpdateCompanionBuilder,
    (FriendData, $$FriendTableReferences),
    FriendData,
    PrefetchHooks Function({bool profileId})>;
typedef $$PictureTableCreateCompanionBuilder = PictureCompanion Function({
  Value<int> id,
  required int profileId,
  required String photoPath,
});
typedef $$PictureTableUpdateCompanionBuilder = PictureCompanion Function({
  Value<int> id,
  Value<int> profileId,
  Value<String> photoPath,
});

final class $$PictureTableReferences
    extends BaseReferences<_$AppDatabase, $PictureTable, PictureData> {
  $$PictureTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PersonTable _profileIdTable(_$AppDatabase db) => db.person
      .createAlias($_aliasNameGenerator(db.picture.profileId, db.person.id));

  $$PersonTableProcessedTableManager? get profileId {
    if ($_item.profileId == null) return null;
    final manager = $$PersonTableTableManager($_db, $_db.person)
        .filter((f) => f.id($_item.profileId!));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PictureTableFilterComposer
    extends Composer<_$AppDatabase, $PictureTable> {
  $$PictureTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnFilters(column));

  $$PersonTableFilterComposer get profileId {
    final $$PersonTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableFilterComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PictureTableOrderingComposer
    extends Composer<_$AppDatabase, $PictureTable> {
  $$PictureTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnOrderings(column));

  $$PersonTableOrderingComposer get profileId {
    final $$PersonTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableOrderingComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PictureTableAnnotationComposer
    extends Composer<_$AppDatabase, $PictureTable> {
  $$PictureTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  $$PersonTableAnnotationComposer get profileId {
    final $$PersonTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableAnnotationComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PictureTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PictureTable,
    PictureData,
    $$PictureTableFilterComposer,
    $$PictureTableOrderingComposer,
    $$PictureTableAnnotationComposer,
    $$PictureTableCreateCompanionBuilder,
    $$PictureTableUpdateCompanionBuilder,
    (PictureData, $$PictureTableReferences),
    PictureData,
    PrefetchHooks Function({bool profileId})> {
  $$PictureTableTableManager(_$AppDatabase db, $PictureTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PictureTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PictureTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PictureTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> profileId = const Value.absent(),
            Value<String> photoPath = const Value.absent(),
          }) =>
              PictureCompanion(
            id: id,
            profileId: profileId,
            photoPath: photoPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int profileId,
            required String photoPath,
          }) =>
              PictureCompanion.insert(
            id: id,
            profileId: profileId,
            photoPath: photoPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PictureTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (profileId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.profileId,
                    referencedTable:
                        $$PictureTableReferences._profileIdTable(db),
                    referencedColumn:
                        $$PictureTableReferences._profileIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PictureTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PictureTable,
    PictureData,
    $$PictureTableFilterComposer,
    $$PictureTableOrderingComposer,
    $$PictureTableAnnotationComposer,
    $$PictureTableCreateCompanionBuilder,
    $$PictureTableUpdateCompanionBuilder,
    (PictureData, $$PictureTableReferences),
    PictureData,
    PrefetchHooks Function({bool profileId})>;
typedef $$GalleryPictureTableCreateCompanionBuilder = GalleryPictureCompanion
    Function({
  Value<int> id,
  required int profileId,
  required String photoPath,
});
typedef $$GalleryPictureTableUpdateCompanionBuilder = GalleryPictureCompanion
    Function({
  Value<int> id,
  Value<int> profileId,
  Value<String> photoPath,
});

final class $$GalleryPictureTableReferences extends BaseReferences<
    _$AppDatabase, $GalleryPictureTable, GalleryPictureData> {
  $$GalleryPictureTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PersonTable _profileIdTable(_$AppDatabase db) =>
      db.person.createAlias(
          $_aliasNameGenerator(db.galleryPicture.profileId, db.person.id));

  $$PersonTableProcessedTableManager? get profileId {
    if ($_item.profileId == null) return null;
    final manager = $$PersonTableTableManager($_db, $_db.person)
        .filter((f) => f.id($_item.profileId!));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GalleryPictureTableFilterComposer
    extends Composer<_$AppDatabase, $GalleryPictureTable> {
  $$GalleryPictureTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnFilters(column));

  $$PersonTableFilterComposer get profileId {
    final $$PersonTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableFilterComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GalleryPictureTableOrderingComposer
    extends Composer<_$AppDatabase, $GalleryPictureTable> {
  $$GalleryPictureTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnOrderings(column));

  $$PersonTableOrderingComposer get profileId {
    final $$PersonTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableOrderingComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GalleryPictureTableAnnotationComposer
    extends Composer<_$AppDatabase, $GalleryPictureTable> {
  $$GalleryPictureTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  $$PersonTableAnnotationComposer get profileId {
    final $$PersonTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableAnnotationComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GalleryPictureTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GalleryPictureTable,
    GalleryPictureData,
    $$GalleryPictureTableFilterComposer,
    $$GalleryPictureTableOrderingComposer,
    $$GalleryPictureTableAnnotationComposer,
    $$GalleryPictureTableCreateCompanionBuilder,
    $$GalleryPictureTableUpdateCompanionBuilder,
    (GalleryPictureData, $$GalleryPictureTableReferences),
    GalleryPictureData,
    PrefetchHooks Function({bool profileId})> {
  $$GalleryPictureTableTableManager(
      _$AppDatabase db, $GalleryPictureTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GalleryPictureTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GalleryPictureTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GalleryPictureTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> profileId = const Value.absent(),
            Value<String> photoPath = const Value.absent(),
          }) =>
              GalleryPictureCompanion(
            id: id,
            profileId: profileId,
            photoPath: photoPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int profileId,
            required String photoPath,
          }) =>
              GalleryPictureCompanion.insert(
            id: id,
            profileId: profileId,
            photoPath: photoPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GalleryPictureTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (profileId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.profileId,
                    referencedTable:
                        $$GalleryPictureTableReferences._profileIdTable(db),
                    referencedColumn:
                        $$GalleryPictureTableReferences._profileIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$GalleryPictureTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GalleryPictureTable,
    GalleryPictureData,
    $$GalleryPictureTableFilterComposer,
    $$GalleryPictureTableOrderingComposer,
    $$GalleryPictureTableAnnotationComposer,
    $$GalleryPictureTableCreateCompanionBuilder,
    $$GalleryPictureTableUpdateCompanionBuilder,
    (GalleryPictureData, $$GalleryPictureTableReferences),
    GalleryPictureData,
    PrefetchHooks Function({bool profileId})>;
typedef $$ProfilePictureTableCreateCompanionBuilder = ProfilePictureCompanion
    Function({
  Value<int> id,
  required int profileId,
  required String photoPath,
});
typedef $$ProfilePictureTableUpdateCompanionBuilder = ProfilePictureCompanion
    Function({
  Value<int> id,
  Value<int> profileId,
  Value<String> photoPath,
});

final class $$ProfilePictureTableReferences extends BaseReferences<
    _$AppDatabase, $ProfilePictureTable, ProfilePictureData> {
  $$ProfilePictureTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PersonTable _profileIdTable(_$AppDatabase db) =>
      db.person.createAlias(
          $_aliasNameGenerator(db.profilePicture.profileId, db.person.id));

  $$PersonTableProcessedTableManager? get profileId {
    if ($_item.profileId == null) return null;
    final manager = $$PersonTableTableManager($_db, $_db.person)
        .filter((f) => f.id($_item.profileId!));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProfilePictureTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilePictureTable> {
  $$ProfilePictureTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnFilters(column));

  $$PersonTableFilterComposer get profileId {
    final $$PersonTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableFilterComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProfilePictureTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilePictureTable> {
  $$ProfilePictureTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnOrderings(column));

  $$PersonTableOrderingComposer get profileId {
    final $$PersonTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableOrderingComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProfilePictureTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilePictureTable> {
  $$ProfilePictureTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  $$PersonTableAnnotationComposer get profileId {
    final $$PersonTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PersonTableAnnotationComposer(
              $db: $db,
              $table: $db.person,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProfilePictureTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProfilePictureTable,
    ProfilePictureData,
    $$ProfilePictureTableFilterComposer,
    $$ProfilePictureTableOrderingComposer,
    $$ProfilePictureTableAnnotationComposer,
    $$ProfilePictureTableCreateCompanionBuilder,
    $$ProfilePictureTableUpdateCompanionBuilder,
    (ProfilePictureData, $$ProfilePictureTableReferences),
    ProfilePictureData,
    PrefetchHooks Function({bool profileId})> {
  $$ProfilePictureTableTableManager(
      _$AppDatabase db, $ProfilePictureTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilePictureTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilePictureTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilePictureTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> profileId = const Value.absent(),
            Value<String> photoPath = const Value.absent(),
          }) =>
              ProfilePictureCompanion(
            id: id,
            profileId: profileId,
            photoPath: photoPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int profileId,
            required String photoPath,
          }) =>
              ProfilePictureCompanion.insert(
            id: id,
            profileId: profileId,
            photoPath: photoPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProfilePictureTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (profileId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.profileId,
                    referencedTable:
                        $$ProfilePictureTableReferences._profileIdTable(db),
                    referencedColumn:
                        $$ProfilePictureTableReferences._profileIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ProfilePictureTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProfilePictureTable,
    ProfilePictureData,
    $$ProfilePictureTableFilterComposer,
    $$ProfilePictureTableOrderingComposer,
    $$ProfilePictureTableAnnotationComposer,
    $$ProfilePictureTableCreateCompanionBuilder,
    $$ProfilePictureTableUpdateCompanionBuilder,
    (ProfilePictureData, $$ProfilePictureTableReferences),
    ProfilePictureData,
    PrefetchHooks Function({bool profileId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PersonTableTableManager get person =>
      $$PersonTableTableManager(_db, _db.person);
  $$ProfileTableTableManager get profile =>
      $$ProfileTableTableManager(_db, _db.profile);
  $$FriendTableTableManager get friend =>
      $$FriendTableTableManager(_db, _db.friend);
  $$PictureTableTableManager get picture =>
      $$PictureTableTableManager(_db, _db.picture);
  $$GalleryPictureTableTableManager get galleryPicture =>
      $$GalleryPictureTableTableManager(_db, _db.galleryPicture);
  $$ProfilePictureTableTableManager get profilePicture =>
      $$ProfilePictureTableTableManager(_db, _db.profilePicture);
}
