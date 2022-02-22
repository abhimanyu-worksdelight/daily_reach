import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/profile_screen.dart';
import 'package:dailyreach/reset_password.dart';
import 'package:dailyreach/utils/flash_Helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Login_screen extends StatefulWidget {
  @override
  State<Login_screen> createState() {
     EasyLoading.init();
    return _Login_screen();
  }
}

class _Login_screen extends State<Login_screen>implements ApiInterface {
  final _formKey = GlobalKey<FormState>();
  bool _ischecked = false;
  bool _isObscure = true;
  NetworkUtil _networkUtil = new NetworkUtil();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                            child: Center(
                              child: Image.asset(
                                'assets/images/daily_reach_logo.png',
                                height: 42,
                                width: 190,
                              ),
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
                  child: Column(
                    children: [
                  TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                  labelText: 'Email Address',
                  
                    contentPadding: EdgeInsets.only(top:12),

                    labelStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontFamily: "segoe",
                      color: Colors.grey
                    ),

                    enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 0.0),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
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
                // Padding(padding:EdgeInsets.only(top: 13), child:Container(color: Colors.grey,height: 1,)),
                TextFormField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: EdgeInsets.only(top: 12),
                    labelStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontFamily: "segoe",
                      color: Colors.grey
                    ),
                    suffixIcon: IconButton(
                      // icon: Icon(_isObscure
                      //     ? Icons.visibility_off_outlined
                      //     : Icons.visibility_outlined, color: Colors.grey,),

                      icon: Icon(
                           Icons.visibility_outlined, color: Colors.grey,),
                      onPressed: () {
                        setState(
                              () {
                            _isObscure = !_isObscure;
                          },
                        );
                      },
                    ),
                    enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 0.0),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
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
                // Padding(padding:EdgeInsets.only(top: 13), child:Container(color: Colors.grey,height: 1,)),
                GestureDetector(
                  onTap: () {
                    _submit();
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Container(
                          width: 380,
                          height: 50,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 14, bottom: 15),
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
                              color: const Color.fromARGB(228, 189, 20, 20),
                              borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 3.0,
                                spreadRadius: 1.0)
                          ])),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Reset_password()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 43),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Forgot Password ? ',
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
            ]
            )
        )
        ]
    ))

    ]
    )
    )
    );
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == false) {
      return;
    } else {
      LoginApi();
      
    }
    _formKey.currentState?.save();
  }

  void LoginApi() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      FlashHelper.singleFlash(context, 'Check your internet');
    } else {
      EasyLoader.showLoader();
      _networkUtil.post(Constants.loginUrl, this, body: {
        'email': emailController.text,
        'password': passwordController.text,
        'app_version': '1.2',
        'device_info': 'jknbkjn',
        'one_signal_id': 'lkjlknjljn'
      });
    }
  }

  @override
  void onFailure(message, code) {
    EasyLoader.hideLoader();
    // TODO: implement onFailure
  }

  @override
  void onSuccess(data, code) {
    EasyLoader.hideLoader();
    // TODO: implement onSuccess
    

      if (data['status'] == 1) {
      var dataVal = data['data'];
      var token = data['token'];
      Constants.isLoggedIn = true;
      SharedPreference.saveBooleanValue(Constants.loginStatus, true);
      SharedPreference.saveStringValue(Constants.token, token);
      print('successfully login');
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Profile_screen()));
    } else {
      print('error while login');
    }
  }

  @override
  void onTokenExpire(message, code) {
    EasyLoader.hideLoader();
    // TODO: implement onTokenExpire
  }
}

