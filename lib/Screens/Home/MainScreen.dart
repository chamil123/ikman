import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ikman/Screens/FourthScreen.dart';
import 'package:ikman/Screens/Home/HomeScreen.dart';
import 'package:ikman/Screens/Profile/profile_screen.dart';
import 'package:ikman/Screens/ThirdScreen.dart';
import 'package:ikman/Screens/fifthScree.dart';
import 'package:ikman/utils/constant.dart';

import '../Search/SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    SecondScreen(),
    ThirdScreen(),
    FourthScreen(),
    FifthScreern()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = SecondScreen();
  bool _isShowingBottomBar = true;
  bool _isShowingFloatingActionButton = true; // New variable
  double _previousOffset = 0.0;
  ScrollDirection _lastScrollDirection = ScrollDirection.idle;
  double _bottomBarHeight = 70.0; // Initial height of bottom bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: currentScreen is SecondScreen
          ? Drawer(
              // Add your drawer content here
              child: ListView(
                children: [
                const  DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title:const Text('Item 1'),
                    onTap: () {
                      // Handle drawer item tap
                    },
                  ),
                  ListTile(
                    title:const Text('Item 2'),
                    onTap: () {
                      // Handle drawer item tap
                    },
                  ),
                ],
              ),
            )
          : null,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification &&
                  currentScreen is SecondScreen &&
                  notification.metrics.axisDirection == AxisDirection.down ||
              notification.metrics.axisDirection == AxisDirection.up) {
            double currentOffset = notification.metrics.pixels;
            setState(() {
              // Check if scrolling up
              if (currentOffset < _previousOffset) {
                _isShowingBottomBar = true;
                _bottomBarHeight = 70.0; // Height when bottom bar is shown
                _isShowingFloatingActionButton =
                    true; // Show floating action button
              }
              // Check if scrolling down
              else if (currentOffset > _previousOffset) {
                _isShowingBottomBar = notification.metrics.extentAfter <= 0;
                _bottomBarHeight = _isShowingBottomBar ? 70.0 : 0.0;
                _isShowingFloatingActionButton =
                    _isShowingBottomBar; // Hide floating action button if bottom bar is hidden
              }
              _previousOffset = currentOffset;
            });
          }
          return false;
        },
        child: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
      ),
      floatingActionButton: _isShowingFloatingActionButton
          ? FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(),
              child: const RawMaterialButton(
                onPressed: null,
                fillColor: Constants.floatingActionBtnColor,
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 0.1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    CupertinoIcons.plus,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Animation duration
        height:
            _bottomBarHeight, // Adjusted height based on _isShowingBottomBar
        child: _isShowingBottomBar
            ? BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 0,
                child: Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  currentScreen = SecondScreen();
                                  currentTab = 0;
                                });
                              },
                              minWidth: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.home,
                                    color: currentTab == 0
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  Text("Home")
                                ],
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  currentScreen = SearchScreen();
                                  currentTab = 1;
                                });
                              },
                              minWidth: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.search,
                                    color: currentTab == 1
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                 const Text("Search")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text("Post ad"),
                      ),
                      SingleChildScrollView(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  currentScreen = FifthScreern();
                                  currentTab = 2;
                                });
                              },
                              minWidth: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.chat_bubble,
                                    color: currentTab == 2
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  const Text("Chat")
                                ],
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  currentScreen = ProfileScreen();
                                  currentTab = 3;
                                });
                              },
                              minWidth: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.person,
                                    color: currentTab == 3
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  const Text("Profile")
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
