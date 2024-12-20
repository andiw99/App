// ignore_for_file: public_member_api_docs, sort_constructors_first
// I think it is finally time to use an adapter for the api...

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:chatapp_frontend/src/constants.dart';
import 'package:chatapp_frontend/src/functions.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


abstract class Api {
  // abstract class ?
  static const baseUrl = baseURL;

  Future<Map<String, dynamic>> apiTokenAuth(String username, String password);

  Future<Map<String, dynamic>> getProfileInfo(String token);
  
  Future<Map<String, dynamic>> changeProfileInfo(String token, Map<String, dynamic> formData);

  Future<int> upload(String token, XFile imageFile);

  Future<List<String>> getGalleryPictures(String token);

  Future<Map<String, dynamic>> downloadPicture(String token, String filename, {String downloadUrl=downloadImageUrl});

  Future<int> deletePicture(String token, String filename);
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

  @override
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

  @override
  Future<List<String>> getGalleryPictures(String token) async {
    List<String> pictures = [];
    var retrieveURL = Uri.parse('$baseURL/$getImagesUrl/');
    var userImagesInfo = jsonDecode((await client.get(retrieveURL,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Token $token'
        },))
    .body) as List<dynamic>;
    for(var image in userImagesInfo) {      
      pictures.add(image['image']);
    }
    return pictures;
  }
  
  @override
  Future<Map<String, dynamic>> downloadPicture(String token, String filename, {String downloadUrl=downloadImageUrl}) async {
    // I think we need to do some refactoring here, the image should not be saved by the
    // rest client. Sadly we cannot pass the File by reference seems like it
    Map<String, dynamic> res = {
      'status': 0,
      'FileBytes': Null
      };
    try{
      var retrieveURL = Uri.parse('$baseURL/$downloadUrl/?name=$filename');
      final response = (await client.get(retrieveURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',  // TODO do I need this line?
          'Authorization': 'Token $token'
          },
      ));
      if (response.statusCode == 200) {
          // Parse the response
          // TODO I don't know if it is good design that the picture is written to disk here instead 
          // of somewhere else in maybe a totally different client like a 'storage client'
          final Map<String, dynamic> data = json.decode(response.body);
          // Decode base64 image
          final String base64Image = data['image_data'];          
          // Convert base64 to bytes
          final Uint8List imageBytes = base64.decode(base64Image);
    
          Directory assetDirectory = await getAssetDirectory();
          // final File imageFile = File('${assetDirectory.path}$filename'); 
          
          // Save the image (will be postponed now)
          // await imageFile.writeAsBytes(imageBytes);
          res['FileBytes'] = imageBytes;
          print('Image loaded');
          res['status'] = 1;
          //return 1;
        } else {
          print('Failed to load image');
          res['status'] = response.statusCode;
          // return response.statusCode;          
        };
      return res;
    } catch (e) {
      print(e);
      // return res;
    } 
    return res;
  }
  
  @override
  Future<int> deletePicture(String token, String filename) async {
    // First we need an endpoint at the django backend
    try{
      var retrieveURL = Uri.parse('$baseURL/$deleteImageUrl/?name=$filename');
      final response = (await client.get(retrieveURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',  // TODO do I need this line?
          'Authorization': 'Token $token'
          },
      ));
      if (response.statusCode == 200) {
          // TODO should I delete the image here?
          try {
            Directory assetDirectory = await getAssetDirectory();
            final File imageFile = File('${assetDirectory.path}$filename');
            if (await imageFile.exists()) {
              await imageFile.delete();
              print('Image deleted successfully.');
            } else {
              print('Image not found.');
            }
          } catch (e) {
            print('Error deleting image: $e');
          }

          return 1;
        } else {
          final Map<String, dynamic> msg = json.decode(response.body);
          print(msg['error']);
          return response.statusCode;          
        };
    } catch (e) {
      print(e);
      return 0;
  }
  }
}

