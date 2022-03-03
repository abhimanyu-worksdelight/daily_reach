import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  var url = "";

  VideoItem(this.url);
  @override
  State<VideoItem> createState() {
    return _VideoItemState();
  }
}

class _VideoItemState extends State<VideoItem> {
  VideoPlayerController? _controller;

  ChewieController? _chewieController;
  bool isInit = true;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url);

    _chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: false,
      aspectRatio: _controller!.value.aspectRatio,
      showControls: false,
    );
// _chewieController!.showControls =false;

    _controller?.addListener(() {
      if (_controller?.value.position ==
          _controller?.value.duration) {
        print('video Ended');
      }
    });
    setState(() {});
    super.initState();
    
  }

  @override
  void dispose() {
    _controller?.pause();
    // _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [
                Container(
                  height: 414,
                  width: MediaQuery.of(context).size.width,
                  
                  child: (_controller != null)?
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: Chewie(
                      controller: _chewieController!,

                    ),
                  ):Container(),
                ),
                Center(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding:  EdgeInsets.only(top: 0 ),
                      child: Icon(
                        isInit ?Icons.pause: Icons.play_arrow  ,
                        color: Colors.grey,
                        size: 60,
                      ),
                    ),
                    onTap: () {
                       if (_controller != null){
                      setState(() {
                       isInit =!isInit;
                        _controller!.value.isPlaying
                            ? _controller!.pause() 
                            : _controller!.play();
                      });
                       }
                    },
                  ),
                ),
                
              ],
            );
  }
}
