import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/Edit_Profile.dart';
import 'package:dailyreach/Models/Notification_Count_Model.dart';
import 'package:dailyreach/login_screen.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  PickedFile? imageFile = null;
  var filePath = "";
  bool isLoggedIn = false;
  var notificationCount = 0;
  int apiType = rqCount;

  @override
  void initState() {
    super.initState();
    getToken();
    getLoginStatus();
    getNotificationCount();
  }

  void getLoginStatus() {
    print("getLoginStatus :: ");
    Future<bool> status =
        SharedPreference.getLoginStatus(Constants.loginStatus);
    status.then(
        (value) => {
              isLoggedIn = value,
              print("Splash value ::: $value"),
              Constants.isLoggedIn = value,
            }, onError: (err) {
      print("Error occured :: $err");
    });
  }

  getToken() {
    Future<String> loginToken =
        SharedPreference.getStringValuesSF(Constants.token);
    loginToken.then((value) => {Constants.tokenStr = value}, onError: (err) {
      print("Error occured :: $err");
    });

    Future<String> name =
        SharedPreference.getStringValuesSF(Constants.firstName);
    name.then((value) => {Constants.nameStr = value}, onError: (err) {
      print("Error occured :: $err");
    });

    Future<String> email = SharedPreference.getStringValuesSF(Constants.email);
    email.then((value) => {Constants.emailStr = value}, onError: (err) {
      print("Error occured :: $err");
    });

    Future<String> phone =
        SharedPreference.getStringValuesSF(Constants.phoneNumber);
    phone.then((value) => {Constants.phoneStr = value, setState(() {})},
        onError: (err) {
      print("Error occured :: $err");
    });
  }

  @override
  Widget build(BuildContext context) {
    return showProfileUI(context);
  }

  showProfileUI(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 130),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    // _showPicker(context);
                  },
                  child: (isLoggedIn == true)
                      ? Container(
                          alignment: Alignment.center,
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.ImageBackColor),
                          child: (filePath == "")
                              ? Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Image.asset(
                                    'assets/images/camera.png',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                    color: AppColors.CameraIconColor,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: CachedNetworkImage(
                                    imageUrl: filePath,
                                    height: 160,
                                    width: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ))
                      : Container(),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 64, left: 23),
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
                  onTap: () {
                    if (isLoggedIn == true){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notefication()));

                    }
                    else{
                      _getSupportPopUI();
                    }
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 64, left: 230, right: 23),
                        child: Image.asset(
                          'assets/images/bell.png',
                          width: 22,
                          height: 22,
                        ),
                      ),
                      Padding(
                              padding: const EdgeInsets.only(right: 0,left: 248,top: 64),
                              child: Container(
                                width: 15,
                                height: 15,
                                // color: Colors.red,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(child: Text('$notificationCount',style: TextStyle(color: Colors.white,fontSize:9,)),),
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                   (isLoggedIn == true)? Constants.nameStr: '',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "segoe",
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    (isLoggedIn == true)?Constants.emailStr:'',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "segoe",
                      color: AppColors.phoneTextColor,
                    ),
                  )),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 95),
                    child: Image.asset(
                      'assets/images/flag.png',
                      height: (isLoggedIn == true) ? 19 : 0,
                      width: (isLoggedIn == true) ? 19 : 0,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 3),
                      child: Text(
                        (isLoggedIn == true) ? '+1' : '',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: "segoe",
                          color: AppColors.phoneTextColor,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 8),
                      child: Text(
                        (isLoggedIn == true)?Constants.phoneStr:'',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: "segoe",
                          color: AppColors.phoneTextColor,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: InkWell(
            highlightColor: Color.fromRGBO(0, 0, 0, 0),
            onTap: () async {
              if (isLoggedIn == false) {
                _getSupportPopUI();
              } else {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfile(
                              name: Constants.nameStr,
                              email: Constants.emailStr,
                              phone: Constants.phoneStr,
                            )));
                if (result != null) {
                  Constants.nameStr = result['name'];
                  Constants.emailStr = result['email'];
                  Constants.phoneStr = result['phone'];
                  filePath = result['photo'];

                  // imageFile = result['photo'];
                  setState(() {});
                }
              }
            },
            child: Container(
                width: 149,
                height: 50,
                child: Center(
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
                    color: AppColors.editBackColor,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 3.0,
                          spreadRadius: 1.0)
                    ])),
          ),
        ),
        Spacer(),
       (isLoggedIn == true) ? InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
           
              logoutApi();
            
          },
          
          child: (isLoggedIn == true)? Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.phoneTextColor,
                  fontFamily: "segoe",
                  fontWeight: FontWeight.w600),
            ),
          ):Container()
        ): Container()
      ]),
    );
  }

  _getSupportPopUI() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SizedBox(height: 30),
                // Image.asset('assets/images/daily_reach_logo.png',
                //     height: 45, width: 45),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "You have to login first!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'segoe'),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 145,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_screen(
                                      isfromSignup: true,
                                    )),
                            ModalRoute.withName('/'),
                          );
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'segoe'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 145,
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'segoe'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }

  void logoutApi() async {
    apiType = rqLogout;
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      await _networkUtil.getAuth(Constants.logoutUrl, Constants.tokenStr, this);
    }
  }

  Future<void> getNotificationCount() async{
    apiType = rqCount;
    var token = "";
    Future<String> loginToken =
        SharedPreference.getStringValuesSF(Constants.token);
    loginToken.then((value) => {token = value}, onError: (err) {
      print("Error occured :: $err");
    });

    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // FlashHelper.singleFlash(context, 'Check internet connection');
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      await _networkUtil.getAuth(
          Constants.notificationCountUrl, token, this);
    }
  }

  @override
  void onFailure(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('error');
  }

  @override
  void onSuccess(data, code) {
    // ToastManager.successToast('success');
    EasyLoader.hideLoader();
    switch (apiType){
      case rqLogout:{
    var message = data['message'];
    if (data['status'] == 1) {
      print('successfully logout');
      SharedPreference.saveBooleanValue(Constants.loginStatus, false);
      SharedPreference.saveStringValue(Constants.token, '');

      Future<String> status =
          SharedPreference.getStringValuesSF(Constants.videoStr);
      status.then(
          (value) => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              intro_video: value,
                            )), ModalRoute.withName('/')
                            )
              }, onError: (err) {
        print("Error occured :: $err");
      });
    } else {
      ToastManager.errorToast('$message');
    }
      }
      break;
      case rqCount:{
         NotificationCount notificationCountm = new NotificationCount.fromJson(data);
    var message = notificationCountm.message;
    if (notificationCountm.status == 1) {
      notificationCount = notificationCountm.data!;
    } else {
      ToastManager.errorToast('$message');
    }
    setState(() {});
      }
    }

  }

  @override
  void onTokenExpire(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('token expired');
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    print('imageGallery--------------${File(imageFile!.path)}');

    // Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    print('imageFromCamera--------------${File(imageFile!.path)}');
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _openGallery(context);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

const int rqLogout = 0;
const int rqCount = 1;
