import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/registor_page.dart';

class Custom_appbar extends StatelessWidget {
  const Custom_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kTextTabBarHeight + 50,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Registor()));
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
          SizedBox(

            width: 70,
          ),
          Text("Course Details",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
              ),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
