import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your interests'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size36, horizontal: Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v16,
                const Text(
                  'Get better video recommendations',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v28,
                Wrap(
                  runSpacing: Sizes.size12,
                  spacing: Sizes.size10,
                  children: [
                    for (var interest in interests)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size14,
                          horizontal: Sizes.size20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Sizes.size40),
                          border: Border.all(
                            width: 1,
                            color: Colors.black.withOpacity(0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 3,
                                color: Colors.black.withOpacity(0.05)),
                          ],
                        ),
                        child: Text(
                          interest,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                  ],
                )
              ],
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size20),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
              vertical: Sizes.size16,
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Text(
              'Next',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
