import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_database/custom_appbar.dart';



class Design extends StatefulWidget {
  const Design({Key? key}) : super(key: key);

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // Blue Container with AppBar and CarouselSlider
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Custom_appbar(),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CarouselSlider(
                          items: [
                            _buildCarouselItem(
                                "image/python_img.png", 200, 150, 0),
                            _buildCarouselItem(
                                "image/java_img.png", 150, 120, 1),
                            _buildCarouselItem(
                                "image/dotnet_img.png", 150, 120, 2),
                          ],
                          options: CarouselOptions(
                            height: 180,
                            viewportFraction: 0.3,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 600),
                            autoPlayCurve: Curves.bounceIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // White Container with Nested Container
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                    child: Container(
                      height: 10,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60),
                        ),
                      ),
                      child: _selectedIndex != null
                          ? Image.asset(
                        _getSelectedImagePath(_selectedIndex),
                        fit: BoxFit.contain, // Updated fit property
                      )
                          : SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(
      String imagePath, double width, double height, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  String _getSelectedImagePath(int index) {
    switch (index) {
      case 0:
        return "image/python_img.png";
      case 1:
        return "image/java_img.png";
      case 2:
        return "image/dotnet_img.png";
      default:
        return ""; // Add default return case
    }
  }
}
