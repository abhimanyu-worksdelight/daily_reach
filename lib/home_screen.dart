import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget{
  @override
  State<Home_screen> createState() {
    return _Home_screen();
  }

}

class _Home_screen extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Home',
        style: TextStyle(
          fontSize: 50
        ),),
      ),

    );
  }
}
