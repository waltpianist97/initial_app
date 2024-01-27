import 'package:flutter/material.dart';
import 'package:initial_app/page/people_page.dart';
import 'package:initial_app/page/favourites_page.dart';

class NavigationBottomBarWidget extends StatefulWidget {
  final Map<String, Widget> pages = {
    "People": PeoplePage(),
    "Favourites": FavouritesPage(),
  };
  NavigationBottomBarWidget();

  @override
  _NavigationBottomBarWidgetState createState() =>
      _NavigationBottomBarWidgetState();
}

class _NavigationBottomBarWidgetState extends State<NavigationBottomBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'People',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pages), // Replace with appropriate icons
          label: 'Favourites',
        ),
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        selectedItem(context, _selectedIndex);
      },
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
    }
  }
}
