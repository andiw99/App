// ignore_for_file: public_member_api_docs, sort_constructors_first
// I think it is finally time to use an adapter for the api...

import 'dart:convert';

import 'package:chatapp_frontend/src/constants.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  // abstract class ?
  static const baseUrl = baseURL;

  Future<Map<String, dynamic>> apiTokenAuth(String username, String password);

  Future<Map<String, dynamic>> getProfileInfo(String token);
  
  Future<Map<String, dynamic>> changeProfileInfo(String token, Map<String, dynamic> formData);

}

class DjangoRestApi extends Api {
  final client = http.Client();

  @override
  Future<Map<String, dynamic>> apiTokenAuth(
      String username, String password) async {
    var retrieveURL = Uri.parse('$baseURL/$tokenAuthURL/');

    var jsonMessage = jsonEncode({'username': username, 'password': password});
    var tokenMap = jsonDecode((await client.post(retrieveURL,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonMessage))
        .body) as Map<String, dynamic>;

    return tokenMap; // But this is no future, right?
  }
  
  @override
  Future<Map<String, dynamic>> getProfileInfo(String token) async {
    // Get request to get-user-info
    // Do I want to hand over the token, or do I want to get it from the DB?
    var retrieveURL = Uri.parse('$baseURL/$getUserInfoUrl/');

    var infoMap = jsonDecode((await client.get(retrieveURL,
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
        },))
    .body) as Map<String, dynamic>;
    print("\n\nToken Map:");
    print(infoMap);
    return infoMap;
  }
  
  @override
  Future<Map<String, dynamic>> changeProfileInfo(String token, Map<String, dynamic> formData) async {
    var retrieveURL = Uri.parse('$baseURL/$changeUserInfoUrl/');
  print("Vor senden");
  print(formData);
    var userInfoMap = jsonDecode((await client.post(retrieveURL,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization': 'Token $token'
            },
            body: formData))
        .body) as Map<String, dynamic>;

    return userInfoMap;
  }


}
