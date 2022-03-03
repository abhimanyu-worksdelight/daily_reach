import 'package:dailyreach/Profile_Screen.dart';
import 'package:dailyreach/main_Feed.dart';
import 'package:dailyreach/Notification.dart';
import 'package:dailyreach/PostDetail.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:video_player/video_player.dart';
import 'become_member.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Splash_screen(),
      builder: EasyLoading.init(),
    );
  }
}

class HomePage extends StatefulWidget {
  

  String intro_video;

  HomePage({
    required this.intro_video,
  });

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  TargetPlatform? _platform;
  VideoPlayerController? _videoPlayerController1;
  ChewieController? _chewieController;
  bool isInit= true;
  @override
  void initState() {
    _videoPlayerController1 = VideoPlayerController.network(
        widget.intro_video);
   
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1!,
      autoPlay: true,
      looping: true,
      aspectRatio: _videoPlayerController1!.value.aspectRatio,
      showControls: false,
    );
// _chewieController!.showControls =false;

    _videoPlayerController1?.addListener(() {
      if (_videoPlayerController1?.value.position ==
          _videoPlayerController1?.value.duration) {
        print('video Ended');
      }
    });
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    // _videoPlayerController1?.dispose();
    // _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, children: [
            Stack(
              children: [
                Container(
                  height: 414,
                  width: MediaQuery.of(context).size.width,
                  
                  child: (_videoPlayerController1 != null)?
                  AspectRatio(
                    aspectRatio: _videoPlayerController1!.value.aspectRatio,
                    child: Chewie(
                      controller: _chewieController!,

                    ),
                  ):Container(),
                ),
                Center(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 180 ),
                      child: Icon(
                        isInit ?Icons.pause: Icons.play_arrow  ,
                        color: Colors.grey,
                        size: 60,
                      ),
                    ),
                    onTap: () {
                       if (_videoPlayerController1 != null){
                      setState(() {
                       isInit =!isInit;
                        _videoPlayerController1!.value.isPlaying
                            ? _videoPlayerController1!.pause() 
                            : _videoPlayerController1!.play();
                      });
                       }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 276),
                  child: Image(
                    height: 142.0,
                    width:MediaQuery.of(context).size.width,
                    image: AssetImage(
                      'assets/images/blur.png',
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text(
                'Welcome to',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontFamily: "segoe"),
              ),
            ),
            Center(
              child: Image.asset('assets/images/daily_reach_logo.png',
                  height: 40, width: 180),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 9, left: 32, right: 33),
              child: Text(
                'Become a member to access exclusive content',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: "segoe"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 9, right: 24, left: 26, bottom: 0),
              child: Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "segoe",
                    fontWeight: FontWeight.w400),
              ),
            ),
            GestureDetector(
              onTap: () {
                // _videoPlayerController1 = null;
                // _chewieController =null;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Become_member()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 22, right: 24, left: 24),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      color: AppColors.buttonBackColor,
                      borderRadius:const BorderRadius.all(Radius.circular(8))),
                  child: Center(
                    child: Text(
                      'Become a Member',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: "segoe",color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Constants.isLoggedIn = false;
                SharedPreference.saveBooleanValue(Constants.loginStatus, false);
                // Navigator.push(context, MaterialPageRoute(
                // builder: (context) => Profile_screen(isfromLogin: false,)));

                _videoPlayerController1 = null;
                _chewieController =null;

                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(builder: (BuildContext context) => Profile_screen(isfromLogin: false,)),
                  ModalRoute.withName('/'),
                );
              }  ,

              child: Padding(padding: const EdgeInsets.only(top: 22, right: 24, left: 24),
                child: Container(
                  height: 30,
                  width: 350,
                  
                  child: Center(
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: "segoe",color: AppColors.editBackColor),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 0, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Already a member? ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "segoe",
                        fontSize: 13,
                        color: Color(0XFF8D95B2),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login_screen(isfromSignup: false,)));
                    },
                    child:  Text(
                      ' Login',
                      style: TextStyle(
                        fontSize: 13,
                          fontFamily: "segoe",
                          fontWeight: FontWeight.w600,
                          color: AppColors.editBackColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 30,)
          ]),
        ));
  }
}