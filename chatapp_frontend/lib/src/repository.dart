// I think we also should have clients for the cache interaction in case we will switch out the DB

import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/src/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

abstract class RepositoryClient {

  void addProfile(Map<String, dynamic> userInfoMap);

  Future<String> getToken();

  Future<Map<String, dynamic>> getProfile();   // should probably actually be a map or something
  
  Future<int> updateProfile(Map<String, dynamic> userInfo, String username);
}

class DriftRepositoryClient extends RepositoryClient {
    final database = driftDatabaseInstance;
    
      @override
      Future<void> addProfile(Map<String, dynamic> userInfoMap) async {
        // This method depends on return value of the Api client and has to have certain keys, which is not ideal but probably okayish 
        print("\n\n\nAdd profile method called");
        for(final entry in userInfoMap.entries) {
          print("${entry.key} : ${entry.value}");
        }

        print(await database.into(database.profile).insert(ProfileCompanion.insert(
          username: (userInfoMap['username']).toString(),
          firstName: Value((userInfoMap['first_name']).toString()),
          lastName: Value(userInfoMap['last_name']),
          bio: Value(userInfoMap['bio']),
          email: userInfoMap['email'],
          phoneNumber: Value(userInfoMap['phone_number']),
          token: userInfoMap['token'])
      )); 
      (await driftDatabaseInstance.select(driftDatabaseInstance.profile).get()).forEach(print);
      print("\n\n\n");
      }
      
      @override
      Future<String> getToken() async {
        // there should be at all times be only one profile in the DB so we dont need to pass any more stuff
        // print(await database.select(database.profile).get());
        var profile = (await database.select(database.profile).get())[0];   
        return profile.token;
      }
      
      @override
      Future<Map<String, dynamic>> getProfile() async {
        // TODO: implement getProfile
        var profile = (await database.select(database.profile).get())[0];   

        return profile.toJson();
      }
      
        @override
        Future<int> updateProfile(Map<String, dynamic> userInfo, String username) async {
          return (await (database.update(database.profile)..where((t) => t.username.equals(username))).write(ProfileCompanion(
            firstName: Value(userInfo['first_name']),
            lastName: Value(userInfo['last_name']),
            email: Value(userInfo['email']),
            phoneNumber: Value(userInfo['phone_number'])
          )));
        }

}