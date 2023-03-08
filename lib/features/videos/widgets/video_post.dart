import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  Function onVideoFinished;
  VideoPost({super.key, required this.onVideoFinished});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/video.mp4');

  void _handleFinshed() {
    var value = _videoPlayerController.value;
    if (!value.isInitialized) return;

    if (value.duration == value.position) {
      widget.onVideoFinished();
    }
  }

  void _intializeVideo() async {
    await _videoPlayerController.initialize();
    _videoPlayerController.play();
    setState(() {});
    _videoPlayerController.addListener(_handleFinshed);
  }

  @override
  void initState() {
    super.initState();
    _intializeVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: _videoPlayerController.value.isInitialized
            ? VideoPlayer(_videoPlayerController)
            : Container(
                color: Colors.black,
              ),
      ),
    ]);
  }
}
