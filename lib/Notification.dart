import 'package:flutter/material.dart';

import 'FirstPage.dart';

class Notefication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Notefication();
  }
}

class _Notefication extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 229, 229, 229),

        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(31, 67, 7, 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen()));
                  },
                  child:  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:Image.asset(
                    "assets/images/arrowvector.png",
                    width: 24,
                    height: 24,
                  ),
                ),
                ),
                SizedBox(
                  width: 21,
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstPage()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding:EdgeInsets.fromLTRB(25,15,14,18),
                           child: Image.asset(
                              "assets/images/Handprint.png",
                              height: 42.79,
                              width: 42.79,
                            ),
                          ),
                          Flexible(
                            child: Column(mainAxisSize: MainAxisSize.min,
                              children: [  Container(
                                  padding: EdgeInsets.fromLTRB(0,15,16,0),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:const [ Text("Some New Post Added "
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
                                  padding: EdgeInsets.fromLTRB(0,9,16,9),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text("4 new posts are available for you, click here to read out"
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
}
