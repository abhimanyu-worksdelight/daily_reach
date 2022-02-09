import 'package:flutter/material.dart';

import 'archive_screen.dart';

class Archive_list extends StatefulWidget {
  @override
  State<Archive_list> createState() {
    return _Archive_list();
  }
}

class _Archive_list extends State<Archive_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64, left: 93),
                child: Image.asset(
                  'assets/images/daily_reach_logo.png',
                  width: 190,
                  height: 42,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65, right: 24, left: 43),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> Archive_screen()));
                  },
                  child: Image.asset(
                    'assets/images/group.png',
                    height: 20,
                    width: 25,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 21, top: 12),
            child: Text(
              "Archived Posts",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 21, right: 19),
            child: Container(
              height: 40,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search by name, date',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView.separated(separatorBuilder: (Context, Index){
                return Container(
                  height: 1,
                  color: Colors.grey,
                );
              },

                  itemCount: 1,
                  itemBuilder: (BuildContext, Index) {
                    return GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 27, left: 21),
                                child: Image.asset(
                                  "assets/images/photoo.png",
                                  width: 119,
                                  height: 104,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20, left: 7, right: 0),
                                      child: Text(
                                        'Mon, 3 Jan, 2022',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, left: 7, right: 19),
                                      child: Text(
                                        'This post is a test post to ensure that things are working properly.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(top: 7, left: 13),
                                          child: Container(
                                              width: 44,
                                              height: 17,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  'Music',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: "segoe",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(34),
                                              )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 7, left: 6),
                                          child: Container(
                                              width: 44,
                                              height: 17,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  'Movie',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: "segoe",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(34.62),
                                              )),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 11, left: 7, right: 0),
                                      child: Text(
                                        'Read More',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 27, left: 21),
                                child: Image.asset(
                                  "assets/images/photoo.png",
                                  width: 119,
                                  height: 104,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20, left: 7, right: 0),
                                      child: Text(
                                        'Mon, 3 Jan, 2022',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, left: 7, right: 19),
                                      child: Text(
                                        'This post is a test post to ensure that things are working properly.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(top: 7, left: 13),
                                          child: Container(
                                              width: 44,
                                              height: 17,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  'Music',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: "segoe",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(34),
                                              )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 7, left: 6),
                                          child: Container(
                                              width: 44,
                                              height: 17,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  'Movie',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: "segoe",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(34.62),
                                              )),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 11, left: 7, right: 0),
                                      child: Text(
                                        'Read More',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 27, left: 21),
                                child: Image.asset(
                                  "assets/images/photoo.png",
                                  width: 119,
                                  height: 104,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20, left: 7, right: 0),
                                      child: Text(
                                        'Mon, 3 Jan, 2022',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, left: 7, right: 19),
                                      child: Text(
                                        'This post is a test post to ensure that things are working properly.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(top: 7, left: 13),
                                          child: Container(
                                              width: 44,
                                              height: 17,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  'Music',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: "segoe",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(34),
                                              )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 7, left: 6),
                                          child: Container(
                                              width: 44,
                                              height: 17,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  'Movie',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: "segoe",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(34.62),
                                              )),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 11, left: 7, right: 0),
                                      child: Text(
                                        'Read More',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 27, left: 21),
                                child: Image.asset(
                                  "assets/images/photoo.png",
                                  width: 119,
                                  height: 104,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20, left: 7, right: 0),
                                      child: Text(
                                        'Mon, 3 Jan, 2022',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, left: 7, right: 19),
                                      child: Text(
                                        'This post is a test post to ensure that things are working properly.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(top: 7, left: 13),
                                          child: Container(
                                              width: 44,
                                              height: 17,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  'Music',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: "segoe",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(34),
                                              )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 7, left: 6),
                                          child: Container(
                                              width: 44,
                                              height: 17,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text(
                                                  'Movie',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: "segoe",
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.circular(34.62),
                                              )),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 11, left: 7, right: 0),
                                      child: Text(
                                        'Read More',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    );
                  }
              )
          ),
        ],
      ),
    );
  }
}
