import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();
  final Duration _scrollDuration = const Duration(milliseconds: 200);
  final Curve _scrollCurve = Curves.linear;
  List<MaterialColor> colors = [
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.yellow
  ];

  void _pageTo(int page) {
    _pageController.animateToPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
      page,
    );
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  void _onPageChanged(int page) {
    _pageTo(page);

    if (page != colors.length - 1) return;

    setState(() {
      colors.addAll(
        [
          Colors.red,
          Colors.blue,
          Colors.teal,
          Colors.yellow,
        ],
      );
    });
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
          itemCount: colors.length,
          controller: _pageController,
          scrollDirection: Axis.vertical,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) => VideoPost(
                onVideoFinished: _onVideoFinished,
                idx: index,
              )),
    );
  }
}
