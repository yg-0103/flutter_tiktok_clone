import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video.button.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIdx = 3;

  void onTap(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

// StateFull widget 에서는 어디서든 context를 참조할 수 있다.
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
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIdx == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIdx != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 4,
            child: const UserProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIdx != 0 ? Colors.white : Colors.black,
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
                invert: _selectedIdx != 0,
                onTap: () => onTap(0),
              ),
              NavTab(
                icon: FontAwesomeIcons.solidCompass,
                title: 'Discover',
                isSelected: _selectedIdx == 1,
                onTap: () => onTap(1),
                invert: _selectedIdx != 0,
              ),
              Gaps.h24,
              GestureDetector(
                onTap: onPostButtonTap,
                child: PostVideoButton(
                  invert: _selectedIdx != 0,
                ),
              ),
              Gaps.h24,
              NavTab(
                icon: FontAwesomeIcons.solidMessage,
                title: 'Inbox',
                isSelected: _selectedIdx == 3,
                onTap: () => onTap(3),
                invert: _selectedIdx != 0,
              ),
              NavTab(
                icon: FontAwesomeIcons.solidUser,
                title: 'Profile',
                isSelected: _selectedIdx == 4,
                onTap: () => onTap(4),
                invert: _selectedIdx != 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
