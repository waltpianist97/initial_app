import 'package:flutter/material.dart';
import 'package:initial_app/page/favourites_page.dart';
import 'package:initial_app/page/people_page.dart';
import 'package:initial_app/page/user_page.dart';
import 'package:initial_app/page/squadra_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Sarah Abs';
    final email = 'sarah@abs.com';
    final image = "assets/picture.jpeg";
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
                    const SizedBox(height: 12),
                    buildSearchField(),
                    const SizedBox(height: 24),
                    buildMenuItem(
                      text: 'People',
                      icon: Icons.people,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Favourites',
                      icon: Icons.favorite_border,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Workflow',
                      icon: Icons.workspaces_outline,
                      onClicked: () => selectedItem(context, 2),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Updates',
                      icon: Icons.update,
                      onClicked: () => selectedItem(context, 3),
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
                          onClicked: () => selectedItem(context, 5),
                        ),
                        buildMenuItem(
                          text: 'team la bamba',
                          icon: Icons.notifications_outlined,
                          onClicked: () => selectedItem(context, 6),
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
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
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
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      tileColor: Color.fromRGBO(0, 0, 0, 0.5),
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
    const hoverColor = Colors.white70;

    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(0, 0, 0, 0.5),
      title: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8), // Adjust the spacing between icon and text
          Text(text, style: TextStyle(color: color)),
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
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Squadra(
            squadraName: "Team la bomba",
          ),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Squadra(
            squadraName: "Team la bamba",
          ),
        ));
        break;
    }
  }
}
