// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
      'first_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1028),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
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
  late final GeneratedColumn<int> phoneNumber = GeneratedColumn<int>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    } else if (isInserting) {
      context.missing(_bioMeta);
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
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      bio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bio'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}phone_number'])!,
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
  final String firstName;
  final String lastName;
  final String bio;
  final String email;
  final int phoneNumber;
  final String token;
  const ProfileData(
      {required this.id,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.bio,
      required this.email,
      required this.phoneNumber,
      required this.token});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['bio'] = Variable<String>(bio);
    map['email'] = Variable<String>(email);
    map['phone_number'] = Variable<int>(phoneNumber);
    map['token'] = Variable<String>(token);
    return map;
  }

  ProfileCompanion toCompanion(bool nullToAbsent) {
    return ProfileCompanion(
      id: Value(id),
      username: Value(username),
      firstName: Value(firstName),
      lastName: Value(lastName),
      bio: Value(bio),
      email: Value(email),
      phoneNumber: Value(phoneNumber),
      token: Value(token),
    );
  }

  factory ProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      bio: serializer.fromJson<String>(json['bio']),
      email: serializer.fromJson<String>(json['email']),
      phoneNumber: serializer.fromJson<int>(json['phoneNumber']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'bio': serializer.toJson<String>(bio),
      'email': serializer.toJson<String>(email),
      'phoneNumber': serializer.toJson<int>(phoneNumber),
      'token': serializer.toJson<String>(token),
    };
  }

  ProfileData copyWith(
          {int? id,
          String? username,
          String? firstName,
          String? lastName,
          String? bio,
          String? email,
          int? phoneNumber,
          String? token}) =>
      ProfileData(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        bio: bio ?? this.bio,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
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
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> bio;
  final Value<String> email;
  final Value<int> phoneNumber;
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
    required String firstName,
    required String lastName,
    required String bio,
    required String email,
    required int phoneNumber,
    required String token,
  })  : username = Value(username),
        firstName = Value(firstName),
        lastName = Value(lastName),
        bio = Value(bio),
        email = Value(email),
        phoneNumber = Value(phoneNumber),
        token = Value(token);
  static Insertable<ProfileData> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? bio,
    Expression<String>? email,
    Expression<int>? phoneNumber,
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
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? bio,
      Value<String>? email,
      Value<int>? phoneNumber,
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
      map['phone_number'] = Variable<int>(phoneNumber.value);
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
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1028),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
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

class $PhotoTable extends Photo with TableInfo<$PhotoTable, PhotoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'photo';
  @override
  VerificationContext validateIntegrity(Insertable<PhotoData> instance,
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
  PhotoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      profileId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}profile_id'])!,
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path'])!,
    );
  }

  @override
  $PhotoTable createAlias(String alias) {
    return $PhotoTable(attachedDatabase, alias);
  }
}

