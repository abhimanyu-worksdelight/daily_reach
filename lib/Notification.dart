import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/Models/Notification_Model.dart';
import 'package:dailyreach/PostDetail.dart';
import 'package:dailyreach/SplashScreen.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:flutter/material.dart';

import 'FirstPage.dart';

class Notefication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Notefication();
  }
}

class _Notefication extends State<StatefulWidget> implements ApiInterface {

 List<NotificationData> notificationList = [];
 NetworkUtil networkUtil = new NetworkUtil();
  var apiType = rqgetnotification;

 @override
 void initState() {
    // TODO: implement initState
    super.initState();
    getNotificationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(25,50, 7, 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                  onTap: () {
                     Navigator.pop(context);
                  },
                  // child:  GestureDetector(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                    child:Image.asset(
                    "assets/images/arrowvector.png",
                    width: 24,
                    height: 24,
                  ),
               // ),
                ),
                SizedBox(
                  width: 18,
                )
              ]),
              // Padding(
              // padding: EdgeInsets.only(right: .201),
              //child:
              Text(
                "Notificatons",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "assets/fonts/segui.TTf",
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (notificationList[index].is_read == 0){
                      getNotificationRead(notificationList[index].id!);
                    }
                    if (notificationList[index].type == "Post"){
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostDetail(
                                  id: int.parse(notificationList[index].postId!),
                                    )));
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding:EdgeInsets.fromLTRB(25,15,14,18),
                           child:Container(
                             decoration:  BoxDecoration(
                                 border:Border.all(color: Color.fromARGB(100, 214, 212, 212,),),
                                   borderRadius: BorderRadius.all(Radius.circular(10)),),
                             child:
                           Image.asset(
                              "assets/images/Handprint.png",
                              height: 42.79,
                              width: 42.79,
                            ),
                           ),
                          ),
                          Flexible(
                            child: Column(mainAxisSize: MainAxisSize.min,
                              children: [  Container(
                                  padding: EdgeInsets.fromLTRB(0,23,16,0),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[ Text(notificationList[index].title!
                                     , style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontFamily: "assets/fonts/segui.TTf",
                                          color: Colors.black,
                                        //  letterSpacing: 0.1,
                                       //   height:1.5),
                                    )),
                                      Text("2 days",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11,
                                          fontFamily: "assets/fonts/segui.TTf",
                                        color: Color.fromARGB(
                                            100, 185, 191, 214),
                                      ),)
                ]
                                  ),
                              ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0,9,12,9),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(Constants.parseHtmlString(notificationList[index].description!)
                                      , overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        fontFamily: "assets/fonts/segui.TTf",
                                        color: Colors.black,
                                         letterSpacing: 0.1,
                                          height:1.5),
                                      )),
                       Container(height: 0.5,width: 360,
                color: Color.fromARGB(100, 214, 212, 212),)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },


            ))
      ],
    ));
  }


  Future<void> getNotificationList() async {
    apiType = rqgetnotification;
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
      await networkUtil.getAuth(
          Constants.notificationUrl, token, this);
    }
  }


  Future<void> getNotificationRead(int notificationId) async {
    apiType = rqreadNotification;
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
      await networkUtil.postHeaderAuth(
          Constants.notificationReadUrl+'?notification_id=$notificationId', token, this,);
    }
  }

  

  @override
  void onFailure(message, code) {
    ToastManager.errorToast('error');
  }

  @override
  void onSuccess(data, code) {
    EasyLoader.hideLoader();
    switch (apiType){

    case rqgetnotification:{
    NotificationModel notificationModel = new NotificationModel.fromJson(data);
    var message = notificationModel.message;
    

    if (notificationModel.status == 1) {
      print('success feed');
      notificationList.addAll(notificationModel.data!);
    } else {
      ToastManager.errorToast('$message');
    }
    setState(() {});
    }
    break;

    case rqgetnotification:{
       EasyLoader.hideLoader();
       
    }
    }
  }

  @override
  void onTokenExpire(message, code) {
    ToastManager.errorToast('token expired');
  }
}

const int rqgetnotification = 0;
const int rqreadNotification = 1;
