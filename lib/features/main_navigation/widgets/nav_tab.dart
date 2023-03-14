import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.invert,
  });

  final IconData icon;
  final String title;
  final bool isSelected;
  final Function onTap;
  final bool invert;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: invert ? Colors.white : Colors.black,
          child: AnimatedOpacity(
            duration: const Duration(
              milliseconds: 200,
            ),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon,
                  color: invert ? Colors.black : Colors.white,
                ),
                Gaps.v5,
                Text(
                  title,
                  style: TextStyle(
                    color: invert ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
