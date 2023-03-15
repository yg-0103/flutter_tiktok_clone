import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

final images = [
  'https://images.unsplash.com/photo-1678727467590-b6fe488997a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=964&q=80',
  'https://images.unsplash.com/photo-1678783447940-3c7fd169cda2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
  'https://images.unsplash.com/photo-1678614033802-d8b11cd7fb93?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
  'https://plus.unsplash.com/premium_photo-1669381390251-4d7c013c4830?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();
  late TabController _tabController;
  void _onChanged(String value) {
    print(value);
  }

  void _onSubmitted(String value) {
    print(value);
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    // vsync라는 친구가 필요할 땐 with SingleTickerProviderStateMixin 이게 필요하다.
    _tabController = TabController(length: tabs.length, vsync: this);

    _tabController.addListener(() {
      _onStopWriting();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onStopWriting,
      child: Scaffold(
        // resizeToAvoidBottomInset이 없으면 keyboard가 나타났을 때 UI가 찌그러짐.
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: CupertinoSearchTextField(
                  controller: _textEditingController,
                  onChanged: _onChanged,
                  onSubmitted: _onSubmitted,
                ),
              ),
              Gaps.h14,
              const FaIcon(
                FontAwesomeIcons.sliders,
              ),
            ],
          ),
          elevation: 1,
          bottom: TabBar(
            controller: _tabController,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            splashFactory: NoSplash.splashFactory,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            tabs: [for (var tab in tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: const EdgeInsets.all(Sizes.size6),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 21),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size4),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.cover,
                        placeholder: 'assets/images/placeholder.gif',
                        image: images[index % 4],
                      ),
                    ),
                  ),
                  Gaps.v6,
                  const Text(
                    'this is very long text that tests text length',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v4,
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 14,
                          foregroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/71420665',
                          ),
                        ),
                        Gaps.h4,
                        const Expanded(
                          child: Text(
                            'this is very long avartar name',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h2,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.grey.shade600,
                          size: Sizes.size14,
                        ),
                        Gaps.h2,
                        const Text('2.2M')
                      ],
                    ),
                  )
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab),
              )
          ],
        ),
      ),
    );
  }
}
