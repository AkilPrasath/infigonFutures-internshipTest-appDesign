import 'package:flutter/material.dart';
import 'package:infigon_design/menu_controller.dart';
import 'package:infigon_design/widgets/dashboard.dart';
import 'package:infigon_design/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static final String id = "Dashboard screen";
  DrawerMenu drawerMenu;
  DashboardScreen({this.drawerMenu});
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  double width;
  MenuController menuController;
  double height;
  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  zoomAndSlideContent(BuildContext context, Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: true).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleDownCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleUpCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
    }

    // final slideAmount = 275.0 * slidePercent;
    final slideAmount = 270.0 * slidePercent;
    final contentScale = 1.0 - (0.05 * scalePercent);
    final cornerRadius =
        16.0 * Provider.of<MenuController>(context, listen: true).percentOpen;
    final opacity = convertOpacityRange(
        1 - Provider.of<MenuController>(context, listen: true).percentOpen);
    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: true
            ? Opacity(
                opacity: opacity,
                child: content,
              )
            : new ClipRRect(
                borderRadius: new BorderRadius.circular(cornerRadius),
                child: content),
      ),
    );
  }

  double convertOpacityRange(double val) {
    double newBegin = 0.8;
    double oldRange = 1.0 - 0.0;
    double newRange = 1.0 - newBegin;
    double newVal = (((val - 0) * newRange) / oldRange) + newBegin;
    return newVal;
  }

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    // menuController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: Stack(
                children: [
                  DrawerMenu(),
                  zoomAndSlideContent(context, DashboardWidget()),
                  AnimatedPositioned(
                    bottom: -60 *
                        Provider.of<MenuController>(context, listen: true)
                            .percentOpen,
                    duration: Duration(milliseconds: 750),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 0.08 * height,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[600],
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 1,
                                ),
                              ]),
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.blueAccent,
                              ),
                              Icon(
                                Icons.line_style,
                              ),
                              Icon(Icons.event_note),
                              Icon(Icons.person),
                            ],
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
      }),
    );
  }
}
