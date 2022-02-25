import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/login_screen.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/profile_screen.dart';
import 'package:flutter/material.dart';

import 'Home_Screen.dart';

class Reset_password extends StatefulWidget{
  @override
  State<Reset_password> createState() {
    return _Reset_password();
  }

}

class _Reset_password extends State<Reset_password> implements ApiInterface{
  final _formKey = GlobalKey<FormState>();
  NetworkUtil _networkUtil = new NetworkUtil();


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
            padding: EdgeInsets.only(left: 25, right: 25,top: 27),
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
                                contentPadding: EdgeInsets.only(top: 12,bottom: 12,left: 0),
                                labelStyle: TextStyle(
                                  fontSize: 13,
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
      forgotPasswordApi();
    }
    _formKey.currentState?.save();
  }


  void forgotPasswordApi() async{
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // FlashHelper.singleFlash(context, 'Check your internet');
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      _networkUtil.post(Constants.forgetPasswordUrl, this, body: {
        'email': 'davi.kaur003@gmail.com',
      });
    }
  }



  @override
  void onFailure(message, code) {
    ToastManager.errorToast('failuer error');
  }

  @override
  void onSuccess(data, code) {
     if (data['status'] == 1) {
       
       ToastManager.successToast('Link Sent to email Successfully');
        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_screen(isfromSignup: false,)));
     }
    
  }

  @override
  void onTokenExpire(message, code) {
    ToastManager.errorToast('token expired');
  }
}