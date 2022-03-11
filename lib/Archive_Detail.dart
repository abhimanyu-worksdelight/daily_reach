import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyreach/Models/ArchiveModel.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/video_widget.dart';
import 'package:flutter/material.dart';

class ArchiveDetail extends StatefulWidget {
  String? bodyStr;
  String? archiveBody;
  String? titleStr;
  String? dateStr;
  List<Banners> bannerImageArr;

  ArchiveDetail({
    required this.titleStr,
    required this.bodyStr,
    required this.dateStr,
    required this.bannerImageArr,
  });

  @override
  _ArchiveDetail createState() => _ArchiveDetail();
}

class _ArchiveDetail extends State<ArchiveDetail> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                                child: (widget.bannerImageArr[i].type == "jpg" ||
                                                      widget.bannerImageArr[i].type ==
                                                          "png" ||
                                                      widget.bannerImageArr[i].type ==
                                                          "jpeg" ||
                                                      widget.bannerImageArr[i].type ==
                                                          "gif") ?
                                
                                
                                
                                (widget.bannerImageArr.length > 0)
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            widget.bannerImageArr[i].banner!,
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
                                      ): VideoItem(widget.bannerImageArr[i].banner!,false)
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
                              width: 44,
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
                  Constants.convertDateFormate(widget.dateStr!),
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
                  widget.titleStr!,
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
                Constants.parseHtmlString(widget.bodyStr!),
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
        ),
      ),
    );
  }
}
