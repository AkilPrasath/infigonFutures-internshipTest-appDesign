import 'package:flutter/material.dart';
import 'package:infigon_design/menu_controller.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatefulWidget {
  static final String id = "Drawer menu";
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  double width;
  double height;
  double imageWidth;
  double imageHeight;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Scaffold(
        body: Container(
          width: 0.8 * width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                // height: 0.3 * height,
                child: Stack(
                  children: [
                    Container(
                      width: 0.8 * width,
                      height: 0.15 * height,
                      constraints: BoxConstraints(
                        minWidth: 0.8 * width,
                      ),
                      child: Image.asset(
                        "assets/images/abstract2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 0.8 * width,
                      height: 0.15 * height,
                      color: Colors.white12,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 0.08 * height,
                          ),
                          Container(
                            height: 0.25 * width,
                            width: 0.25 * width,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/circleAvatar.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Akil Stark",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.pin_drop,
                                  color: Colors.blue[800],
                                  size: 15,
                                ),
                                Text(
                                  "Mumbai",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.04 * height,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DrawerItem(
                      iconData: Icons.call,
                      text: "Contact Us",
                    ),
                    DrawerItem(
                      iconData: Icons.insert_chart,
                      text: "My Growth",
                    ),
                    DrawerItem(
                      iconData: Icons.book,
                      text: "My Education",
                    ),
                    DrawerItem(
                      iconData: Icons.center_focus_weak,
                      text: "My Target",
                    ),
                    DrawerItem(
                      iconData: Icons.insert_drive_file,
                      text: "My Tests",
                    ),
                    DrawerItem(
                      iconData: Icons.credit_card,
                      text: "Payments",
                    ),
                    DrawerItem(
                      iconData: Icons.computer,
                      text: "news and Blogs",
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tap here to"),
                      Text(
                        " log out",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    @required this.iconData,
    @required this.text,
    Key key,
  }) : super(key: key);

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          iconData,
          color: Colors.grey[800],
        ),
        title: Text(
          "$text",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
