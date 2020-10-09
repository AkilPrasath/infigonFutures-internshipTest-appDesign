import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:infigon_design/menu_controller.dart';
import 'package:infigon_design/widgets/image_list_tile.dart';
import 'package:infigon_design/widgets/legend_row.dart';
import 'package:infigon_design/widgets/radial_gauge.dart';
import 'package:provider/provider.dart';

class DashboardWidget extends StatefulWidget {
  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  double width;
  double height;
  int _current = 0;
  List<Image> carouselImages = [
    Image.asset("assets/images/carousel2.jpg", fit: BoxFit.cover),
    Image.asset("assets/images/carousel1.jpg", fit: BoxFit.cover),
    Image.asset("assets/images/carousel3.jpg", fit: BoxFit.cover),
  ];
  List<Image> listImages = [
    "assets/images/abstract1.jpg",
    "assets/images/abstract3.jpg",
    "assets/images/abstract4.jpg",
    "assets/images/abstract1.jpg",
  ]
      .map((string) => Image.asset(
            string,
            fit: BoxFit.cover,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: 0.3 * height,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayCurve: Curves.easeIn,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  itemCount: carouselImages.length,
                  itemBuilder: (context, index) {
                    return carouselImages[index];
                  },
                ),
                Container(
                  height: 0.295 * height,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: carouselImages.map((url) {
                        int index = carouselImages.indexOf(url);
                        return Container(
                          width: 10.0,
                          height: 3.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _current == index
                                ? Colors.white
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<MenuController>(context, listen: true)
                          .toggle();
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Card(
                elevation: 1.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        RadialGauge(
                          height: 0.15 * height,
                          width: 0.35 * width,
                          color: Colors.blueAccent,
                          value: 70,
                        ),
                        RadialGauge(
                          height: 0.105 * height,
                          width: 0.25 * width,
                          value: 40,
                          color: Colors.blue[900],
                        ),
                        Text(
                          "70%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LegendRow(
                          height: height,
                          color: Colors.blueAccent,
                          text: "Academics",
                        ),
                        LegendRow(
                          color: Colors.blue[900],
                          height: height,
                          text: "Personal Info",
                        ),
                        LegendRow(
                          color: Colors.teal[50],
                          height: height,
                          text: "Remaining",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(
                  "For You",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ImageListTile(
                    width: width,
                    height: height,
                    image: listImages[index],
                    title: Text("dummy\nxyz"),
                    subtitle: Text("2 Min read | 26 Oct"),
                  );
                },
                itemCount: listImages.length,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Divider(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 0.07 * height,
            ),
          ],
        ),
      ),
    );
  }
}
