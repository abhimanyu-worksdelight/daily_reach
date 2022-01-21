import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    hundling();
  }

  hundling() {
    Future.delayed(Duration(seconds: 5), () {
      // setState(() {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (cotext) => LoginScreen()));
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(

            children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: const EdgeInsets.only(right:16.0),
          child: SizedBox(
            height: 100,
            child: Image.asset(
              "assets/images/Ellipse.png",
            ),
          ),
        ),
        Image.asset("assets/images/Vector.png", width: 90, height: 54),
      ]),
      Expanded(
        child: Image.asset(
          'assets/images/daily.png',
          height: 55,
          width: 247,
        ),
      ),
    ]));
  }
}
