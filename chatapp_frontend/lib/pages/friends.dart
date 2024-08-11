import 'dart:convert';

import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/pages/chatroom.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _friendsList = [];
  List<String> _filteredFriendsList = [];
  bool _isSearching = false;
  var client = http.Client();

  @override
  void initState() {
    super.initState();
    _retrieveFriends();
  }
 

  void _retrieveFriends() async {
    // Placeholder for the function to retrieve the list of friends
    // Replace this with your implementation to fetch friends
    var retrieveURL = Uri.parse('http://192.168.178.96:8000/get-friends/');
    final response = jsonDecode((await client.get(
            retrieveURL,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Token $token'
            }, // I think the header was called authorization?
            )).body);
    print(response);
    List<String> receivedFriendsList = [];
    for (final friend in response) {
      receivedFriendsList.add(friend['username']);
    }
    setState(() {        
        _friendsList = receivedFriendsList; //['Alice', 'Bob', 'Charlie', 'David', 'Eve'];
       _filteredFriendsList = _friendsList;
    });

    
  }

  void _searchFriends(String query) {
    // Placeholder for the function to search friends
    // Replace this with your implementation to search friends
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _filteredFriendsList = _friendsList;
      });
    } else {
      setState(() {
        _isSearching = true;
        _filteredFriendsList = _friendsList
            .where((friend) =>
                friend.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  Future<void> _startChat(String friendName) async {
    // Placeholder for the function to start a chat
    // Replace this with your implementation to start a new chat with the friend
    print('Starting chat with $friendName');
      var jsonMessage = {"users": friendName, "groupname": ""};
      print(jsonMessage);      
      // well we now have to send an http get? request to receive the token
      var retrieveURL = Uri.parse('http://192.168.178.96:8000/create-group/');
      var groupData = jsonDecode((await client.post(
        retrieveURL,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Token $token'}, 
        body: jsonMessage        
      )).body) as Map<String, dynamic>;

      print(groupData);

      final identifier = groupData['id'];
        Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChatPage(
                roomIdentifier: identifier.toString(),
              )),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Friends',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) {
                _searchFriends(query);
              },
            ),
          ),
          Expanded(
            child: _isSearching && _filteredFriendsList.isEmpty
                ? Center(child: Text('No friends found.'))
                : ListView.builder(
                    itemCount: _filteredFriendsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredFriendsList[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () {
                            _startChat(_filteredFriendsList[index]);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}