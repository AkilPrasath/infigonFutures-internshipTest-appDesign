import 'dart:math';

import 'package:flutter/material.dart';
import 'package:infigon_design/UI/dashboard_screen.dart';
import 'package:infigon_design/widgets/dashboard.dart';

class LoginScreen extends StatefulWidget {
  static final String id = "Login Screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double width;
  double height;
  List<Widget> tiles = [];
  List<Color> colors = [
    Colors.purple,
    Colors.green,
    Colors.teal,
    Colors.red,
    Colors.yellow[800],
    Colors.deepPurple,
    Colors.blue,
  ];
  List<IconData> iconDataList = [
    Icons.search,
    Icons.computer,
    Icons.touch_app,
    Icons.adb,
    Icons.system_update_alt,
    Icons.local_taxi,
    Icons.call_split
  ];
  Random random = Random();
  ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateTiles();
    scrollController = ScrollController();
    Future.delayed(Duration(seconds: 1)).then((value) {
      scrollBackground();
    });
  }

  scrollBackground() async {
    while (true) {
      await scrollController.animateTo(600,
          duration: Duration(seconds: 5), curve: Curves.easeInCubic);
      await scrollController.animateTo(-600,
          duration: Duration(seconds: 5), curve: Curves.easeInCubic);
    }
  }

  generateTiles() {
    for (int i = 0; i < 7; i++) {
      tiles.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colors[random.nextInt(colors.length - 1)],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 5.0,
                  // spreadRadius: 1,
                ),
              ],
            ),
            height: 80,
            width: 80,
            child: Center(
              child: Icon(
                iconDataList[random.nextInt(iconDataList.length - 1)],
                color: Colors.black45,
                size: 45,
              ),
            ),
          ),
        ),
      );
    }
  }

  List<Widget> randomizeTiles() {
    tiles.shuffle(Random());
    return []..addAll(tiles);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    print(height);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Container(
          child: Stack(
            children: [
              // Container(
              //   color: Colors.white,
              //   child: Wrap(
              //     children: tiles,
              //   ),
              // ),
              SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: randomizeTiles(),
                    ),
                    Row(
                      children: randomizeTiles(),
                    ),
                    Row(
                      children: randomizeTiles(),
                    ),
                    Row(
                      children: randomizeTiles(),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white24,
                      Colors.white70,
                      Colors.indigo[400],
                      Colors.indigo[600],
                    ],
                    stops: [0.05, 0.15, 0.55, 0.750],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 24),
                        child: Material(
                          color: Colors.white60,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.pushNamed(context, DashboardScreen.id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                " Login ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.26 * height,
                    ),
                    // Text(
                    //   "INFIGON",
                    //   style: TextStyle(
                    //     fontSize: 50,
                    //     color: Colors.white,
                    //     letterSpacing: 6,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Image.asset("assets/images/infigon_logo.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Infinite Opportunities. One You.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.13 * height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, DashboardScreen.id);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.mail_outline,
                              color: Colors.white70,
                            ),
                            Text(
                              "Sign up with E-mail",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RaisedButton(
                        // borderSide: BorderSide(
                        //   color: Colors.white,
                        //   width: 0.8,
                        // ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, DashboardScreen.id);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 30,
                              ),
                              child: Image.asset(
                                "assets/images/google.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Sign up with Google",
                              style: TextStyle(
                                  // color: Colors.white,
                                  ),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),
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
}
