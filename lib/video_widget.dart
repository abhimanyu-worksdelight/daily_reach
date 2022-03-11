import 'dart:typed_data';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class VideoItem extends StatefulWidget {
  var url = "";
  var isfromArchive = false;
  

  VideoItem(this.url,this.isfromArchive);
  @override
  State<VideoItem> createState() {
    return _VideoItemState();
  }
}

class _VideoItemState extends State<VideoItem> {
  VideoPlayerController? _controller;

  ChewieController? _chewieController;
  bool isInit = true;
  Uint8List? imageBytes;

  @override
  void initState() {
    // getThumbNail();
    _controller = VideoPlayerController.network(widget.url);
    
    _chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
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
                  height: (widget.isfromArchive == false)? 414:104,
                  width: (widget.isfromArchive == false)? MediaQuery.of(context).size.width:116,
                  
                  child: (_controller != null)?
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: (imageBytes != null)
                              ? Container(
                                
                                  height: (widget.isfromArchive == false)? 350:104,
                                  width: (widget.isfromArchive == false)?MediaQuery.of(context).size.width:116,
                                  child: Image.memory(
                                    imageBytes!,
                                    height:(widget.isfromArchive == false)? 414:169,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                              )
                     :FittedBox(
                       fit: BoxFit.cover,
                       child: SizedBox(
                         width:MediaQuery.of(context).size.width,
                         child: Chewie(
                           
                          controller: _chewieController!,
                          
                          
                                            
                          ),
                       ),
                     ),
                  ):Container(),
                ),
                Center(
                  child: InkWell(
                    
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: (widget.isfromArchive == false)?  EdgeInsets.only(top: 0 ):EdgeInsets.only(top: 15,left: 27 ) ,
                      child: Icon(
                        isInit ?Icons.pause: Icons.play_arrow,
                        color: Colors.grey,
                        size: 60,
                      ),
                    ),
                    onTap: () {
                      
                       if (_controller != null){
                         imageBytes = null;            
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
  
  void getThumbNail() async{
    isInit = true;
  imageBytes = await VideoThumbnail.thumbnailData(
  video: widget.url,
  imageFormat: ImageFormat.JPEG,
  maxWidth: 340, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  quality: 25,
);
setState(() {
  
});
}
  
}
