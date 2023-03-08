import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  List<MaterialColor> colors = [
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.yellow
  ];

  void _onPageChanged(int page) {
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

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: colors.length,
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text(
            'Screen $index',
            style: const TextStyle(fontSize: 68),
          ),
        ),
      ),
    );
  }
}
