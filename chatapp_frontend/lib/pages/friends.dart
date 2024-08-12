import 'dart:convert';

import 'package:chatapp_frontend/components/horizontallign.dart';
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
  List<String> _newFriendsList = [];
  List<String> _friendRequests = [];
  bool _isSearching = false;
  var client = http.Client();

  @override
  void initState() {
    super.initState();
    _retrieveFriends();
    _retrieveFriendRequests();
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
    ))
        .body);

    List<String> receivedFriendsList = [];
    for (final friend in response) {
      receivedFriendsList.add(friend['username']);
    }
    setState(() {
      _friendsList =
          receivedFriendsList; //['Alice', 'Bob', 'Charlie', 'David', 'Eve'];
      _filteredFriendsList = _friendsList;
    });
  }

  void _retrieveFriendRequests() async {
    // Placeholder for the function to retrieve the list of friends
    // Replace this with your implementation to fetch friends
    var retrieveURL =
        Uri.parse('http://192.168.178.96:8000/get-friendrequests/');
    final response = jsonDecode((await client.get(
      retrieveURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      }, // I think the header was called authorization?
    ))
        .body);

    List<String> receivedFriendRequests = [];
    for (final request in response) {
      receivedFriendRequests.add(request['sender']['username']);
    }
    setState(() {
      _friendRequests = receivedFriendRequests;
    });
  }

  void _searchNewFriends(String query) async {
    print("Search new friends called");
    var retrieveURL = Uri.parse(
        'http://192.168.178.96:8000/search-friends/?username=$query'); // should we use post or a querystring? Probably querstring?
    final response = jsonDecode((await client.get(
      retrieveURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      }, // I think the header was called authorization?
    ))
        .body);

    List<String> receivedFriendsList = [];
    for (final friend in response) {
      receivedFriendsList.add(friend['username']);
    }
    setState(() {
      _newFriendsList = receivedFriendsList;
    });
  }

  void _searchFriends(String query) {
    // Placeholder for the function to search friends
    // Replace this with your implementation to search friends
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _filteredFriendsList = _friendsList;
        _newFriendsList =
            []; // Set this again to empty list if hes not searching
      });
    } else {
      setState(() {
        _searchNewFriends(query);
        _isSearching = true;
        _filteredFriendsList = _friendsList
            .where(
                (friend) => friend.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void _sendFriendRequest(String username) async {
    var message = {"username": username};
    // well we now have to send an http get? request to receive the token
    var retrieveURL = Uri.parse('http://192.168.178.96:8000/send-friendrequest/');
    var response = jsonDecode((await client.post(retrieveURL,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization': 'Token $token'
            },
            body: message))
        .body) as Map<String, dynamic>;
    // now we should dependig on the response sent a friend request or not
    // TODO on the backend we should check if there is already a friend request between the two users
    setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['status'])),);
    });

  }

  void _acceptFriendRequest(String username) async {
    var retrieveURL = Uri.parse(
        'http://192.168.178.96:8000/accept-friendrequest/?username=$username'); // should we use post or a querystring? Probably querstring?
    final response = jsonDecode((await client.get(
      retrieveURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      }, // I think the header was called authorization?
    )).body);
    setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['status'])),);
        _retrieveFriends();
        _retrieveFriendRequests();    // re-innit the state because my friends can have changed
    });
  }

  void _declineFriendRequest(String username) async {
        var retrieveURL = Uri.parse(
        'http://192.168.178.96:8000/decline-friendrequest/?username=$username'); // should we use post or a querystring? Probably querstring?
    final response = jsonDecode((await client.get(
      retrieveURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      }, // I think the header was called authorization?
    )).body);
    setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['status'])),);
        _retrieveFriends();
        _retrieveFriendRequests();
    });
  }

  Future<void> _startChat(String friendName) async {
    // Placeholder for the function to start a chat
    // Replace this with your implementation to start a new chat with the friend
    var message = {"users": friendName, "groupname": ""};
    // well we now have to send an http get? request to receive the token
    var retrieveURL = Uri.parse('http://192.168.178.96:8000/create-group/');
    var groupData = jsonDecode((await client.post(retrieveURL,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization': 'Token $token'
            },
            body: message))
        .body) as Map<String, dynamic>;

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
                prefixIcon: const Icon(Icons.search),
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
                      return 
                      // ListTile(
                      //   title: Text(_filteredFriendsList[index]),
                      //   trailing: IconButton(
                      //     icon: const Icon(Icons.chat),
                      //     onPressed: () {
                      //       _startChat(_filteredFriendsList[index]);
                      //     },
                      //   ),
                      // );
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Profile Icon
                            const CircleAvatar(
                              radius: 24, // Adjust the size of the icon
                              child: Icon(Icons.person, size: 28), // Adjust the size of the icon inside the CircleAvatar
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                _filteredFriendsList[index],
                                style: const TextStyle(
                                    fontSize: 18), // Adjust the text style
                              ),
                            ),
                            // Placeholder Button
                            ElevatedButton(
                              onPressed: () {
                                  _startChat(_filteredFriendsList[index]);
                                },
                              child: Icon(Icons.chat, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor: Colors.blue, // <-- Button color
                                foregroundColor: Colors.red, // <-- Splash color
                              ),
                            ),
                          ],
                        ),);
                    },
                  ),
          ),
                    _newFriendsList.isEmpty
              ? Container()
              : const HorizontalLineWithLabel(label: "All Users"),
          Expanded(
            child: ListView.builder(
              itemCount: _newFriendsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Profile Icon
                      const CircleAvatar(
                        radius: 24, // Adjust the size of the icon
                        child: Icon(Icons.person, size: 28), // Adjust the size of the icon inside the CircleAvatar
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          _newFriendsList[index],
                          style: const TextStyle(
                              fontSize: 18), // Adjust the text style
                        ),
                      ),
                      // Placeholder Button
                      ElevatedButton(
                        onPressed: () {_sendFriendRequest(_newFriendsList[index]);},
                        child: Icon(Icons.add, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.blue, // <-- Button color
                          foregroundColor: Colors.red, // <-- Splash color
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _friendRequests.isEmpty
              ? Container()
              : const HorizontalLineWithLabel(label: "friend requests"),
          Expanded(
            child: ListView.builder(
              itemCount: _friendRequests.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Profile Icon
                      const CircleAvatar(
                        radius: 24, // Adjust the size of the icon
                        child: Icon(Icons.person, size: 28), // Adjust the size of the icon inside the CircleAvatar
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          _friendRequests[index],
                          style: const TextStyle(
                              fontSize: 18), // Adjust the text style
                        ),
                      ),
                      // Placeholder Button
                      ElevatedButton(
                        onPressed: () {_acceptFriendRequest(_friendRequests[index]);},
                        child: Icon(Icons.check, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.green, // <-- Button color
                          foregroundColor: Colors.red, // <-- Splash color
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {_declineFriendRequest(_friendRequests[index]);},
                        child: Icon(Icons.close, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.red, // <-- Button color
                          foregroundColor: Colors.orange, // <-- Splash color
                        ),
                      ),
                    ],
                  ),
                );
                // ListTile(
                //     title: Text(_friendRequests[index]),
                //     trailing: Row(
                //       children: [
                //         ElevatedButton(
                //           onPressed: () {},
                //           child: Icon(Icons.check, color: Colors.white),
                //           style: ElevatedButton.styleFrom(
                //             shape: CircleBorder(),
                //             padding: EdgeInsets.all(10),
                //             backgroundColor: Colors.green, // <-- Button color
                //             foregroundColor: Colors.red, // <-- Splash color
                //           ),
                //         ),
                //           ElevatedButton(
                //           onPressed: () {},
                //           child: Icon(Icons.close, color: Colors.white),
                //           style: ElevatedButton.styleFrom(
                //             shape: CircleBorder(),
                //             padding: EdgeInsets.all(10),
                //             backgroundColor: Colors.red, // <-- Button color
                //             foregroundColor: Colors.orange, // <-- Splash color
                //           ),
                //         ),
                //       ],
                //     ));
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
