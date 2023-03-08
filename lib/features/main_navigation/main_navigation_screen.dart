import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/log_in_screen.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video.button.dart';
import 'package:tiktok_clone/features/onBoarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIdx = 0;

  void onTap(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

  void onPostButtonTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Record video'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIdx != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 1,
            child: const LoginScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 3,
            child: const TutorialScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 4,
            child: const LoginFormScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                icon: FontAwesomeIcons.house,
                title: 'Home',
                isSelected: _selectedIdx == 0,
                onTap: () => onTap(0),
              ),
              NavTab(
                icon: FontAwesomeIcons.magnifyingGlass,
                title: 'Discover',
                isSelected: _selectedIdx == 1,
                onTap: () => onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: onPostButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                icon: FontAwesomeIcons.message,
                title: 'Inbox',
                isSelected: _selectedIdx == 3,
                onTap: () => onTap(3),
              ),
              NavTab(
                icon: FontAwesomeIcons.user,
                title: 'Profile',
                isSelected: _selectedIdx == 4,
                onTap: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
