import 'package:flutter/material.dart';

class NavigationBottomBarWidget extends StatefulWidget {
  final Map<String, Widget> pages;

  NavigationBottomBarWidget({required this.pages});

  @override
  _NavigationBottomBarWidgetState createState() =>
      _NavigationBottomBarWidgetState();
}

class _NavigationBottomBarWidgetState extends State<NavigationBottomBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages.values.toList()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: List.generate(
          widget.pages.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(Icons.pages), // Replace with appropriate icons
            label: widget.pages.keys.toList()[index],
          ),
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
