import 'package:flutter/material.dart';
import "package:initial_app/widget/navigation_drawer_widget.dart";
import "package:initial_app/widget/navigation_bottom_bar_widget.dart";

class PeoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('People'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: NavigationBottomBarWidget(),
      );
}
