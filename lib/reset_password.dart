import 'package:flutter/material.dart';

import 'profile_name.dart';

class Reset_password extends StatefulWidget{
  @override
  State<Reset_password> createState() {
    return _Reset_password();
  }

}

class _Reset_password extends State<Reset_password>{
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/subtract.png',
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 182),
                    child: Image.asset(
                      'assets/images/vector.png',
                      height: 54,
                      width: 90,
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
                        padding: const EdgeInsets.only(top: 60, left: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/arrow.png',
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 30),
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
            padding: EdgeInsets.only(left: 35, right: 25,top: 27),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reset Your Password ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "segoe",
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      'Please enter your email address to reset your password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "segoe",
                        fontSize: 14,
                        color: Color(0xff4C4949).withOpacity(0.8),
                      ),
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email Address',
                                contentPadding: EdgeInsets.all(12),
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "segoe",
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Enter a valid email!';
                                }
                                return null;
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                _submit();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: Container(
                                    width: 325,
                                    height: 50,
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 14, bottom: 15),
                                      child: Text(
                                        'Send Link',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily: "segoe",
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(228, 189, 20, 20),                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 3.0,
                                              spreadRadius: 1.0)
                                        ])),
                              ),
                            ),


                ]
        )
      )
        ]
    )
      )
    ])
      )
    );
  }
  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid==false) {
      return;
    } else {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Home_screen()));
    }
    _formKey.currentState?.save();
  }
}