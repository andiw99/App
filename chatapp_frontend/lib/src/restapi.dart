// ignore_for_file: public_member_api_docs, sort_constructors_first
// I think it is finally time to use an adapter for the api...

import 'dart:convert';
import 'dart:io';

import 'package:chatapp_frontend/src/constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';



abstract class Api {
  // abstract class ?
  static const baseUrl = baseURL;

  Future<Map<String, dynamic>> apiTokenAuth(String username, String password);

  Future<Map<String, dynamic>> getProfileInfo(String token);
  
  Future<Map<String, dynamic>> changeProfileInfo(String token, Map<String, dynamic> formData);

  Future<int> upload(String token, XFile imageFile);
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

  Future<int> upload(String token, XFile imageFile) async {    
    var stream = http.ByteStream(imageFile.openRead());
    stream.cast();
    var length = await imageFile.length();
    var uri = Uri.parse("$baseURL/$uploadImageUrl/");

    var request = http.MultipartRequest("POST", uri,);
    var multipartFile = http.MultipartFile('image', stream, length,
          filename: basename(imageFile.path));          
          //contentType: new MediaType('image', 'png'));
    Map<String, String> headers = { 'Authorization': 'Token $token'};
    request.headers.addAll(headers);
    request.files.add(multipartFile);
    var response = await request.send();
    print(response);
    return response.statusCode;
  }
}
