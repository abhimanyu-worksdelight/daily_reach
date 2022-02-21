import 'package:dailyreach/apiservice/api_class.dart';
import 'package:dailyreach/apiservice/api_interface.dart';
import 'package:dailyreach/profile_screen.dart';
import 'package:dailyreach/reset_password.dart';
import 'package:dailyreach/utils/UrlConstants.dart';
import 'package:dailyreach/utils/commonmethod.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  @override
  State<Login_screen> createState() {
    return _Login_screen();
  }
}

class _Login_screen extends State<Login_screen> implements ApiInterface {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool isLoader = false;

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
                      'assets/images/Vector.png',
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
              padding: EdgeInsets.only(left: 30, right: 25, top: 27),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login Your Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "segoe",
                        fontSize: 22,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        'Login to daily reach to access more posts and access many more',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          fontSize: 13,
                          color: Color(0xff4C4949).withOpacity(0.8),
                        ),
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                            controller: emailcontroller,
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
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: passwordcontroller,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              contentPadding: EdgeInsets.all(12),
                              labelStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "segoe",
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                onPressed: () {
                                  setState(
                                    () {
                                      _isObscure = !_isObscure;
                                    },
                                  );
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid password!';
                              } else if (value.length < 6) {
                                return 'Enter at least 6 digit';
                              } else {
                                return null;
                              }
                            },
                          ),
                          isLoader == false
                              ? GestureDetector(
                                  onTap: () {
                                    _submit();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: Container(
                                        width: 325,
                                        height: 50,
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 14, bottom: 15),
                                          child: Text(
                                            'Login',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontFamily: "segoe",
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                228, 189, 20, 20),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.white,
                                                  blurRadius: 3.0,
                                                  spreadRadius: 1.0)
                                            ])),
                                  ),
                                )
                              : Container(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Reset_password()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 43),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      text: 'Forget Password ? ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "segoe",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]))
                  ]))
        ])));
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == false) {
      return;
    } else {
      ApiClass.loginApi(
          emailcontroller.text, passwordcontroller.text, this, context);
      setState(() {
        isLoader = true;
      });
    }
    _formKey.currentState?.save();
  }

  @override
  onFailure(String message) {
    setState(() {
      isLoader = false;
    });
    print(message);
  }

  @override
  onSuccess(data) {
    setState(() {
      isLoader = false;
    });
    SharedPref.saveData(URlConstants.token, data['token']);
    SharedPref.saveData(URlConstants.email, data['data']['email']);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Profile_screen()));
  }
}
