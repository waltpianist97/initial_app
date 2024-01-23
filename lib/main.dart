import 'package:flutter/material.dart';
import 'home.dart';
import 'settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        routes: {
          '/': (context) => const HomeScreen(),
          '/settings': (context) => SettingsScreen(),
        },
      );
}
