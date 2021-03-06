import 'package:flutter/material.dart';
import 'Notification.dart';
import 'main.dart';

class Home_screen extends StatefulWidget {
  @override
  State<Home_screen> createState() {
    return _Home_screen();
  }
}

class _Home_screen extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Column(
          children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/rectangle_back.png',
                height: 208,
                fit: BoxFit.fill,
              ),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64,left: 23),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "segoe",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notefication()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top:64,left: 230,right: 23),
                    child: Image.asset(
                      'assets/images/bell.png',
                      width: 18,
                      height: 18,
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Pardeep',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "segoe",
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'pardeep@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "segoe",
                      color: Color.fromARGB(153, 57, 55, 55),

                    ),
                  )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 85),
                    child: Image.asset(
                      'assets/images/flag.png',
                      height: 19,
                      width: 19,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10,left: 3),
                      child: Text(
                        '+1',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Color.fromARGB(153, 179, 195, 210),

                        ),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(top: 10,left: 8),
                      child: Text(
                        '87896 5668',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Color.fromARGB(153, 179, 195, 210),

                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Container(
              width: 149,
              height: 50,
              child: const Padding(
                padding: EdgeInsets.only(top: 14, bottom: 10),
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
                  color: const Color.fromARGB(228, 189, 20, 20),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 3.0,
                        spreadRadius: 1.0)
                  ])),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 10, top: 200, bottom: 10),
            child: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: "segoe",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ]),
    );
  }
}
