import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/become_member.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/Profile_Screen.dart';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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

     initPlatformState();
    _handlePromptForPushPermission();
    _handleSendNotification();
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

  void goToprofilePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Profile_screen(isfromLogin: true,)));
  }

  void goTologin(String videoStr) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  intro_video: videoStr,
                )));
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

  void getGeneralSettingsApi() async {
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
    var message = data['message'];

    if (data['status'] == 1) {
      var dataVal = data['data'];
      var videoStr = dataVal['intro_video'];
      var privacyStr = dataVal['privacy_policy'];
      var termsconditionStr = dataVal['terms'];
      SharedPreference.saveStringValue(Constants.videoStr, videoStr);
      SharedPreference.saveStringValue(Constants.privacyPolicyStr, privacyStr);
      SharedPreference.saveStringValue(
          Constants.termsconditionStr, termsconditionStr);

      print('successfully login');
      getLoginStatus(videoStr);
    } else {
      print('error while login');
      ToastManager.errorToast('$message');
    }
  }

  @override
  void onTokenExpire(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('Token expired');
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    // OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('NOTIFICATION OPENED HANDLER CALLED WITH: ${result}');
      this.setState(() {
        // _debugLabelString =
        //     "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print('FOREGROUND HANDLER CALLED WITH: ${event}');

      /// Display Notification, send null to not display
      event.complete(null);

    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      this.setState(() {
        // _debugLabelString =
        //     "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });


    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.setAppId("ab6953fd-aee4-4a8f-b73a-cabbf25db26c");

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    OneSignal.shared.disablePush(false);

    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    print("USER PROVIDED PRIVACY CONSENT: $userProvidedPrivacyConsent");
  }

  void _handlePromptForPushPermission() {
    print("Prompting for Permission");
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
  }

  void _handleSendNotification() async {
    var deviceState = await OneSignal.shared.getDeviceState();

    if (deviceState == null || deviceState.userId == null)
        return;

    var playerId = deviceState.userId!;
    print('playerId--------------- $playerId');
   

    // var notification = OSCreateNotification(
    //     playerIds: [playerId],
    //     content: "this is a test from OneSignal's Flutter SDK",
    //     heading: "Test Notification",
       
    //     buttons: [
    //       OSActionButton(text: "test1", id: "id1"),
    //       OSActionButton(text: "test2", id: "id2")
    //     ]);

    // var response = await OneSignal.shared.postNotification(notification);

    // this.setState(() {
    //   print("Sent notification with response: $response");
    //   // _debugLabelString = "Sent notification with response: $response";
    // });
  }
}
