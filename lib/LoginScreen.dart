import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
State<StatefulWidget> createState() {
  return _LoginScreen();
}
}
class _LoginScreen extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
        SizedBox(height: 200,width: 200,
          child: Image(image: AssetImage("assets/images/workout4.jpg")),
        ),
      ),
    );
  }
}