// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:chatapp_frontend/src/database.dart';
import 'package:test/test.dart';
import 'generated/schema.dart';

import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    final versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // Simple tests ensure the schema is transformed correctly, but some
  // migrations benefit from a test verifying that data is transformed correctly
  // too. This is particularly true for migrations that change existing columns
  // (e.g. altering their type or constraints). Migrations that only add tables
  // or columns typically don't need these advanced tests.
  // TODO: Check whether you have migrations that could benefit from these tests
  // and adapt this example to your database if necessary:
  test("migration from v1 to v2 does not corrupt data", () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    final oldPersonData = <v1.PersonData>[];
    final expectedNewPersonData = <v2.PersonData>[];

    final oldProfileData = <v1.ProfileData>[];
    final expectedNewProfileData = <v2.ProfileData>[];

    final oldFriendData = <v1.FriendData>[];
    final expectedNewFriendData = <v2.FriendData>[];

    final oldPictureData = <v1.PictureData>[];
    final expectedNewPictureData = <v2.PictureData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.person, oldPersonData);
        batch.insertAll(oldDb.profile, oldProfileData);
        batch.insertAll(oldDb.friend, oldFriendData);
        batch.insertAll(oldDb.picture, oldPictureData);
      },
      validateItems: (newDb) async {
        expect(expectedNewPersonData, await newDb.select(newDb.person).get());
        expect(expectedNewProfileData, await newDb.select(newDb.profile).get());
        expect(expectedNewFriendData, await newDb.select(newDb.friend).get());
        expect(expectedNewPictureData, await newDb.select(newDb.picture).get());
      },
    );
  });
}
