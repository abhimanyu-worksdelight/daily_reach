import 'package:flutter/material.dart';

import 'main_Feed.dart';
import 'archive_list.dart';
import 'Home_Screen.dart';

class Profile_screen extends StatefulWidget {
  @override
  State<Profile_screen> createState() {
    return _Profile_screen();
  }
}

class _Profile_screen extends State<Profile_screen> {
  int tabClick = 0;
  var selectedFeed = true;
  var selectedArchieve = false;
  var selectedUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabClick == 0
          ? Feed()
          : tabClick == 1
              ? Archive_list()
              : Home_screen(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 40,
        currentIndex: tabClick,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        onTap: (value) {
          if (value == 0) {
            tabClick = value;
            selectedFeed = true;
            selectedArchieve = false;
            selectedUser = false;
          } else if (value == 1) {
            tabClick = value;
            selectedFeed = false;
            selectedArchieve = true;
            selectedUser = false;
          } else {
            tabClick = value;
            selectedUser = true;
            selectedArchieve = false;
            selectedFeed = false;
          }
          setState(() {});
        },
        items:  [
          BottomNavigationBarItem(
            label: "Feed",
            icon: Padding(
              padding: EdgeInsets.only(top:16.0,bottom: 8),
              // child: Icon(Icons.now_widgets_outlined),
              child: Image.asset("assets/images/grid.png",height: 24,width: 24,color: (selectedFeed == true) ? Colors.red:Colors.grey,),
            ),
          ),
          BottomNavigationBarItem(
            label: "Archive",
            icon: Padding(
              padding: EdgeInsets.only(top:16.0,bottom: 8),
              // child: Icon(Icons.archive_outlined),
              child: Image.asset("assets/images/archive.png",height: 24,width: 24,color: (selectedArchieve == true) ? Colors.red:Colors.grey,),
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Padding(
              padding: EdgeInsets.only(top:16.0,bottom: 8),
              // child: Icon(
              //   Icons.person_outlined,
              // ),
              child: Image.asset("assets/images/user.png",height: 24,width: 24,color: (selectedUser == true) ? Colors.red:Colors.grey,),
            ),
          ),
        ],
      ),
    );
  }
}
