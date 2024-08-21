import 'dart:async';
import 'package:chatapp_frontend/components/chatbubble.dart';
import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/pages/loginpage.dart';
import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatelessWidget {
  final String roomIdentifier;
  final String roomName;
  const ChatPage({super.key, required this.roomIdentifier, this.roomName="Chatroom"});

  @override
  Widget build(BuildContext context) {
    print("Building ChatPage, roomIdentifier = $roomIdentifier");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title:  Text(
          roomName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ChatForm(
          roomIdentifier:
              roomIdentifier), // TODO one would probably divide the chat-log and the chat-form in two seperate Statfulwidgets, it is currently one
    );
  }
}

class ChatForm extends StatefulWidget {
  final String roomIdentifier;
  const ChatForm({super.key, required this.roomIdentifier});

  @override
  ChatFormState createState() {
    return ChatFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ChatFormState extends State<ChatForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  List<Tuple2<String, String>> messages = []; // messages as empty list
  final _formKey = GlobalKey<FormState>();

  // Build a Form widget using the _formKey created above.
  // Okay I think this guy is just used in the _sendMessage method to get and format the data of the form
  final TextEditingController _controller = TextEditingController();
  // To retrieve bunches of messages I think it will be better to send one http request instead of doing this over websocket
  var client = http.Client();

  // Hmm it seems like everything is happening in the state of the statefulwidge?
  // scrollcontroller will be used to detect if the user scrolled to the end of the chat to load new messages
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  late WebSocketChannel _channel;

  @override
  void initState() {
    super.initState();
    // Streambuilder misses some messages if they are sent concurrent, this is not good so I need to somehow manually listen to the incoming messages
// If i build the widget here, should I connect to the websocket here?
    // URL
    // uri = '$wsURL/ws/socket-server/';
    final uri =
        '$wsURL/ws/socket-server/?chatroom=${widget.roomIdentifier}';
    print(
        "Connecting with querystring and roomidentifier ${widget.roomIdentifier}");
    _channel = WebSocketChannel.connect(Uri.parse(uri), protocols: [
      "connectProtocol",
      "Token $token"
    ]); // connectProtocol should actually the subprotocol that client and server can agree on. I dont think it has relevance here
    // This is a constructor so that i make sure that _channel is initialized before I am going to use it.
    // TODO I think I cant use _channel?  Everytime i get the error 'each child must be laid out exactly once'
    // which makes absolutely no sense for me If i just initialize something in the constructor
    // TODO is it even sensible to retrieve the initial chat messages via websocket? Or should I just do an asynchronous HTTP request?
    StreamSubscription subb = _channel.stream.listen((value) {
      // This catches every message now
      // if (value.hasData) in contrast to inside the streambuilder, this is just a string
      final jsonMessage = jsonDecode(value) as Map<String, dynamic>;
      if (jsonMessage['type'] == 'chat') {
        setState(() {
          messages.add(Tuple2(jsonMessage['author'], jsonMessage['message']));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
/*     StreamSubscription sub = WebSocketChannel.connect(
            Uri.parse('$wsURL/ws/socket-server/')).stream.listen((value) {
      // This catches every message now
      // if (value.hasData) in contrast to inside the streambuilder, this is just a string
      final jsonMessage = jsonDecode(value) as Map<String, dynamic>;
      if (jsonMessage['type'] == 'chat') {
        setState(() {
          messages.add(Tuple2(jsonMessage['author'], jsonMessage['message']));
        });
      }
    }); */

    // Here we will specify what the scrollcontroller will do
    _scrollController.addListener(
        _onScroll); // the listener listens to every change (kind of inefficient or the only way?) And then triggers the _onscroll function
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: messages.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == messages.length) {
                      var height = 0.0;
                      if (_isLoading) {
                        height = 50.0;
                      }
                      return Container(height: height);
                    } else {
                      return Container(
                        //height: _bubbleHeight(),
                        // padding: const EdgeInsets.all(0.0),
                        margin: const EdgeInsets.only(left: 10.0, right: 25.0),
                        child: Chatbubble(
                            author: messages[messages.length - index - 1].item1,
                            msg: messages[messages.length - index - 1]
                                .item2), // Text(
                        // '${messages[messages.length - index - 1].item1}: ${messages[messages.length - index - 1].item2}'),
                      );
                    }
                  },
                ),
                if (_isLoading)
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
          //const SizedBox(height: 4),
          Container(
            //margin: const EdgeInsets.symmetric(horizontal: 2.0),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Message', border: InputBorder.none),
                        controller: _controller,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: IconButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /*                 ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    ); */
                        _sendMessage();
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _channel.ready;
      var controllertext = _controller.text;
      var jsonMessage =
          jsonEncode({'author': username, 'message': controllertext});
      _channel.sink.add(jsonMessage); // this should directly send the message?
      print("_sendMessage method called");

      print("controller.text: $controllertext");
      _controller.clear();
    }
  }

  void _onScroll() {
    // TODO really the most efficient way to check this statement all the time?
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreMessages();
    }
  }

  void _loadMoreMessages() async {
    // This function is asynchronous because we dont know when the server will respond?
    if (_isLoading)
      return; // we dont need to send two requests if we are already waiting for the server

    setState(() {
      _isLoading = true;
    });

    // TODO in the future, this URL somehow needs to be build from the chatroom we are currently in
    var retrieveURL = Uri.parse(
        '$baseURL/getChatMessages/?em=${messages.length}&cr=${widget.roomIdentifier}');
    List response = jsonDecode((await client.get(
      retrieveURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      },
    ))
        .body); // TODO in a get request you can send headers, you probably need to handle the authorization with this
    await Future.delayed(const Duration(
        milliseconds:
            700)); // TODO remove just makes the feeling a little bit more real
    setState(() {
      for (final msg in response) {
        print(msg['author']['username'] +  msg['message']);
        Tuple2<String, String> tup =
            Tuple2(msg['author']['username'], msg['message']);
        messages.insert(0, tup);
      }
      _isLoading = false;
    });
  }
}
