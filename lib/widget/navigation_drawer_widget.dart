import 'package:flutter/material.dart';
import 'package:initial_app/page/favourites_page.dart';
import 'package:initial_app/page/people_page.dart';
import 'package:initial_app/page/user_page.dart';
import 'package:initial_app/page/squadra_page.dart';
import 'package:initial_app/page/home_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    const name = 'Sarah Abs';
    const email = 'sarah@abs.com';
    const image = "assets/picture.jpeg";
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "drawer_background.jpg"), // Replace with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: ListView(
            children: <Widget>[
              buildHeader(
                urlImage: image,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserPage(
                    name: 'Profile Picture',
                    urlImage: image,
                  ),
                )),
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    //const SizedBox(height: 12),
                    //buildSearchField(),
                    const SizedBox(height: 24),
                    buildMenuItem(
                      text: 'Home page',
                      icon: Icons.home,
                      onClicked: () => selectedItem(context, HomePage()),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'People',
                      icon: Icons.people,
                      onClicked: () => selectedItem(context, PeoplePage()),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Favourites',
                      icon: Icons.favorite_border,
                      onClicked: () => selectedItem(context, FavouritesPage()),
                    ),
                    const SizedBox(height: 16),
                    buildMenuExpandedItem(
                      text: 'Teams',
                      icon: Icons.pedal_bike,
                      onClicked: () {
                        // Handle tap for the main item
                      },
                      subItems: [
                        buildMenuItem(
                          text: 'team la bomba',
                          icon: Icons.notifications_outlined,
                          onClicked: () => selectedItem(
                              context, Squadra(squadraName: "team la bomba")),
                        ),
                        buildMenuItem(
                          text: 'team la bamba',
                          icon: Icons.notifications_outlined,
                          onClicked: () => selectedItem(
                              context, Squadra(squadraName: "team la bomba")),
                        ),
                        // Add more sub-items as needed
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.white;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      tileColor: const Color.fromRGBO(0, 0, 0, 0.5),
      onTap: onClicked,
    );
  }

  Widget buildMenuExpandedItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
    List<Widget>? subItems,
  }) {
    const color = Colors.white;

    return ExpansionTile(
      collapsedBackgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
      collapsedIconColor: const Color.fromRGBO(0, 0, 0, 0.5),
      title: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8), // Adjust the spacing between icon and text
          Text(text, style: const TextStyle(color: color)),
        ],
      ),
      children: subItems ?? [], // Use provided subItems or an empty list
      onExpansionChanged: (bool isExpanded) {
        if (isExpanded && onClicked != null) {
          onClicked(); // Call the main item's onTap when the expansion tile is opened
        }
      },
    );
  }

  void selectedItem(BuildContext context, Widget page) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
