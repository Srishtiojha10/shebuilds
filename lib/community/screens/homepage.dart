import 'package:example/community/flat_widgets/flat_action_btn.dart';
import 'package:example/community/flat_widgets/flat_add_story_btn.dart';
import 'package:example/community/flat_widgets/flat_chat_item.dart';
import 'package:example/community/flat_widgets/flat_counter.dart';
import 'package:example/community/flat_widgets/flat_page_header.dart';
import 'package:example/community/flat_widgets/flat_page_wrapper.dart';
import 'package:example/community/flat_widgets/flat_profile_image.dart';
import 'package:example/community/flat_widgets/flat_section_header.dart';
import 'package:example/community/screens/chatpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static final String id = "Homepage";

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatPageWrapper(
        backgroundColor: Colors.white,
        scrollType: ScrollType.floatingHeader,
        header: FlatPageHeader(
          prefixWidget: FlatActionButton(
            iconData: Icons.menu,
          ),
          title: "Community",
          suffixWidget: FlatActionButton(
            iconData: Icons.search,
          ),
        ),
        children: [
          FlatSectionHeader(
            title: "Jiit Noida Updates",
          ),
          Container(
            height: 76.0,
            margin: EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: 16.0,
                //   ),
                //   child: FlatAddStoryBtn(),
                // ),
                FlatProfileImage(
                  outlineIndicator: true,
                  onlineIndicator: true,
                  imageUrl:
                      "https://images.unsplash.com/photo-1502323777036-f29e3972d82f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  imageUrl:
                      "https://images.unsplash.com/photo-1582721244958-d0cc82a417da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2179&q=80",
                ),
                FlatProfileImage(
                  onlineIndicator: true,
                  outlineIndicator: true,
                  imageUrl:
                      "https://images.unsplash.com/photo-1583243567239-3727551e0c59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1112&q=80",
                ),
                FlatProfileImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
                  onlineIndicator: true,
                  outlineIndicator: true,
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  imageUrl:
                      "https://images.unsplash.com/photo-1502323777036-f29e3972d82f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  imageUrl:
                      "https://images.unsplash.com/photo-1582721244958-d0cc82a417da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2179&q=80",
                ),
                FlatProfileImage(
                  onlineIndicator: true,
                  outlineIndicator: true,
                  imageUrl:
                      "https://images.unsplash.com/photo-1583243567239-3727551e0c59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1112&q=80",
                ),
              ],
            ),
          ),
          FlatSectionHeader(
            title: "Marked Important",
          ),
          FlatChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ChatPage.id);
            },
            name: "Ishan Goswami",
            profileImage: FlatProfileImage(
              imageUrl:
                  "https://cdn.dribbble.com/users/1281912/avatars/normal/febecc326c76154551f9d4bbab73f97b.jpg?1468927304",
              onlineIndicator: true,
            ),
            message: "Hello World!, Welcome to Community chat",
            multiLineMessage: true,
            counter: FlatCounter(
              text: "1",
            ),
          ),
          FlatSectionHeader(
            title: "Chats",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1573488693582-260a6f1a51c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1356&q=80",
            ),
            name: "Ayush Singhal",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1536057222397-e51989d3cb8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=639&q=80",
            ),
            name: "Vinay Patwal",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1558392204-ac78741f4abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
            ),
            name: "Siru Ojha",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1521235042493-c5bef89dc2c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1385&q=80",
            ),
            name: "Arti Goswami",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1235&q=80",
            ),
            name: "Jasmeet Singh",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
            ),
            name: "Aryan Tomar",
          )
        ],
      ),
    );
  }
}
