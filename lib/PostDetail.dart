import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyreach/Models/FeedModel.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:flutter/material.dart';

import 'main_Feed.dart';
import 'FirstPage.dart';
import 'SplashScreen.dart';

class PostDetail extends StatefulWidget {
  String bodyStr;
  String titleStr;
  String dateStr;
  List<Banners> bannerImageArr;

  PostDetail({
    required this.titleStr,
    required this.bodyStr,
    required this.dateStr,
    required this.bannerImageArr,
  });

  @override
  _PostDetail createState() => _PostDetail();
}

class _PostDetail extends State<PostDetail> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        itemCount: widget.bannerImageArr.length,
                        controller: PageController(viewportFraction: 1),
                        onPageChanged: (int index) =>
                            setState(() => _index = index),
                        itemBuilder: (_, i) {
                          return Transform.scale(
                            scale: i == _index ? 1 : 1,
                            child: Card(
                                child: Center(
                              child: (widget.bannerImageArr.length > 0)
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          widget.bannerImageArr[i].banner!,
                                      height: 200,
                                      // width: MediaQuery.of(context).size.width,
                                      placeholder: (context, url) => Container(
                                          height: 2.0,
                                          width: 2.0,
                                          child: Image.asset('assets/images/daily_reach_logo.png')
                                          ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.fitWidth,
                                    )
                                  : Image.asset(
                                      "assets/images/feed.png",
                                      height: 169,
                                      fit: BoxFit.fill,
                                    ),
                            )),
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
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(21, 27, 16, 0),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              Constants.convertDateFormate(widget.dateStr),
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
                              widget.titleStr,
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
                            Constants.parseHtmlString(widget.bodyStr),
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
                    ));
              },
            ),
          ),
          Container(
            height: 20,
          )
        ],
      ),
    );
  }
}
