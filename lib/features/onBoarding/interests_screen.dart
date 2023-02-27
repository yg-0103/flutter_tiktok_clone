import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onBoarding/widgets/interest_button.dart';

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

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showTitle = false;

  void _onScroll() {
    if (showTitle == _scrollController.offset > 110) return;

    setState(() {
      showTitle = _scrollController.offset > 110;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: showTitle ? 1 : 0,
          duration: const Duration(
            milliseconds: 300,
          ),
          child: const Text('Choose your interests'),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
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
                        InterestButton(interest: interest)
                    ],
                  )
                ],
              )),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        child: Padding(
            padding: const EdgeInsets.all(Sizes.size20),
            child: CupertinoButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              child: const Text('Next'),
            )),
      ),
    );
  }
}



// Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: Sizes.size20,
//               vertical: Sizes.size16,
//             ),
//             decoration: BoxDecoration(color: Theme.of(context).primaryColor),
//             child: const Text(
//               'Next',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: Sizes.size16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),