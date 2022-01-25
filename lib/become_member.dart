import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Become_member extends StatefulWidget {
  @override
  State<Become_member> createState() {
    return _Become_member();
  }
}

class _Become_member extends State<Become_member> {
  bool _ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70, left: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            },
                            child: Image.asset(
                              'assets/images/arrow.png',
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70, left: 30),
                          child: Image.asset(
                            'assets/images/daily_reach_logo.png',
                            height: 42,
                            width: 190,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Become a Member',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      'We need some personal information to register with us.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff4C4949).withOpacity(0.8),
                      ),
                    ),
                  ),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email-Address',
                          labelStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone-Number',
                          labelStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Create Password',
                          labelStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _ischecked,
                            onChanged: (v) {
                              setState(() {
                                _ischecked = v!;
                              });
                            },
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'I agree with',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(153, 57, 55, 55),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Terms of use ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                  TextSpan(
                                    text: ' and',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Color.fromARGB(153, 57, 55, 55),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                            width: 325,
                            height: 50,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 14,bottom: 15),
                              child: Text(
                                'Become a Member',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.white,fontWeight:FontWeight.w600),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(228, 130, 7, 7),
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 3.0,
                                      spreadRadius: 1.0)
                                ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Already have an account ?  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(144, 140, 184, 201),
                                ),
                              ),
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(228, 130, 7, 7),
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
