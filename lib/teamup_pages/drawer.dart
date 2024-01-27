import 'package:flutter/material.dart';
import 'package:initial_app/teamup_pages/home.dart';
import 'package:initial_app/teamup_pages/profilo.dart';

class AppDrawer extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Map<String, Widget> drawerItems;

  const AppDrawer(
      {Key? key, required this.navigatorKey, required this.drawerItems})
      : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var currentPage = DrawerSections.homepage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'drawer_background.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    AssetImage('picture.jpeg'), // Replace with your image path
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    color: const Color.fromRGBO(
                        0, 0, 0, 0.8), // Black with 50% transparency
                    child: ListTile(
                      title: const Text('Home',
                          style: TextStyle(
                            color: Colors
                                .white, // Replace with your desired text color
                          )),
                      onTap: () {
                        // Handle click for Item 1
                      },
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(
                        0, 0, 0, 0.8), // Black with 50% transparency
                    child: ListTile(
                      // Black with 50% transparency
                      title: const Text('Profilo',
                          style: TextStyle(
                            color: Colors
                                .white, // Replace with your desired text color
                          )),
                      onTap: () {
                        setState(() {
                          currentPage = DrawerSections.profile;
                        });
                        // Handle tap for Sub-Item 1
                      },
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(
                        0, 0, 0, 0.8), // Black with 50% transparency
                    child: ExpansionTile(
                      title: const Text('Squadre',
                          style: TextStyle(
                            color: Colors
                                .white, // Replace with your desired text color
                          )),
                      children: [
                        Container(
                          child: ListTile(
                            title: const Text('Squadra 1',
                                style: TextStyle(
                                  color: Colors
                                      .white, // Replace with your desired text color
                                )),
                            onTap: () {
                              // Handle tap for Sub-Item 1
                            },
                          ),
                        ),
                        Container(
                          child: ListTile(
                            title: const Text('Squadra 2',
                                style: TextStyle(
                                  color: Colors
                                      .white, // Replace with your desired text color
                                )),
                            onTap: () {
                              // Handle tap for Sub-Item 2
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(
                        0, 0, 0, 0.8), // Black with 50% transparency
                    child: ListTile(
                      title: const Text('Panoramica giri',
                          style: TextStyle(
                            color: Colors
                                .white, // Replace with your desired text color
                          )),
                      onTap: () {
                        // Handle click for Item 1
                      },
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(0, 0, 0, 0.8),
                    child: ListTile(
                      title: const Text('Aggiungi nuovo giro',
                          style: TextStyle(
                            color: Colors
                                .white, // Replace with your desired text color
                          )),
                      onTap: () {
                        // Handle click for Item 1
                      },
                    ),
                  ),
                  // Add more ListTiles for additional items
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (currentPage) {
      case DrawerSections.homepage:
        return HomeScreenContent();
      case DrawerSections.profile:
        return ProfilePage();
      default:
        return Container(); // Handle other indices if needed
    }
  }
}

enum DrawerSections { homepage, profile }
