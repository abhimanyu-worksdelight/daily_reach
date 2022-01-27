import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPassword extends StatefulWidget {  @override
State<StatefulWidget> createState() {
  return _FirstPage();
}
}
class _FirstPage extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
        SizedBox(height: 200,width: 200,
          child: Image(image: AssetImage("assets/images/daily.png")),
        ),
      ),
    );
  }
}