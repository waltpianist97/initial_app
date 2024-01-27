import 'package:flutter/material.dart';
import 'settings.dart';
import 'drawer.dart';
import "profilo.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final Map<String, Widget> drawerItems = {
    'Home': HomeScreenContent(),
    'Profilo': ProfilePage(),
    // Add more items as needed
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My TeamUp Account'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                // Implement your logout logic here
                // For example, you can show a dialog or navigate to the login screen
              },
            ),
          ],
        ),
        drawer: AppDrawer(
          navigatorKey: _navigatorKey,
          drawerItems: drawerItems,
        ),
        body: Center(
          child: _buildBody(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: myIndex,
          onTap: (int index) {
            setState(() {
              myIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (myIndex) {
      case 0:
        return HomeScreenContent();
      case 1:
        return SettingsScreen();
      default:
        return Container(); // Handle other indices if needed
    }
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Home Screen!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
