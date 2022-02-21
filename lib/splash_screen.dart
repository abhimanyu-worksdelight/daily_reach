import 'package:dailyreach/become_member.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/profile_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() {
    return _Splash_screen();
  }
}

class _Splash_screen extends State<Splash_screen> {

bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {

      getLoginStatus();
      
    });
  }

  void getLoginStatus() {
    print("getLoginStatus :: ");
    Future<bool> status =
        SharedPreference.getLoginStatus(Constants.loginStatus);
    status.then(
        (value) => {
              isLoggedIn = value,
              print("Splash value ::: $value"),
              Constants.isLoggedIn = value,
             (isLoggedIn == true) ? goToprofilePage() : goTologin()
            }, onError: (err) {
      print("Error occured :: $err");
    });
  }

  void goToprofilePage(){
    
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Profile_screen()));
    // Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void goTologin(){
    Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
                Image.asset(
                  'assets/images/subtract.png',
                  width: 105,
                  height: 168,
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
              child: Image.asset(
                'assets/images/daily_reach_logo.png',
                width: 247,
                height: 55,
              ),
            ),
          ],
        ));
  }
}
