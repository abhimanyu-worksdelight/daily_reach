import 'package:flutter/material.dart';

class Archive_screen extends StatefulWidget{
  @override
  State<Archive_screen> createState() {
    return _Archive_screen();
  }

}

class _Archive_screen extends State<Archive_screen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
      ),
    );
  }
}