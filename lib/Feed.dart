import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Feed extends StatefulWidget {
  @override
  State<Feed> createState() {
    return _Feed();
  }
}

class _Feed extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
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
                  Text("Login",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(233, 182, 3, 3),
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/bell.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.separated(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Monday, Jan 10, 2022",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: "assets/fonts/segui.TTf",
                            color: Colors.black),
                      )),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Custom excerpt",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            fontFamily: "assets/fonts/segui.TTf",
                            color: Colors.black),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/feed.png",
                          height: 169,
                          fit: BoxFit.fill,
                        ),
                        index == 1
                            ? Positioned(
                                top: 1,
                                bottom: 1,
                                left: 1,
                                right: 1,
                                child: Icon(
                                  Icons.play_circle_fill,
                                  size: 80,
                                  color: Colors.grey.withOpacity(0.7),
                                ))
                            : Container()
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "This is a custom excerpt. This post is a test post to ensure that things are working properly."
                        " I am adding more text to see if a longer excerpt is acceptable when it is published. It is rainy today, and cold.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: "assets/fonts/segui.TTf",
                            color: Colors.black,
                            letterSpacing: 0.5,
                            height: 2),
                      )),
                  Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Row(
                          children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              "Music",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  fontFamily: "assets/fonts/segui.TTf",
                                  color: Colors.black),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(34.62),
                              // boxShadow: [
                              // BoxShadow(
                              //   color: Colors.black12,
                              //   spreadRadius: 2.0,
                              //   blurRadius: 2.0,
                              //   offset: Offset.fromDirection(
                              //     1.0,
                              //   ),
                              // ),
                              //  ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              "Movie",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  fontFamily: "assets/fonts/segui.TTf",
                                  color: Colors.black),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(34.62),
                              // boxShadow: [
                              // BoxShadow(
                              //   color: Colors.black12,
                              //   spreadRadius: 2.0,
                              //   blurRadius: 2.0,
                              //   offset: Offset.fromDirection(
                              //     1.0,
                              //   ),
                              // ),
                              //  ],
                            ),
                          ) ,

                          ]),
              Padding(padding:EdgeInsets.all(16),
              child:
              Row( mainAxisAlignment: MainAxisAlignment.end,
              children: [ Text("Read More",
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
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.grey,
              );
            },
          ),
        )
      ],
    ));
  }
}
