import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/FirstPage.dart';
import 'package:dailyreach/Models/FeedModel.dart';
import 'package:dailyreach/login_screen.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/utils/session_expired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:html/parser.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'Notification.dart';
import 'PostDetail.dart';
import 'main.dart';

class Feed extends StatefulWidget {
  @override
  State<Feed> createState() {
    return _Feed();
  }
}

class _Feed extends State<Feed> implements ApiInterface {
  // FeedData? feedData;
  List<FeedData> feedList = [];
  List<Banners> bannerList = [];
  NetworkUtil networkUtil = new NetworkUtil();
  int _index = 0;
  var htmlStr = "";

  @override
  void initState() {
    super.initState();
    getFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18, 47, 24, 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/daily.png",
                    width: 180,
                    height: 40,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                      builder: (context) => Login_screen()));
                        },
                        child: Text("Login",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(233, 182, 3, 3),
                              fontWeight: FontWeight.w600,
                              fontFamily: "assets/fonts/segui.TTf",
                            )),
                      ),
                      SizedBox(
                        width: 21.5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notefication()));
                        },
                        child: Image.asset(
                          "assets/images/bell.png",
                          width: 20,
                          height: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                
                
                itemCount: feedList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetail( 
                                bodyStr: feedList[index].body!, 
                                titleStr: feedList[index].title!,
                                dateStr: feedList[index].date!,
                                bannerImageArr: feedList[index].banners!,
                              )));
                    },
                    child: Column(
                      
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(18, 19, 24, 7),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              Constants.convertDateFormate(feedList[index].date!),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: "assets/fonts/segui.TTf",
                                  color: Colors.black),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(18, 7, 24, 7),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              feedList[index].title!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19,
                                  fontFamily: "assets/fonts/segui.TTf",
                                  color: Colors.black),
                            )),
                        

                        //New code
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 6),
                          width: MediaQuery.of(context).size.width,
                          child: SizedBox(
                              height: 200, // card height
                              child: PageView.builder(
                                  itemCount: feedList[index].banners!.length,
                                  controller:
                                      PageController(viewportFraction: 1),
                                  onPageChanged: (int index) =>
                                      setState(() => _index = index),
                                  itemBuilder: (_, i) {
                                    return Transform.scale(
                                      scale: i == _index ? 1 : 1,
                                      child: Card(
                                        child: Center(
                                            child:(feedList[index].banners!.length > 0)
                            ? CachedNetworkImage(
                                imageUrl: feedList[index].banners![i].banner!,
                                placeholder: (context, url) => SizedBox(
                                    height: 2.0,
                                    width: 2.0,
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                    fit: BoxFit.fitWidth,
                        
                            
                              ) :Image.asset(
                                "assets/images/feed.png",
                                height: 169,
                                fit: BoxFit.fill,
                              ), 

                                        )
                                      ),
                                    );
                                  })),
                        ),

                        Container(
                          
                            padding: EdgeInsets.fromLTRB(20, 7, 24, 0),
                            width: MediaQuery.of(context).size.width,
                            
                            child: Text(
                              Constants.parseHtmlString(feedList[index].body!),
                              maxLines: 5,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: "assets/fonts/segui.TTf",
                                  color: Colors.black,
                                  letterSpacing: 0.1,
                                  height: 1.5),
                            )),
                        Container(
                          height:50,
                          padding: EdgeInsets.fromLTRB(21, 0, 26, 7),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: feedList[index].categories!.length ,
                                itemBuilder: (context, index){ 
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                onTap: (){
                                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetail( 
                                bodyStr: feedList[index].body!, 
                                titleStr: feedList[index].title!,
                                dateStr: feedList[index].date!,
                                bannerImageArr: feedList[index].banners!,
                              )));
                                },
                                child: Container(
                                  // margin: EdgeInsets.all(2),
                                  
                                  width: 70,
                                  height: 20,
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        feedList[index].categoriesData![index].name!

                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                            color: Color.fromARGB(100, 214, 212, 212),                                                    borderRadius:
                                            BorderRadius.circular(34),
                                            )
                                ),
                                
                                );
                                }),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Read More",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(233, 182, 3, 3),
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 7,
                    color: AppColors.BackgroundColor,
                  );
                },
              ),
            )
          ],
        )
      );
  }




  Future<void> getFeeds() async {
   var token = "";
    Future<String> loginToken = SharedPreference.getStringValuesSF(Constants.token);
    loginToken.then(
        (value) => {
               token = value
            }, onError:(err) {
      print("Error occured :: $err");
    });

    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // FlashHelper.singleFlash(context, 'Check internet connection');
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      await networkUtil.getAuth(Constants.feedUrl, token, this);
    }
  }

  @override
  void onFailure(message, code) {
    // TODO: implement onFailure
    EasyLoader.hideLoader();
    ToastManager.errorToast('error');
    print('onFailure $message');
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void onSuccess(data, code) {
    // TODO: implement onSuccess
    EasyLoader.hideLoader();
    FeedModel feedModel = new FeedModel.fromJson(data);
    if (feedModel.status == 1) {
      feedList.addAll(feedModel.data!.data!);
      print(feedModel.data!.data!);
      

    }
    setState(() {});
  }

  @override
  void onTokenExpire(message, code) {
    ToastManager.errorToast('token expired');
    // TODO: implement onTokenExpire
    EasyLoader.hideLoader();
    if (this.mounted) {
      setState(() {});
    }
   
  }
}
