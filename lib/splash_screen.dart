import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_database/home_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 void initState() {
  super.initState();
    Timer(
       Duration(seconds:11),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>Homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.blue.shade400,
      body: Center(
        child: Container(
          height: 250,
          width: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("asset/animation.json"),
                SizedBox(
                  height: 20,
                ),
                Text("Opening Soon......!",style:TextStyle(color: Colors.white,fontSize: 25)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
