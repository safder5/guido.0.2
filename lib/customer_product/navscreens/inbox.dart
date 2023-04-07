import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/constants/icons.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<String> chats = ['Gundermann', 'arya', 'Ramsey'];
  List<String> picurls = [
    'lib/images/person1.jpg',
    'lib/images/person2.jpg',
    'lib/images/person3.jpg'
  ];
  List<String> unseen = ['2', '5', '0'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chats',
              style: TextStyle(fontWeight: FontWeight.w300),
              textScaleFactor: 1.4,
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                        builder: (context) => const SelectedChatPage(
                              name: 'GUIDO Chat Support',
                            )));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.05)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [orange, yellow]),
                            shape: BoxShape.circle,
                            color: white.withOpacity(0.9)),
                        child: Center(
                            child: Text(
                          'GUIDO',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: white,
                              fontSize: 12),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'GUIDO Chat Support',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'Do you need help?',
                            style: TextStyle(fontWeight: FontWeight.w200),
                            textScaleFactor: 0.8,
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Entypo.right_open_big,
                        size: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ChatContainers(
                      picurl: picurls[index],
                      name: chats[index],
                      unseen: unseen[index]);
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ChatContainers extends StatefulWidget {
  final String picurl;
  final String name;
  final String unseen;
  const ChatContainers({
    super.key,
    required this.picurl,
    required this.name,
    required this.unseen,
  });

  @override
  State<ChatContainers> createState() => _ChatContainersState();
}

class _ChatContainersState extends State<ChatContainers> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => SelectedChatPage(
                  name: widget.name,
                )));
      },
      child: AbsorbPointer(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.picurl),
                  radius: 24,
                  backgroundColor: trans,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: const Text(
                        'Hii Aryamann, I see your interest in manali trip , here i have something for you    please check it out!  ',
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                        style: TextStyle(fontWeight: FontWeight.w200),
                        textScaleFactor: 0.6,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                widget.unseen == '0'
                    ? Container()
                    // const Icon(
                    //     Entypo.right_open_big,
                    //     size: 12,
                    //   )
                    : Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                            border: GradientBoxBorder(
                                width: 0.5,
                                gradient:
                                    LinearGradient(colors: [orange, yellow]))),
                        child: Center(
                          child: TextShader(Text(
                            widget.unseen,
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 9,
                                color: white),
                          )),
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

class SelectedChatPage extends StatefulWidget {
  final String name;
  const SelectedChatPage({super.key, required this.name});

  @override
  State<SelectedChatPage> createState() => _SelectedChatPageState();
}

class _SelectedChatPageState extends State<SelectedChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    LineariconsFree.arrow_left,
                    size: 18,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '25 December 2022',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Text('fuck youyuoyuoyouyouyouoyuyouoyu');
                }),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF7C7979).withOpacity(0.1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient:
                                  LinearGradient(colors: [orange, yellow])),
                          // child: IconShader(icon:Icon(
                          //   FontAwesome.picture,
                          //   color: white,
                          //   size: 12,
                          // ),)
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Flexible(
                          child: TextField(
                            cursorWidth: 1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ' Message',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [orange, yellow])),
                  child: Icon(
                    Icons.send,
                    color: white,
                    size: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
