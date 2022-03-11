import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/Models/Post_Detail_Model.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'main_Feed.dart';
import 'FirstPage.dart';

class PostDetail extends StatefulWidget {
  
  int id = 0;

  PostDetail({required this.id});

  @override
  _PostDetail createState() => _PostDetail();
}

class _PostDetail extends State<PostDetail> implements ApiInterface {
  int _index = 0;

  PostDetailData? postDetail;
  NetworkUtil networkUtil = new NetworkUtil();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: (postDetail != null)? Column(
          
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 6),
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                      height: 200, // card height
                      child: PageView.builder(
                          itemCount: postDetail!.banners!.length,
                          controller: PageController(viewportFraction: 1),
                          onPageChanged: (int index) =>
                              setState(() => _index = index),
                          itemBuilder: (_, i) {
                            return Transform.scale(
                              scale: i == _index ? 1 : 1,
                              child: Card(
                                  child: Center(
                                  
                                child:
                                (postDetail!.banners![i].type == "jpg" ||
                                                      postDetail!.banners![i].type ==
                                                          "png" ||
                                                      postDetail!.banners![i].type ==
                                                          "jpeg" ||
                                                      postDetail!.banners![i].type ==
                                                          "gif") ?
                                
                                
                                
                                 (postDetail!.banners!.length > 0)
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            postDetail!.banners![i].banner!,
                                        height: 200,
                                        // width: MediaQuery.of(context).size.width,
                                        placeholder: (context, url) => Container(
                                            height: 2.0,
                                            width: 2.0,
                                            child: Image.asset(
                                                'assets/images/daily_reach_logo.png')),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        fit: BoxFit.fitWidth,
                                      )
                                    : Image.asset(
                                        "assets/images/feed.png",
                                        height: 169,
                                        fit: BoxFit.fill,
                                      ):VideoItem(postDetail!.banners![i].banner!,false)
                              )
                              ),
                            );
                          })),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 50, left: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/images/arrowvector.png",
                              color: Colors.black,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          // ),
                        ])),
              ],
            ),
            Container(
                padding: EdgeInsets.fromLTRB(21, 27, 16, 0),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  Constants.convertDateFormate(postDetail!.date!),
                  // "Monday, Jan 10, 2022",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      fontFamily: "assets/fonts/segui.TTf",
                      color: Colors.black),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(21, 8, 16, 0),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  postDetail!.title!,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      fontFamily: "assets/fonts/segui.TTf",
                      color: Colors.black),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(23, 8, 16, 0),
              width: MediaQuery.of(context).size.width,
              child: Text(
                Constants.parseHtmlString(postDetail!.body!),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: "assets/fonts/segui.TTf",
                    color: Colors.black,
                    letterSpacing: 0.1,
                    height: 1.4),
              ),
            ),
          ],
        ): Center(child: CircularProgressIndicator(strokeWidth: 2,color: AppColors.WelcomeTextColor,) ,)
      ),
    );
  }


  Future<void> getPostDetail() async {
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
          Constants.postDetailUrl + '/${widget.id}', token, this);
    }
  }

  @override
  void onFailure(message, code) {
    ToastManager.errorToast('error');
  }

  @override
  void onSuccess(data, code) {
    EasyLoader.hideLoader();
    PostDetailModel postModel = new PostDetailModel.fromJson(data);
    var message = postModel.message;
    

    if (postModel.status == 1) {
      print('success feed');
      postDetail = postModel.data!;
    } else {
      ToastManager.errorToast('$message');
    }
    setState(() {});
  }

  @override
  void onTokenExpire(message, code) {
    ToastManager.errorToast('token expired');
  }




}
