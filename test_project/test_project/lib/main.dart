import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/single': (context) => SingleScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/multi') {
          return MaterialPageRoute(
            builder: (context) => MultiScreenWrapper(),
          );
        }
        return null;
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go to Single Screen'),
              onPressed: () => Navigator.pushNamed(context, '/single'),
            ),
            ElevatedButton(
              child: Text('Go to Multi-Screen Route'),
              onPressed: () => Navigator.pushNamed(context, '/multi'),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single Screen')),
      body: Center(child: Text('This is a single screen route')),
    );
  }
}

class MultiScreenWrapper extends StatefulWidget {
  @override
  _MultiScreenWrapperState createState() => _MultiScreenWrapperState();
}

class _MultiScreenWrapperState extends State<MultiScreenWrapper> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    MultiScreenOne(),
    MultiScreenTwo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi-Screen Route')),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'Screen One'),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Screen Two'),
        ],
      ),
    );
  }
}

class MultiScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('This is Multi-Screen One'));
  }
}

class MultiScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('This is Multi-Screen Two'));
  }
}