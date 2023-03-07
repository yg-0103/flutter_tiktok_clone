import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIdx = 0;

  final screens = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Discover'),
    ),
    const Center(
      child: Text('Inbox'),
    ),
    const Center(
      child: Text('Inbox'),
    ),
    const Center(
      child: Text('Profile'),
    ),
  ];

  void onTap(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIdx],
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
