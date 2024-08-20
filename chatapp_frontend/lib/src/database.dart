import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class Person extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 2, max: 128)();                    // This is not nullable because I need to have at least know the username of my friend
  // TextColumn get bio => text().withLength(max: 1028)();

}

class Profile extends Person {
  TextColumn get firstName => text().nullable().withLength(max: 128).withDefault(const Constant(""))();
  TextColumn get lastName => text().nullable().withLength(max: 128).withDefault(const Constant(""))();

  TextColumn get bio => text().nullable().withLength(max: 1028).withDefault(const Constant(""))();
  TextColumn get email => text().withLength(max: 128)();

  TextColumn get phoneNumber => text().nullable().withDefault(const Constant(""))();   // should this be an integercolumn?

  TextColumn get token => text().withLength(min: 40, max: 40)();     // Is it safe to store token here? 7b91 049d 79e3 a334 a780 8401 ea23 08cb 942a dfba has 40 characters
}

class Friend extends Person {
  IntColumn get profileId => integer().customConstraint('REFERENCES profile(id) NOT NULL')();   // Foreignkey basically
  // Username is inherited from Person is not nullable because I need to have at least know the username of my friend
  TextColumn get firstName => text().nullable().withLength(max: 128).withDefault(const Constant(""))();       // nullable means it can be empty I hope, I dont have to know the actual names of my friends
  TextColumn get lastName => text().nullable().withLength(max: 128).withDefault(const Constant(""))();

  TextColumn get bio => text().nullable().withLength(max: 1024).withDefault(const Constant(""))();

}

class Photo extends Table {
  IntColumn get id => integer().autoIncrement()();
  // I think for every photo we should have a DB entry that points to the photo location and is referenced to a friend or profile
  IntColumn get profileId => integer().customConstraint('REFERENCES person(id) NOT NULL')();   // Foreignkey basically
  TextColumn get photoPath => text()();     // obviously not nullable, if the photo exists it should have a path

}

@DriftDatabase(tables: [Person, Profile, Friend, Photo])
class AppDatabase extends _$AppDatabase {
AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: "new_database");
  }
}