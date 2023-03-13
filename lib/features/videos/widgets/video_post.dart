import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:tiktok_clone/features/videos/widgets/video_icon_button.dart';
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
    if (info.visibleFraction == 1 &&
        !_videoPlayerController.value.isPlaying &&
        !_isPaused) {
      _videoPlayerController.play();
    }
  }

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onToggleVideo();
    }

    // BottomSheet을 닫으면 resolve 됨
    await showModalBottomSheet(
      context: context,
      builder: (context) => const VideoComments(),
      backgroundColor: Colors.transparent,
    );

    _onToggleVideo();
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
          child: GestureDetector(
            onTap: _onToggleVideo,
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animationController.value,
                  child: child,
                );
              },
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
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "@YG",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Text(
                "it's last summer!!!",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/71420665",
                ),
                child: Text("YG"),
              ),
              Gaps.v24,
              const VideoIconButton(
                icon: FontAwesomeIcons.solidHeart,
                text: "2.9M",
              ),
              Gaps.v24,
              VideoIconButton(
                onTap: () => _onCommentsTap(context),
                icon: FontAwesomeIcons.solidComment,
                text: "33K",
              ),
              Gaps.v24,
              const VideoIconButton(
                icon: FontAwesomeIcons.share,
                text: "Share",
              )
            ],
          ),
        ),
      ]),
    );
  }
}
