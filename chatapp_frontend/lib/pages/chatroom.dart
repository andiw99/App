import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text(
          'Chatroom',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ChatForm(),
      /* Center(
        child: ElevatedButton(
          onPressed: () {
            print("This button will on press do some logic that sends a text message");
          },
          child: const Text('Send'),
        ),
      ), */
    );
  }
}

class ChatForm extends StatefulWidget {
  const ChatForm({super.key});

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
  // If i build the widget here, should I connect to the websocket here?
  final _channel = WebSocketChannel.connect(Uri.parse(
      'ws://192.168.178.96:8000/ws/socket-server/')); // This is the adress of the chat endpoint of Django (obviously only locally at the moment)
  // print(_channel);
  // Okay I think this guy is just used in the _sendMessage method to get and format the data of the form
  final TextEditingController _controller = TextEditingController();
  // To retrieve bunches of messages I think it will be better to send one http request instead of doing this over websocket
  var client = http.Client();

  // Hmm it seems like everything is happening in the state of the statefulwidge?
  // scrollcontroller will be used to detect if the user scrolled to the end of the chat to load new messages
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  ChatFormState() {
    // This is a constructor so that i make sure that _channel is initialized before I am going to use it.
    // TODO I think I cant use _channel?  Everytime i get the error 'each child must be laid out exactly once'
    // which makes absolutely no sense for me If i just initialize something in the constructor
    // TODO is it even sensible to retrieve the initial chat messages via websocket? Or should I just do an asynchronous HTTP request?
    StreamSubscription sub = WebSocketChannel.connect(
            Uri.parse('ws://192.168.178.96:8000/ws/socket-server/'))
        .stream
        .listen((value) {
      // This catches every message now
      // if (value.hasData) in contrast to inside the streambuilder, this is just a string
      final jsonMessage = jsonDecode(value) as Map<String, dynamic>;
      if (jsonMessage['type'] == 'chat') {
        setState(() {
          messages.add(Tuple2(jsonMessage['author'], jsonMessage['message']));
        });
      }
    });

    // Here we will specify what the scrollcontroller will do
    _scrollController.addListener(
        _onScroll); // the listener listens to every change (kind of inefficient or the only way?) And then triggers the _onscroll function
  }

  @override
  Widget build(BuildContext context) {
    // Streambuilder misses some messages if they are sent concurrent, this is not good so I need to somehow manually listen to the incoming messages

    return Scaffold(
      body: Column(
        children: <Widget>[
/*           TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ), */
/*             StreamBuilder(
            // This will later be displaying incoming messages (I think?)
            stream: _channel.stream,
            builder: (context, snapshot) {
              // okay could i build something here that displays the messages nice? Like another widget? makes this sense to construct another widget all the time it receives a message?
              /* print(snapshot);
              print(snapshot.hasData);
              print(snapshot.data);
              print(snapshot.data.runtimeType); */
              // since the listening is now done by the _sub, we dont need
/*               if (snapshot.hasData) {
                final jsonMessage = jsonDecode(snapshot.data) as Map<String,
                    dynamic>; // I again dont really get the meaning of final, it means it can be empty at first but as soon as it is set it cannot be changed? but the second time I run this build method it will be overwritten anyway?
                messages.add(Tuple2(
                    jsonMessage['author'],
                    jsonMessage[
                        'message'])); // We add a tuple of author and message?
              } */
              print("messages.length = ${messages.length}");
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 40,
                      child: Center(
                          child: Text(
                              '${messages[index].item1}: ${messages[index].item2}')),
                    );
                  });
            },
          ), */

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
                        child: buildChatBubble(
                            context,
                            messages[messages.length - index - 1].item1,
                            messages[messages.length - index - 1]
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
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
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

  double _bubbleHeight() {
    // logic for the size of the chatbubble, somehow we need to know if the message will be in two lines
    return 50;
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _channel.ready;
      var controllertext = _controller.text;
      var jsonMessage =
          jsonEncode({'author': 'flutter', 'message': controllertext});
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
    var retrieveURL = Uri.parse('http://192.168.178.96:8000/getChatMessages/?em=${messages.length}');
    List response = jsonDecode((await client.get(
      retrieveURL)).body);      // TODO in a get request you can send headers, you probably need to handle the authorization with this
    await Future.delayed(Duration(milliseconds: 700));  // TODO remove just makes the feeling a little bit more real
    setState(() {
      for (final msg in response) {
        Tuple2<String, String> tup = Tuple2(msg['author']['username'], msg['message']);
        messages.insert(0, tup);
      }
      _isLoading = false;
    });
  }
}

Widget buildChatMateBubble(
    BuildContext context, String author, String msg, Color color) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
              text: '$author\n',
              style: TextStyle(fontSize: 15, color: Colors.white)),
          TextSpan(text: msg, style: TextStyle(fontSize: 15))
        ]),
      ),
    ),
  );
}

Widget buildOwnChatBubble(
    BuildContext context, String author, String msg, Color color) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
              text: '$author\n',
              style: TextStyle(fontSize: 15, color: Colors.white)),
          TextSpan(text: msg, style: TextStyle(fontSize: 15))
        ]),
      ),
    ),
  );
}

Widget buildChatBubble(BuildContext context, String author, String msg) {
  // TODO logic when logged in which chat bubble to return
  if (author == "flutter") {
    const col = Color.fromARGB(255, 133, 206, 110);
    return buildOwnChatBubble(context, author, msg, col);
  } else {
    const col = const Color.fromARGB(255, 94, 182, 255);
    return buildChatMateBubble(context, author, msg, col);
  }
}