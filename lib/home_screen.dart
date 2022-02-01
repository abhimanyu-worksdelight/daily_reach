import 'package:country_code_picker/country_code_picker.dart';
import 'package:dailyreach/profile_screen.dart';
import 'package:dailyreach/splash_screen.dart';
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
      body:SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 65, left: 19),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "segoe",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 65, left: 240, right: 19),
                    child: Image.asset(
                      'assets/images/bell.png',
                      width: 18,
                      height: 18,
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/images/rectangle_back.png',
                height: 208,
                width: 375,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 141, left: 120),
                child: Image.asset(
                  'assets/images/ellispe5.png',
                  height: 120,
                  width: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 177, left: 159),
                child: Image.asset(
                  'assets/images/camera.png',
                  height: 40,
                  width: 40,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 222, left: 145),
                child: Text(
                  'Upload photo',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    fontFamily: "segoe",
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30,),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                        ),
                        border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                        ),
                        border: InputBorder.none),
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'IT',
                          favorite: const ['+39', 'FR'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ],
                    ),
                    const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "segoe",
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
                width: 149,
                height: 50,
                child: const Padding(
                  padding: EdgeInsets.only(top: 14, bottom: 15),
                  child: Text(
                    'Edit Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "segoe",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(228, 130, 7, 7),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 3.0,
                          spreadRadius: 1.0)
                    ])),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 140, bottom: 50),
            child: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: "segoe",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ]),
      ),

    );
  }
}
