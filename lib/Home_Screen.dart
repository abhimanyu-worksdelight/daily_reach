import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/Edit_Profile.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:flutter/material.dart';
import 'Notification.dart';
import 'main.dart';

class Home_screen extends StatefulWidget {
  @override
  State<Home_screen> createState() {
    return _Home_screen();
  }
}

class _Home_screen extends State<Home_screen> implements ApiInterface {


NetworkUtil _networkUtil = new NetworkUtil();


@override void initState() {
    getToken();
    super.initState();
  }

  getToken(){
    Future<String> loginToken = SharedPreference.getStringValuesSF(Constants.token);
    loginToken.then(
        (value) => {
               Constants.tokenStr = value
            }, onError:(err) {
      print("Error occured :: $err");
    });

    Future<String> name = SharedPreference.getStringValuesSF(Constants.firstName);
    name.then(
        (value) => {
               Constants.nameStr = value
            }, onError:(err) {
      print("Error occured :: $err");
    });

    Future<String> email = SharedPreference.getStringValuesSF(Constants.email);
    email.then(
        (value) => {
               Constants.emailStr = value
            }, onError:(err) {
      print("Error occured :: $err");
    });

    Future<String> phone = SharedPreference.getStringValuesSF(Constants.phoneNumber);
    phone.then(
        (value) => {
               Constants.phoneStr = value
            }, onError:(err) {
      print("Error occured :: $err");
    });

  setState(() {
    
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Column(
          children: [
        Stack(
          children: [
            
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
             Padding(
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
               Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    Constants.nameStr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "segoe",
                    ),
                  )),
               Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    Constants.emailStr,
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
                   Padding(
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
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile(name: Constants.nameStr,email:Constants.emailStr,phone: Constants.phoneStr)));
            },
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
        ),
        InkWell(
          onTap: (){
            logoutApi();
          },
          child: Padding(
            padding: EdgeInsets.only(top: 200,bottom: 20),
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


  void logoutApi() async{
    
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      await _networkUtil.getAuth(Constants.logoutUrl, Constants.tokenStr, this);
    }

  }

  @override
  void onFailure(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('error');
  }

  @override
  void onSuccess(data, code) {
    ToastManager.successToast('success');
    EasyLoader.hideLoader();
    
    if (data['status'] == 1) {
      print('successfully logout');
      SharedPreference.saveBooleanValue(Constants.loginStatus, false);
      SharedPreference.saveStringValue(Constants.token, '');

      Future<String> status = SharedPreference.getStringValuesSF(Constants.videoStr);
    status.then(
        (value) => {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(intro_video: value,)))
            }, onError: (err) {
      print("Error occured :: $err");
    });
    }
    else{
      ToastManager.errorToast('error fail');
    }
    
  }

  @override
  void onTokenExpire(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('token expired');
  }
}
