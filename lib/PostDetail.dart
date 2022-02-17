import 'package:flutter/material.dart';

import 'main_Feed.dart';
import 'FirstPage.dart';
import 'SplashScreen.dart';
class PostDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _PostDetail();
  }

}
class _PostDetail extends   State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
      Stack(
          children: [ Container(
          child:(Image.asset("assets/images/daily2.png" )

          ),

    ),
            Padding(
                padding: EdgeInsets.fromLTRB(21,40, 7, 23),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  GestureDetector(
                    onTap: () {
                     Navigator.pop(context);
                    },

                      child:Image.asset(
                        "assets/images/arrowvector.png",color: Colors.white,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  // ),
                ]
                )
            ),

          ]),

Expanded(child:
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) { return GestureDetector(onTap: (){

              },
                child:

                  Column(mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(21,27, 16,0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Text(
                            "Monday, Jan 10, 2022",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                fontFamily: "assets/fonts/segui.TTf",
                                color: Colors.black),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(21,8, 16,0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Text(
                            "Unfold the newest aspects.",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                fontFamily: "assets/fonts/segui.TTf",
                                color: Colors.black),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(23,8, 16,0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: const Text(
                            "This post will set the tone for the entire next week."
                                " Parts 1-9 will unfold the newest aspects of our study."
                                " Stay tuned. 1 We will be posting on Patreon and You Tube. Patreon is for supporters, "
                                "and includes exclusive content and behind-the-scenes videos. In a few weeks, "
                                "Jordan will be releasing her first album single,"
                                "We are waiting for a gallery showing date for November as well. Many things going on here,"
                                " including the re-launching of our newsletter and research papers on Aramaic that relate to the world in 2021 and 2022.",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                fontFamily: "assets/fonts/segui.TTf",
                                color: Colors.black,
                            letterSpacing: 0.1,
                                 height:1.4),
                                ),
                          ),Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Padding(padding:EdgeInsets.fromLTRB(23,30,0,0),
              child: Image.asset(
              "assets/images/post.png",
              height: 95.1,
                width: 134,
              ),



              ),
              Flexible(child:
              Column(mainAxisSize: MainAxisSize.min,
              children: [  Container(
              padding: EdgeInsets.fromLTRB(16,35,0,0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:const [ Text("Song Release Coming \nSoon!"
              , style: TextStyle(
              overflow: TextOverflow.ellipsis,

              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: "assets/fonts/segui.TTf",
                    color: Color.fromARGB(233, 182, 3, 3),
                //  letterSpacing: 0.1,
                //   height:1.5),
                )),

                ]
                ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16,8,0,20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [ Text("Jordan’s First Single – Release"
                          , style: TextStyle( overflow: TextOverflow.ellipsis,

                          fontWeight: FontWeight.w600,
                            fontSize: 11,
                            fontFamily: "assets/fonts/segui.TTf",
                            color: Colors.black,
                            //  letterSpacing: 0.1,
                            //   height:1.5),
                          )),

                      ]
                  ),
                ),

                ],
                ),
              ),
                ],
                )
                ],
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(21,8, 16,0),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Text(
                            "This post will set the tone for the entire next week."
                                " Parts 1-9 will unfold the newest aspects of our study."
                                " Stay tuned. 1 We will be posting on Patreon and You Tube. Patreon is for supporters, "
                                "and includes exclusive content and behind-the-scenes videos. In a few weeks, "
                                "Jordan will be releasing her first album single,"
                            "We are waiting for a gallery showing date for November as well. Many things going on here,"
                            " including the re-launching of our newsletter and research papers on Aramaic that relate to the world in 2021 and 2022.",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.1,
                                height:1.5,
                                fontSize:13,
                                fontFamily: "assets/fonts/segui.TTf",
                                color: Colors.black),
                          )),


                    ],
                  )
                  );

              },
            ),
),
Container(height: 20,

)
              ],
            ),


    );


  }

}