import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int idx;
  const VideoPost(
      {super.key, required this.onVideoFinished, required this.idx});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/video.mp4');
  late final AnimationController _animationController;

  final Duration _animataionDutaion = const Duration(
    milliseconds: 100,
  );
  bool _isPaused = false;

  void _handleFinshed() {
    var value = _videoPlayerController.value;
    if (!value.isInitialized) return;

    if (value.duration == value.position) {
      widget.onVideoFinished();
    }
  }

  void _intializeVideo() async {
    await _videoPlayerController.initialize();
    setState(() {});
    _videoPlayerController.addListener(_handleFinshed);
  }

  void _onToggleVideo() {
    var value = _videoPlayerController.value;

    if (value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }

    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  @override
  void initState() {
    super.initState();
    _intializeVideo();

    _animationController = AnimationController(
      vsync: this,
      duration: _animataionDutaion,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
    );

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.idx}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(children: [
        Positioned.fill(
          child: _videoPlayerController.value.isInitialized
              ? VideoPlayer(_videoPlayerController)
              : Container(
                  color: Colors.black,
                ),
        ),
        Positioned.fill(
          child: GestureDetector(onTap: _onToggleVideo),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Transform.scale(
              scale: _animationController.value,
              child: Center(
                child: AnimatedOpacity(
                  opacity: _isPaused ? 1 : 0,
                  duration: _animataionDutaion,
                  child: const FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: Sizes.size48,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
