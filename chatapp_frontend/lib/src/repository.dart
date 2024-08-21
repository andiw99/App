// I think we also should have clients for the cache interaction in case we will switch out the DB

import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/src/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

abstract class RepositoryClient {

  void addProfile(Map<String, dynamic> userInfoMap);

  Future<int> deleteProfile();

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
        if ((await (database.select(database.profile)..where((t) => t.username.equals(userInfoMap['username']))).get()).isEmpty) {
          // If this gottlose query is empty, dann hauen wir das neue profil in die DB
          await database.into(database.profile).insert(ProfileCompanion.insert(
          username: (userInfoMap['username']).toString(),
          firstName: Value((userInfoMap['first_name']).toString()),
          lastName: Value(userInfoMap['last_name']),
          bio: Value(userInfoMap['bio']),
          email: userInfoMap['email'],
          phoneNumber: Value(userInfoMap['phone_number']),
          token: userInfoMap['token'])
      ); 
        } else {
          // If not we update it??
          await updateProfile(userInfoMap, userInfoMap['username']);
          // and set the token
          (await (database.update(database.profile)..where((t) => t.username.equals(userInfoMap['username']))).write(ProfileCompanion(
            token: Value(userInfoMap['token']),
          )));
        }
      }
      
      @override
      Future<String> getToken() async {
        // there should be at all times be only one profile in the DB so we dont need to pass any more stuff
        // print(await database.select(database.profile).get());
        final query = (await database.select(database.profile).get());
        if(query.isEmpty) {
          return "";
        } else {
          final profile = query[0];
          return profile.token;
      }   
      }
      
      @override
      Future<Map<String, dynamic>> getProfile() async {
        final query = (await database.select(database.profile).get());
        if(query.isEmpty) {
          return {};
        } else {
        final profile = query[0];   
        return profile.toJson();
        }

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
        
      @override
      Future<int> deleteProfile() async {
        // should be called on logout, if we log out we dont want to have any profiles in the DB
        return (await driftDatabaseInstance.delete($ProfileTable(driftDatabaseInstance)).go());
      }

}


abstract class UserMemoryRepository {
  String getUsername();    
  
  String getEmail();

  String getFirstName();

  String getLastName();

  String getPhoneNumber();

  String getToken();

  int initializeUser(String username, String email, String? firstName, String? lastName, String? phoneNumber, String token);

  int deleteUser();
}


class UserMemoryRepoImplementation extends UserMemoryRepository {
  Map<String, dynamic> userData = {"token": ""};

  // UserMemoryRepoImplementation(String? username, String? email, String? firstName, String? lastName, String? phoneNumber, String? token) {
  //   userData = {
  //     "username": username,
  //     "email": email,
  //     "firstName": firstName,
  //     "lastName": lastName,
  //     "phoneNumber": phoneNumber,
  //     "token": token,
  //   };
  // }

  @override
  String getEmail() {
    return userData['email'];
  }

  @override
  String getFirstName() {
    return userData['firstName'];
  }

  @override
  String getLastName() {
    return userData['lastName'];
  }

  @override
  String getPhoneNumber() {
    return userData['phoneNumber'];
  }

  @override
  String getToken() {
    return userData['token'];
  }

  @override
  String getUsername() {
    return userData['username'];
  }

  @override
  int initializeUser(String username, String email, String? firstName, String? lastName, String? phoneNumber, String token) {
    userData = {
      "username": username,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "token": token,
    };
    return 1;
  }
  
  @override
  int deleteUser() {
    userData = {"token": ""};
    return 1;
  }
  
}