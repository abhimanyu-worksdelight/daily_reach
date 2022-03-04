import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> implements ApiInterface {

  NetworkUtil networkUtil = new NetworkUtil();
  
  @override
  void initState() {
    super.initState();
    hundling();
  }

  hundling() {
    Future.delayed(Duration(seconds: 5), () {
      // setState(() {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (cotext) => LoginScreen()));
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(

            children: [
      // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //   Container(
      //     margin: const EdgeInsets.only(right:16.0),
      //     child: SizedBox(
      //       height: 100,
      //       child: Image.asset(
      //         "assets/images/Ellipse.png",
      //       ),
      //     ),
      //   ),
      //   Image.asset("assets/images/Vector.png", width: 90, height: 54),
      // ]),
      Expanded(
        child: Image.asset(
          'assets/images/daily.png',
          height: 55,
          width: 247,
        ),
      ),
    ]));
  }


  void getGeneralSettingsApi() async{

    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // FlashHelper.singleFlash(context, 'Check internet connection');
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      await networkUtil.get(Constants.generalSettingsUrl, this);
    }

  }

  @override
  void onFailure(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('error');
    
  }

  @override
  void onSuccess(data, code) {
    EasyLoader.hideLoader();
    if (data['status'] == 1) {
     Constants.isLoggedIn = true;

      var dataVal = data['data'];
      Constants.token = data['token'];
      
      print('successfully login');
      
    } else {
      print('error while login');
      ToastManager.errorToast('error fail');
    }

  }

  @override
  void onTokenExpire(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('token expired');
  }
}
