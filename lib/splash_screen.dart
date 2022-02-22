import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/become_member.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/profile_screen.dart';
import 'package:dailyreach/utils/flash_Helper.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() {
    return _Splash_screen();
  }
}

class _Splash_screen extends State<Splash_screen> implements ApiInterface {

bool isLoggedIn = false;
NetworkUtil networkUtil = new NetworkUtil();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {

      getGeneralSettingsApi();
      
    });
  }

  void getLoginStatus(String video) {
    print("getLoginStatus :: ");
    Future<bool> status =
        SharedPreference.getLoginStatus(Constants.loginStatus);
    status.then(
        (value) => {
              isLoggedIn = value,
              print("Splash value ::: $value"),
              Constants.isLoggedIn = value,
             (isLoggedIn == true) ? goToprofilePage() : goTologin(video)
            }, onError: (err) {
      print("Error occured :: $err");
    });
  }

  void goToprofilePage(){
    
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Profile_screen()));
    
  }

  void goTologin(String videoStr){
    Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage(intro_video: videoStr ,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/subtract.png',
                  width: 105,
                  height: 168,
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
            Center(
              child: Image.asset(
                'assets/images/daily_reach_logo.png',
                width: 247,
                height: 55,
              ),
            ),
          ],
        ));
  }

  void getGeneralSettingsApi() async{

    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      FlashHelper.singleFlash(context, 'Check internet connection');
    } else {
      EasyLoader.showLoader();
      await networkUtil.get(Constants.generalSettingsUrl, this);
    }

  }

  @override
  void onFailure(message, code) {
    EasyLoader.hideLoader();
    
  }

  @override
  void onSuccess(data, code) {
    EasyLoader.hideLoader();
    if (data['status'] == 1) {
      var dataVal = data['data'];
      var videoStr = dataVal['intro_video'];
      var privacyStr = dataVal['privacy_policy'];
      var termsconditionStr = dataVal['terms'];
      SharedPreference.saveStringValue(Constants.videoStr, videoStr);
      SharedPreference.saveStringValue(Constants.privacyPolicyStr,privacyStr);
      SharedPreference.saveStringValue(Constants.termsconditionStr,termsconditionStr);

      print('successfully login');
      getLoginStatus(videoStr);
      
    } else {
      print('error while login');
    }

  }

  @override
  void onTokenExpire(message, code) {
    EasyLoader.hideLoader();
  }
}
