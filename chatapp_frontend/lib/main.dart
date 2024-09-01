// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:chatapp_frontend/pages/loginpage.dart';
import 'package:chatapp_frontend/pages/profile.dart';
import 'package:chatapp_frontend/src/database.dart';
import 'package:chatapp_frontend/src/repository.dart';
import 'package:chatapp_frontend/src/restapi.dart';
import 'package:chatapp_frontend/src/routes.dart';
import 'package:chatapp_frontend/src/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;
import 'pages/chatroom.dart';
import 'pages/chats.dart';
import 'pages/friends.dart';

// String token = "";      // TODO this is placeholder for now for a token that is somewhere stored persistently
// String username = "";
AppDatabase driftDatabaseInstance = AppDatabase();
RepositoryClient repositoryClient = DriftRepositoryClient();
Api restClient = DjangoRestApi();
UserMemoryRepository userMemoryClient = UserMemoryRepoImplementation();
// String baseURL = "baseURL";

void main() {
  //driftDatabase = AppDatabase();
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp(
  ));
  // print("\n\n\n");
  // print(await getApplicationDocumentsDirectory());
  // print("\n\n\n");
  // driftDatabaseInstance = AppDatabase();
  // await driftDatabaseInstance.into(driftDatabaseInstance.profile).insert(ProfileCompanion.insert(username: "Andi", email: "andy.weitzel99@gmail.com", token: "33d060dc7d59e37fad2f0a874d6e6b2ab46554df"));
  // (await driftDatabaseInstance.select(driftDatabaseInstance.profile).get()).forEach(print);
  // // final profileInst = await driftDatabaseInstance.select(driftDatabaseInstance.profile)..where((t) => t.username.equals("Andi"));
  // // await driftDatabaseInstance.delete($ProfileTable(driftDatabaseInstance)).go();
  // (driftDatabaseInstance.delete(driftDatabaseInstance.profile)..where((t) => t.username.equals("Andi"))).go();
  // (await driftDatabaseInstance.select(driftDatabaseInstance.profile).get()).forEach(print);
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
      theme: MyAppTheme.lightTheme,
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Best App Ever'),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const MyHomePage(title: "Homepage via onGenerateRoute"));
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());
        }
      },
      routes: {
        // '/': (context) => const MyHomePage(title: "Homepage per route"),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MyHomePage(title: "Homepage via route",),

      }
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
  // TODO is this the most efficient way to navigate?

  @override
  void initState() {    
    super.initState();
    initUser();
  }

  void initUser() async {
    final profile = await repositoryClient.getProfile();
    if (profile.isNotEmpty) {
      // This means there is already a User in DB and we can initialize the memory DB
      setState(() {
        userMemoryClient.initializeUser(profile['username'], profile['email'], profile['firstName'], profile['lastName'], profile['phoneNumber'], profile['token']);
        _pages[_pages.length - 1] = userMemoryClient.getToken().isEmpty ? LoginPage() : const ProfileScreen();
      });
    }
  }

  final List<Widget> _pages = [
    const MyHomePage(title: "Best App ever, rerouted"),
    const ChatsPage(),
    const FriendsPage(),
    userMemoryClient.getToken().isEmpty ? LoginPage() : const ProfileScreen(),    // TODO somehow this doesnt work when I log out and log back in again
  ];
  // TODO At the moment this does not even need to be a stateful widget
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title + " (I mean it)"),
      ),      
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
            Navigator.push(
                      context,
                      RebuildPageRoute(_updateState, builder: (context) => _pages[index]),    // TODO okay this works now, but I somehow think this made the app Significantly slower? What this does is, it rebuilds the underlying homepage 
                    ).then((_) => setState(() { 
                      _pages[_pages.length - 1] = userMemoryClient.getToken().isEmpty ? const LoginPage() : const ProfileScreen();
                    }));
        },
         destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.messenger_sharp),
            label: 'Chats',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.group),
            label: 'Friends',
          ),
          NavigationDestination(
            icon: userMemoryClient.getToken().isEmpty ? const Icon(Icons.lock) : const Icon(Icons.person),
            label: userMemoryClient.getToken().isEmpty ? 'Login' : "Profile",
          ),
        ],
      ),
      body: Center(
         child: Image.asset('assets/images/App-Icon-transparent.png'),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _updateState() {
    setState(() { 
                      _pages[_pages.length - 1] = userMemoryClient.getToken().isEmpty ? const LoginPage() : const ProfileScreen();                     
                    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Any logic to rebuild the screen can be placed here
    setState(() { 
                      _pages[_pages.length - 1] = userMemoryClient.getToken().isEmpty ? const LoginPage() : const ProfileScreen();                     
                    });
  }
}