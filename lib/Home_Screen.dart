import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/Edit_Profile.dart';
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

  @override
  void initState() {
    super.initState();
    getToken();
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
                  child: Container(
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
                                imageUrl:
                                    filePath,
                                height: 160,
                                width: 160,
                                fit: BoxFit.cover,
                              ),
                            )),
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
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => Notefication()));
                //   },
                //   child: Padding(
                //     padding: EdgeInsets.only(top: 64, left: 230, right: 23),
                //     child: Image.asset(
                //       'assets/images/bell.png',
                //       width: 18,
                //       height: 18,
                //     ),
                //   ),
                // )
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
                    Constants.nameStr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "segoe",
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    Constants.emailStr,
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
                      height: 19,
                      width: 19,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 3),
                      child: Text(
                        '+1',
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
                        Constants.phoneStr,
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
            highlightColor: Colors.transparent,
            onTap: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile(
                          name: Constants.nameStr,
                          email: Constants.emailStr,
                          phone: Constants.phoneStr,)));
              if (result != null) {
                Constants.nameStr = result['name'];
                Constants.emailStr = result['email'];
                Constants.phoneStr = result['phone'];
                filePath = result['photo'];
                
                // imageFile = result['photo'];
                setState(() {});
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
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            logoutApi();
          },
          child: Padding(
            padding: EdgeInsets.only(top: 200, bottom: 20),
            child: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.phoneTextColor,
                  fontFamily: "segoe",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ]),
    );
  }

  void logoutApi() async {
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
    // ToastManager.successToast('success');
    EasyLoader.hideLoader();
    var message = data['message'];
    if (data['status'] == 1) {
      print('successfully logout');
      SharedPreference.saveBooleanValue(Constants.loginStatus, false);
      SharedPreference.saveStringValue(Constants.token, '');

      Future<String> status =
          SharedPreference.getStringValuesSF(Constants.videoStr);
      status.then(
          (value) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              intro_video: value,
                            )))
              }, onError: (err) {
        print("Error occured :: $err");
      });
    } else {
      ToastManager.errorToast('$message');
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
