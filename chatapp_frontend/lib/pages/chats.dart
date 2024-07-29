import 'dart:async';
import 'dart:core';
import 'package:chatapp_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chatapp_frontend/pages/loginpage.dart';
import 'package:chatapp_frontend/components/chatslistentry.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  // To render out the  number of chats we need to know what chats we already have
  // should be saved locally but has to be synced with the server anyway
  // Will be done over http request
  var client = http.Client();

  List<dynamic> chats = []; // TODO dynamic?
  Map<String, dynamic> chatsMap = {};
  List<MapEntry<String, dynamic>> chatsEntries = [];

  _ChatsPageState() {
    _loadChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: chatsMap.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Chatslistentry(
                      identifier: chatsEntries[index].key,
                      name: chatsEntries[index].value,
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }

  void _loadChats() async {
    // The retrieve url will have to be implemented in the backend
    var retrieveURL = Uri.parse('http://192.168.178.96:8000/get-chats/');
    print("Whats happening?");
    // What should be the datastructure that we use to receive the chats
    // A map with Identifier and display name?
    // The request that we send will be a get? request to a specific URL with our token as header
    final response = await client.get(
              retrieveURL,
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Token $token'
              }, // I think the header was called authorization?
              );
    print("Statuscode = ${response.statusCode}");
    List chatsListServer = [];
    if(response.statusCode == 401) {
      // unauthorized response
        chatsListServer = [{"id": "1", "name" : "Not logged in"}];
    } else {
        chatsListServer = jsonDecode(response.body);

        for(final entry in chatsListServer) {
          print(entry);
        }
    }
        // TODO chatsMapServer should be varified against the local version
    setState(() {
      //chatsMap = chatsMapServer;
      print("Setting state");
      print(chatsListServer);
      for (final entry in chatsListServer) {
          print(entry["id"]);
          print(entry["name"]);

          chatsMap[entry["id"].toString()] = entry["name"].toString();
      }
      chatsEntries = chatsMap.entries.toList();
    });    
  }
}
