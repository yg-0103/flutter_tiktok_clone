import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';

final images = [
  'https://images.unsplash.com/photo-1678727467590-b6fe488997a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=964&q=80',
  'https://images.unsplash.com/photo-1678783447940-3c7fd169cda2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
  'https://images.unsplash.com/photo-1678614033802-d8b11cd7fb93?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
  'https://plus.unsplash.com/premium_photo-1669381390251-4d7c013c4830?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
];

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('YG'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      foregroundColor: Colors.teal,
                      foregroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/71420665',
                      ),
                      child: Text(
                        'YG',
                      ),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '@YG',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.h6,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size14,
                          color: Colors.blue.shade400,
                        ),
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                '97',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.size20,
                                ),
                              ),
                              Gaps.v8,
                              Text(
                                'Following',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          // 부모에 높이가 있어야함. SizedBox로 높이 지정 가능.
                          VerticalDivider(
                            width: Sizes.size36,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                          ),
                          Column(
                            children: [
                              const Text(
                                '10M',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.size20,
                                ),
                              ),
                              Gaps.v8,
                              Text(
                                'Followers',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size36,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                          ),
                          Column(
                            children: [
                              const Text(
                                '194.3M',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.size20,
                                ),
                              ),
                              Gaps.v8,
                              Text(
                                'Likes',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              Sizes.size6,
                            ),
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size12,
                        ),
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        'asdhasklgkegkewlgewkglwkel e lwkelg kwelgkwelgkdds dggdsgsdgwelgkwg',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v10,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          'https://ygblog.app',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 14),
              itemBuilder: (context, index) => Column(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 14,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      placeholder: 'assets/images/placeholder.gif',
                      image: images[index % 4],
                    ),
                  ),
                ],
              ),
            ),
            Container(),
          ]),

          //   SliverAppBar(
          //     floating: true,
          //     stretch: true,
          //     pinned: true,
          //     backgroundColor: Colors.red.shade50,
          //     collapsedHeight: 80,
          //     expandedHeight: 200,
          //     flexibleSpace: FlexibleSpaceBar(
          //       stretchModes: const [
          //         StretchMode.blurBackground,
          //         StretchMode.fadeTitle,
          //         StretchMode.zoomBackground,
          //       ],
          //       background: Image.network(
          //         'https://images.unsplash.com/photo-1678727467590-b6fe488997a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=964&q=80',
          //         fit: BoxFit.cover,
          //       ),
          //       title: const Text('Hello'),
          //     ),
          //   ),
          // SliverToBoxAdapter(child: Column(children: [],)),
          //   SliverFixedExtentList(
          //     delegate: SliverChildBuilderDelegate(
          //       childCount: 50,
          //       (context, index) => Container(
          //         color: Colors.amber[100 * (index % 9)],
          //         child: Center(
          //           child: Text('Item $index'),
          //         ),
          //       ),
          //     ),
          //     itemExtent: 100, // height
          //   ),
          //   SliverPersistentHeader(
          //     pinned: true,
          //     delegate: CustomDelegate(),
          //   ),
          //   SliverGrid(
          //     delegate: SliverChildBuilderDelegate(
          //       childCount: 50,
          //       (context, index) => Container(
          //         color: Colors.blue[100 * (index % 9)],
          //         child: Center(
          //           child: Text('Item $index'),
          //         ),
          //       ),
          //     ),
          //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //       maxCrossAxisExtent: 100,
          //       mainAxisSpacing: Sizes.size20,
          //       crossAxisSpacing: Sizes.size20,
          //       childAspectRatio: 1,
          //     ),
          //   ),
        ),
      ),
    );
  }
}

// class CustomDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.indigo,
//       child: const FractionallySizedBox(
//         heightFactor: 1,
//         child: Center(
//           child: Text(
//             'Title!!!!',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 150; // default height

//   @override
//   double get minExtent => 70; // sticky 시 height

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
