import 'package:dailyreach/profile_screen.dart';
import 'package:flutter/material.dart';

import 'become_member.dart';
import 'main.dart';

class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() {
    return _Splash_screen();
  }
}

class _Splash_screen extends State<Splash_screen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=> Become_member()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
        children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Positioned(
              left: -89,
              top: -71,
              child: Image.asset(
                'assets/images/subtract.png',
                width: 105,
                height: 168,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 139),
              child: Image.asset(
                'assets/images/vector.png',
                height: 56,
              ),
            )
          ],
        ),
        Center(
          child: Image.asset('assets/images/daily_reach_logo.png',width: 247,
            height: 55,),
        )
        ],
        ));
  }
}
