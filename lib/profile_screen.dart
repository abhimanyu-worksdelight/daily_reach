import 'package:flutter/material.dart';

import 'main_Feed.dart';
import 'archive_list.dart';
import 'profile_name.dart';

class Profile_screen extends StatefulWidget {
  @override
  State<Profile_screen> createState() {
    return _Profile_screen();
  }
}

class _Profile_screen extends State<Profile_screen> {
  int tabClick = 0;

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
          } else if (value == 1) {
            tabClick = value;
          } else {
            tabClick = value;
          }
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            label: "Feed",
            icon: Icon(Icons.now_widgets_outlined),
          ),
          BottomNavigationBarItem(
            label: "Archive",
            icon: Icon(Icons.archive_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
