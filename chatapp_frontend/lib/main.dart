// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Best App Ever'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title + " (I mean it)"),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                //
                // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
                // action in the IDE, or press "p" in the console), to see the
                // wireframe for each widget.
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text('Where is this text?')
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: ElevatedButton(
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.chat_bubble),
                      Text('Chatroom'),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatroom'),
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
  List<String> messages = [
  ]; // messages as empty list
  final _formKey = GlobalKey<FormState>();

  // Build a Form widget using the _formKey created above.
  // If i build the widget here, should I connect to the websocket here?
  final _channel = WebSocketChannel.connect(Uri.parse(
      'ws://192.168.178.96:8000/ws/socket-server/')); // This is the adress of the chat endpoint of Django (obviously only locally at the moment)
  // print(_channel);
  // Okay I think this guy is just used in the _sendMessage method to get and format the data of the form
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          Form(
            key: _formKey,
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Send a message'),
              controller: _controller,
            ),
          ),
          const SizedBox(height: 24),
          StreamBuilder( 
            // This will later be displaying incoming messages (I think?)
            stream: _channel.stream,
            builder: (context, snapshot) {
              // okay could i build something here that displays the messages nice? Like another widget? makes this sense to construct another widget all the time it receives a message?
              print(snapshot);
              print(snapshot.hasData);
              print(snapshot.data);
              print(snapshot.data.runtimeType);
              if(snapshot.hasData) {
                final jsonMessage = jsonDecode(snapshot.data) as Map<String, dynamic>; // I again dont really get the meaning of final, it means it can be empty at first but as soon as it is set it cannot be changed? but the second time I run this build method it will be overwritten anyway?
                messages.add(jsonMessage['message']);
              }
              print("messages.length = ${messages.length}");
              //return Text("wtf");
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 40,
                      child: Center(child: Text('${messages[index]}')),
                    );
                  });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                _sendMessage();
              }
            },
            child: const Text('Send on god'),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _channel.ready;
      var controllertext = _controller.text;
      var jsonMessage = jsonEncode(
        {
          'origin' : 'flutter',
          'message' : controllertext
        }
      );
      _channel.sink.add(jsonMessage); // this should directly send the message?
      print("_sendMessage method called");

      print("controller.text: $controllertext");
    }
  }
}

class chatMessages extends StatefulWidget {
  const chatMessages({super.key});

  @override
  State<chatMessages> createState() => _chatMessagesState();
}

class _chatMessagesState extends State<chatMessages> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
