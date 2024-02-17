import 'package:flutter/material.dart';
import '../widget/button_widget.dart';
import '../widget/navigation_drawer_widget.dart';
import '../widget/navigation_bottom_bar_widget.dart';

class HomePage extends StatelessWidget {
  static final String title = 'La tua home';

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        // endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('HomePage'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: NavigationBottomBarWidget(),
        body: Builder(
          builder: (context) => Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: ButtonWidget(
              icon: Icons.open_in_new,
              text: 'Open Drawer',
              onClicked: () {
                Scaffold.of(context).openDrawer();
                // Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ),
      );
}
