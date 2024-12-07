// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
//@dart=2.12
import 'package:drift/drift.dart';

class Person extends Table with TableInfo<Person, PersonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Person(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  Person createAlias(String alias) {
    return Person(attachedDatabase, alias);
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

class Profile extends Table with TableInfo<Profile, ProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Profile(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1028),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
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
  Profile createAlias(String alias) {
    return Profile(attachedDatabase, alias);
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

class Friend extends Table with TableInfo<Friend, FriendData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Friend(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
      'profile_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES profile(id) NOT NULL');
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
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
  Friend createAlias(String alias) {
    return Friend(attachedDatabase, alias);
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

class Picture extends Table with TableInfo<Picture, PictureData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Picture(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
      'profile_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES person(id) NOT NULL');
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
  Picture createAlias(String alias) {
    return Picture(attachedDatabase, alias);
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

class DatabaseAtV1 extends GeneratedDatabase {
  DatabaseAtV1(QueryExecutor e) : super(e);
  late final Person person = Person(this);
  late final Profile profile = Profile(this);
  late final Friend friend = Friend(this);
  late final Picture picture = Picture(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [person, profile, friend, picture];
  @override
  int get schemaVersion => 1;
}
