import 'package:flutter/material.dart';
import "package:initial_app/widget/navigation_drawer_widget.dart";

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('People'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
      );
}
