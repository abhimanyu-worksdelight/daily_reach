import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'archive_screen.dart';
import 'home_screen.dart';

class Profile_screen extends StatefulWidget {
  @override
  State<Profile_screen> createState() {
    return _Profile_screen();
  }
}

class _Profile_screen extends State<Profile_screen> {
  int tabClick=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:tabClick==0?Container():tabClick==1?new Archive_screen():Home_screen(),
      bottomNavigationBar:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:  Colors.white,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        onTap: (value) {
          if(value==0){
            tabClick=value;

          }else if(value==1){
            tabClick=value;

          }else{
            tabClick=value;

          }
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Feed'),
            icon: Icon(Icons.now_widgets_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Archive'),
            icon: Icon(Icons.archive_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person_outlined,),
          ),
        ],
      ),
    );
  }
}
