import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'become_member.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  TargetPlatform? _platform;
  VideoPlayerController? _videoPlayerController1;
  VideoPlayerController? _videoPlayerController2;
  ChewieController? _chewieController;

  @override
  void initState() {
    _videoPlayerController1 = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _videoPlayerController1!.setLooping(true);
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1!,
      autoPlay: true,
      looping: true,
    );

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
    _videoPlayerController1?.dispose();
    _videoPlayerController2?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: 414,
                width: 436,
                child: Chewie(
                  controller: _chewieController!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 260),
                child: Image(
                  height: 142.0,
                  width: 375,
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
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Image.asset('assets/images/daily_reach_logo.png',
                height: 40, width: 180),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 0,
            ),
            child: Text(
              'Become a member to access exclusive content',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
            child: Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, right: 16, left: 16),
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: const Color(0xffD6D4D4).withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 0),
                child: Text(
                  'Become a Member',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Already a member? ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(144, 140, 184, 201),
                    ),
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(228, 130, 7, 7),
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Become_member()));
                  },
                ),
              ],
            ),
          ),
        ]));
  }
}