class PhotoData extends DataClass implements Insertable<PhotoData> {
  final int id;
  final int profileId;
  final String photoPath;
  const PhotoData(
      {required this.id, required this.profileId, required this.photoPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['photo_path'] = Variable<String>(photoPath);
    return map;
  }

  PhotoCompanion toCompanion(bool nullToAbsent) {
    return PhotoCompanion(
      id: Value(id),
      profileId: Value(profileId),
      photoPath: Value(photoPath),
    );
  }

  factory PhotoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoData(
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

  PhotoData copyWith({int? id, int? profileId, String? photoPath}) => PhotoData(
        id: id ?? this.id,
        profileId: profileId ?? this.profileId,
        photoPath: photoPath ?? this.photoPath,
      );
  PhotoData copyWithCompanion(PhotoCompanion data) {
    return PhotoData(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoData(')
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
      (other is PhotoData &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.photoPath == this.photoPath);
}

class PhotoCompanion extends UpdateCompanion<PhotoData> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> photoPath;
  const PhotoCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.photoPath = const Value.absent(),
  });
  PhotoCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String photoPath,
  })  : profileId = Value(profileId),
        photoPath = Value(photoPath);
  static Insertable<PhotoData> custom({
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

  PhotoCompanion copyWith(
      {Value<int>? id, Value<int>? profileId, Value<String>? photoPath}) {
    return PhotoCompanion(
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
    return (StringBuffer('PhotoCompanion(')
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
  late final $ProfileTable profile = $ProfileTable(this);
  late final $FriendTable friend = $FriendTable(this);
  late final $PersonTable person = $PersonTable(this);
  late final $PhotoTable photo = $PhotoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [profile, friend, person, photo];
}

typedef $$ProfileTableCreateCompanionBuilder = ProfileCompanion Function({
  Value<int> id,
  required String username,
  required String firstName,
  required String lastName,
  required String bio,
  required String email,
  required int phoneNumber,
  required String token,
});
typedef $$ProfileTableUpdateCompanionBuilder = ProfileCompanion Function({
  Value<int> id,
  Value<String> username,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> bio,
  Value<String> email,
  Value<int> phoneNumber,
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
    extends FilterComposer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bio => $state.composableBuilder(
      column: $state.table.bio,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get phoneNumber => $state.composableBuilder(
      column: $state.table.phoneNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter friendRefs(
      ComposableFilter Function($$FriendTableFilterComposer f) f) {
    final $$FriendTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.friend,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder, parentComposers) => $$FriendTableFilterComposer(
            ComposerState(
                $state.db, $state.db.friend, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ProfileTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bio => $state.composableBuilder(
      column: $state.table.bio,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get phoneNumber => $state.composableBuilder(
      column: $state.table.phoneNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ProfileTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProfileTable,
    ProfileData,
    $$ProfileTableFilterComposer,
    $$ProfileTableOrderingComposer,
    $$ProfileTableCreateCompanionBuilder,
    $$ProfileTableUpdateCompanionBuilder,
    (ProfileData, $$ProfileTableReferences),
    ProfileData,
    PrefetchHooks Function({bool friendRefs})> {
  $$ProfileTableTableManager(_$AppDatabase db, $ProfileTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProfileTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProfileTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> bio = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<int> phoneNumber = const Value.absent(),
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
            required String firstName,
            required String lastName,
            required String bio,
            required String email,
            required int phoneNumber,
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
    extends FilterComposer<_$AppDatabase, $FriendTable> {
  $$FriendTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bio => $state.composableBuilder(
      column: $state.table.bio,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProfileTableFilterComposer get profileId {
    final $$ProfileTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $state.db.profile,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ProfileTableFilterComposer(
            ComposerState(
                $state.db, $state.db.profile, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FriendTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FriendTable> {
  $$FriendTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bio => $state.composableBuilder(
      column: $state.table.bio,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProfileTableOrderingComposer get profileId {
    final $$ProfileTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $state.db.profile,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfileTableOrderingComposer(ComposerState(
                $state.db, $state.db.profile, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FriendTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FriendTable,
    FriendData,
    $$FriendTableFilterComposer,
    $$FriendTableOrderingComposer,
    $$FriendTableCreateCompanionBuilder,
    $$FriendTableUpdateCompanionBuilder,
    (FriendData, $$FriendTableReferences),
    FriendData,
    PrefetchHooks Function({bool profileId})> {
  $$FriendTableTableManager(_$AppDatabase db, $FriendTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FriendTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FriendTableOrderingComposer(ComposerState(db, table)),
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
    $$FriendTableCreateCompanionBuilder,
    $$FriendTableUpdateCompanionBuilder,
    (FriendData, $$FriendTableReferences),
    FriendData,
    PrefetchHooks Function({bool profileId})>;
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

  static MultiTypedResultKey<$PhotoTable, List<PhotoData>> _photoRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.photo,
          aliasName: $_aliasNameGenerator(db.person.id, db.photo.profileId));

  $$PhotoTableProcessedTableManager get photoRefs {
    final manager = $$PhotoTableTableManager($_db, $_db.photo)
        .filter((f) => f.profileId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_photoRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PersonTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PersonTable> {
  $$PersonTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter photoRefs(
      ComposableFilter Function($$PhotoTableFilterComposer f) f) {
    final $$PhotoTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.photo,
        getReferencedColumn: (t) => t.profileId,
        builder: (joinBuilder, parentComposers) => $$PhotoTableFilterComposer(
            ComposerState(
                $state.db, $state.db.photo, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$PersonTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PersonTable> {
  $$PersonTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$PersonTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PersonTable,
    PersonData,
    $$PersonTableFilterComposer,
    $$PersonTableOrderingComposer,
    $$PersonTableCreateCompanionBuilder,
    $$PersonTableUpdateCompanionBuilder,
    (PersonData, $$PersonTableReferences),
    PersonData,
    PrefetchHooks Function({bool photoRefs})> {
  $$PersonTableTableManager(_$AppDatabase db, $PersonTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PersonTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PersonTableOrderingComposer(ComposerState(db, table)),
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
          prefetchHooksCallback: ({photoRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (photoRefs) db.photo],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (photoRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PersonTableReferences._photoRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PersonTableReferences(db, table, p0).photoRefs,
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
    $$PersonTableCreateCompanionBuilder,
    $$PersonTableUpdateCompanionBuilder,
    (PersonData, $$PersonTableReferences),
    PersonData,
    PrefetchHooks Function({bool photoRefs})>;
typedef $$PhotoTableCreateCompanionBuilder = PhotoCompanion Function({
  Value<int> id,
  required int profileId,
  required String photoPath,
});
typedef $$PhotoTableUpdateCompanionBuilder = PhotoCompanion Function({
  Value<int> id,
  Value<int> profileId,
  Value<String> photoPath,
});

final class $$PhotoTableReferences
    extends BaseReferences<_$AppDatabase, $PhotoTable, PhotoData> {
  $$PhotoTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PersonTable _profileIdTable(_$AppDatabase db) => db.person
      .createAlias($_aliasNameGenerator(db.photo.profileId, db.person.id));

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

class $$PhotoTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PhotoTable> {
  $$PhotoTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get photoPath => $state.composableBuilder(
      column: $state.table.photoPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$PersonTableFilterComposer get profileId {
    final $$PersonTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $state.db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$PersonTableFilterComposer(
            ComposerState(
                $state.db, $state.db.person, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PhotoTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PhotoTable> {
  $$PhotoTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get photoPath => $state.composableBuilder(
      column: $state.table.photoPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$PersonTableOrderingComposer get profileId {
    final $$PersonTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.profileId,
        referencedTable: $state.db.person,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PersonTableOrderingComposer(ComposerState(
                $state.db, $state.db.person, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PhotoTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PhotoTable,
    PhotoData,
    $$PhotoTableFilterComposer,
    $$PhotoTableOrderingComposer,
    $$PhotoTableCreateCompanionBuilder,
    $$PhotoTableUpdateCompanionBuilder,
    (PhotoData, $$PhotoTableReferences),
    PhotoData,
    PrefetchHooks Function({bool profileId})> {
  $$PhotoTableTableManager(_$AppDatabase db, $PhotoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PhotoTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PhotoTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> profileId = const Value.absent(),
            Value<String> photoPath = const Value.absent(),
          }) =>
              PhotoCompanion(
            id: id,
            profileId: profileId,
            photoPath: photoPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int profileId,
            required String photoPath,
          }) =>
              PhotoCompanion.insert(
            id: id,
            profileId: profileId,
            photoPath: photoPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PhotoTableReferences(db, table, e)))
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
                      dynamic>>(state) {
                if (profileId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.profileId,
                    referencedTable: $$PhotoTableReferences._profileIdTable(db),
                    referencedColumn:
                        $$PhotoTableReferences._profileIdTable(db).id,
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

typedef $$PhotoTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PhotoTable,
    PhotoData,
    $$PhotoTableFilterComposer,
    $$PhotoTableOrderingComposer,
    $$PhotoTableCreateCompanionBuilder,
    $$PhotoTableUpdateCompanionBuilder,
    (PhotoData, $$PhotoTableReferences),
    PhotoData,
    PrefetchHooks Function({bool profileId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfileTableTableManager get profile =>
      $$ProfileTableTableManager(_db, _db.profile);
  $$FriendTableTableManager get friend =>
      $$FriendTableTableManager(_db, _db.friend);
  $$PersonTableTableManager get person =>
      $$PersonTableTableManager(_db, _db.person);
  $$PhotoTableTableManager get photo =>
      $$PhotoTableTableManager(_db, _db.photo);
}
