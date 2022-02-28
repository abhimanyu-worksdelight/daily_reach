import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/SplashScreen.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/utils/commonmethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'FirstPage.dart';
import 'ForgotPassword.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     EasyLoading.init();
    return _LoginScreen();
  }
}

class _LoginScreen extends State<StatefulWidget> implements ApiInterface {
  bool _isObscure = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  NetworkUtil _networkUtil = new NetworkUtil();
  String version = "";
  PackageInfo? packageInfo;

  getVersion() async {
    packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo!.version;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: SizedBox(
                height: 100,
                child: Image.asset(
                  "assets/images/Ellipse.png",
                ),
              ),
            ),

            // Row(mainAxisAlignment: MainAxisAlignment.end,
            //    children:[ Expanded(
            //       child: Image.asset(
            //           "assets/images/Vector.png", width: 90, height: 54
            //       ),
            //     ),
            //     ]
            // ),
            Image.asset("assets/images/Vector.png", width: 90, height: 54),
          ]),
          Column(
            //mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 60, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()));
                        },
                        child: Image.asset(
                          "assets/images/arrowvector.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ]),
                    Center(
                      child: Image.asset(
                        'assets/images/daily.png',
                        height: 42,
                        width: 190,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: (Text("Login Your Account",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontFamily: "assets/fonts/segui.TTf",
                        fontSize: 22))),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                    "Login to daily reach to access more posts and access many more",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        fontFamily: "assets/fonts/segui.TTf",
                        fontSize: 13)),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        fontFamily: "assets/fonts/segui.TTf",
                      ),
                      controller: emailController,
                      decoration: const InputDecoration(
                        // border: OutlineInputBorder(),
                        
                        labelText: "Email Address",
                        // fillColor: Color.fromARGB(255, 243, 243, 245),
                        //filled: true,
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
                      )

                      )
                      ),
                    // Padding(padding:EdgeInsets.only(top: 13), child:Container(color: Colors.grey,height: 1,)),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Center(
                  child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        fontFamily: "assets/fonts/segui.TTf"),
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        //border: const OutlineInputBorder(),
                        labelText: "Password",
                        // fillColor: const Color.fromARGB(255, 243, 243, 245),
                        //filled: true,
                        suffixIcon: IconButton(
                          // icon: Icon(_isObscure
                          //     ? Icons.visibility
                          //     : Icons.visibility_off),

                           icon: Icon(_isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,color: Colors.grey,),

                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
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
                  ),
                  
                ),
              ),
            // Padding(padding:EdgeInsets.only(top: 13), child:Container(color: Colors.grey,height: 1,)),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child:
                    /* GestureDetector(onTap: () {
                SharedPref.setEmail(emailController.text);
                SharedPref.setPassword(passwordController.text);
              // },*/
                    GestureDetector(
                  onTap: () {
                    if (CommonMethod.validateEmail(emailController.text) ==
                        false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Email Required')));
                    } else if (CommonMethod.validatePassword(
                            passwordController.text) ==
                        false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Password Required')));
                    } else {
                      //         if(_isChecked){
                      //           SharedPref.setEmail(emailController.text);
                      //           SharedPref.setPassword(passwordController.text);
                      //           SharedPref.saveBoxValue(_isChecked);
                      //         }
                      //         else{
                      //           SharedPref.setEmail("");
                      //           SharedPref.setPassword("");
                      //           SharedPref.setBoxValue(_isChecked);
                      //         }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => FirstPage()),
                      // );

                      LoginApi();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 380,
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: "assets/fonts/segui.TTf",
                          color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(233, 182, 3, 3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2.0,
                          blurRadius: 2.0,
                          offset: Offset.fromDirection(
                            1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          text: 'Forgot Password?  ',
                          style: TextStyle(
                            fontFamily: "assets/fonts/segui.TTf",
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  void LoginApi() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // FlashHelper.singleFlash(context, 'Check your internet');
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      _networkUtil.post(Constants.loginUrl, this, body: {
        'email': emailController.text,
        'password': passwordController.text,
        'app_version': '1.2',
        'device_info': 'jknbkjn',
        'one_signal_id': Constants.OneSignalId
      });
    }
  }


  @override
  void onFailure(message, code) {
    // TODO: implement onFailure
    print('error');
    EasyLoader.hideLoader();
    ToastManager.errorToast('error');
  }

  @override
  void onSuccess(data, code) async {
    // TODO: implement onSuccess
     EasyLoader.hideLoader();
     var message = data['message'];

    if (data['status'] == 1) {
     var dataVal = data['data'];
      var token = data['token'];
      var name = dataVal['name'];
      var email = dataVal['email'];
      var phone = dataVal['phone'];
      Constants.isLoggedIn = true;
      SharedPreference.saveBooleanValue(Constants.loginStatus, true);
      SharedPreference.saveStringValue(Constants.token, token);
      SharedPreference.saveStringValue(Constants.firstName,name);
      SharedPreference.saveStringValue(Constants.email,email);
      SharedPreference.saveStringValue(Constants.phoneNumber,phone);
      print('successfully login');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstPage()),
      );
    } else {
      print('error while login');
      ToastManager.errorToast('$message');
    }
  }

  @override
  void onTokenExpire(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('token expired');
    // TODO: implement onTokenExpire
    
  }
}
