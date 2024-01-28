import 'package:flutter/material.dart';
import "package:initial_app/widget/navigation_drawer_widget.dart";

class Squadra extends StatelessWidget {
  final String squadraName;

  const Squadra({super.key, required this.squadraName});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Squadra $squadraName'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
      );
}
