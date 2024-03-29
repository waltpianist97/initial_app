import 'package:flutter/material.dart';
import "package:initial_app/widget/navigation_drawer_widget.dart";
import "package:initial_app/widget/navigation_bottom_bar_widget.dart";

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;

  UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(name),
          centerTitle: true,
        ),
        body: Image.network(
          urlImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        bottomNavigationBar: NavigationBottomBarWidget(),
      );
}
