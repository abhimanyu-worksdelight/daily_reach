import 'package:dailyreach/Feed.dart';
import 'package:dailyreach/LoginScreen.dart';
import 'package:dailyreach/Notification.dart';
import 'package:dailyreach/PostDetail.dart';
import 'package:dailyreach/SplashScreen.dart';
import 'package:dailyreach/Notification.dart';
import 'package:dailyreach/PostDetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: PostDetail(),
    );
  }
}

/*class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Image.asset('assets/images/Rectangle.png'),
      ),
    );
  }
}*/
