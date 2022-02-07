import 'package:flutter/material.dart';

class Feed_screen extends StatefulWidget {
  @override
  State<Feed_screen> createState() {
    return _Feed_screen();
  }
}

class _Feed_screen extends State<Feed_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/daily_reach_logo.png',
                height: 40,
                width: 180,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "segoe",
                  color: Colors.red,
                ),
              ),
              Image.asset(
                'assets/images/bell.png',
                height: 20,
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
