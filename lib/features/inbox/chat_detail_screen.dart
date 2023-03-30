import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 10,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                foregroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/71420665',
                ),
              ),
              Positioned(
                  bottom: -2,
                  right: -3,
                  child: Container(
                    width: Sizes.size16,
                    height: Sizes.size16,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: Sizes.size3,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green),
                  )),
            ],
          ),
          title: const Text(
            'YG',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text(
            'Active now',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                size: Sizes.size20,
                color: Colors.black,
              ),
              Gaps.h20,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                size: Sizes.size20,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size14, vertical: Sizes.size10),
          itemBuilder: ((context, index) {
            var isMine = index % 2 == 0;
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
                  isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size14,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isMine ? Colors.blue : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(Sizes.size16),
                      topRight: const Radius.circular(Sizes.size16),
                      bottomLeft: isMine
                          ? const Radius.circular(Sizes.size16)
                          : const Radius.circular(Sizes.size5),
                      bottomRight: !isMine
                          ? const Radius.circular(Sizes.size16)
                          : const Radius.circular(Sizes.size5),
                    ),
                  ),
                  child: const Text(
                    'this is message',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ),
              ],
            );
          }),
          separatorBuilder: (context, index) => Gaps.v20,
          itemCount: 10),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size10),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: Sizes.size44,
                  child: TextField(
                    minLines: null,
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Send messages...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.faceSmile,
                            color: Colors.black,
                            size: Sizes.size24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.h12,
              Container(
                width: Sizes.size32,
                height: Sizes.size32,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      Sizes.size16,
                    ),
                  ),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.solidPaperPlane,
                    color: Colors.white,
                    size: Sizes.size16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
