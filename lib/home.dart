import 'package:flutter/material.dart';
import 'settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text("My teamUp account"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    // Implement your logout logic here
                    // For example, you can show a dialog or navigate to the login screen
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                print("pressed!");
              },
            ),
            bottomNavigationBar: BottomNavigationBar(items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: "School",
              )
            ]),
            drawer: Drawer(
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
                        backgroundImage: AssetImage(
                            'picture.jpeg'), // Replace with your image path
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
                                // Handle click for Item 2
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
            )));
  }
}
