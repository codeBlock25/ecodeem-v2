import 'dart:math';

import 'package:ecodeem/components/app_header.dart';
import 'package:ecodeem/model/user.dart';
import 'package:ecodeem/screen/chat/window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final List<User> users = <User>[
    User(
        name: 'James John',
        urlAvatar:
            'https://images.pexels.com/photos/4058316/pexels-photo-4058316.jpeg?cs=srgb&dl=pexels-cliff-booth-4058316.jpg&fm=jpg',
        lastMessageTime: DateTime.now()),
    User(
        name: 'Alex Sam',
        urlAvatar:
            'https://images.pexels.com/photos/3772771/pexels-photo-3772771.jpeg?cs=srgb&dl=pexels-gabb-tapique-3772771.jpg&fm=jpg',
        lastMessageTime: DateTime.now()),
    User(
        name: 'Queen Mosic',
        urlAvatar:
            'https://images.pexels.com/photos/3310693/pexels-photo-3310693.jpeg?cs=srgb&dl=pexels-ike-louie-natividad-3310693.jpg&fm=jpg',
        lastMessageTime: DateTime.now()),
    User(
        name: 'Moses Bruce',
        urlAvatar:
            'https://images.pexels.com/photos/4492100/pexels-photo-4492100.jpeg?cs=srgb&dl=pexels-lhairton-kelvin-costa-4492100.jpg&fm=jpg',
        lastMessageTime: DateTime.now()),
    User(
        name: 'Clack Adams',
        urlAvatar:
            'https://images.pexels.com/photos/3519656/pexels-photo-3519656.jpeg?cs=srgb&dl=pexels-sebastian-henry-toro-zoltanski-3519656.jpg&fm=jpg',
        lastMessageTime: DateTime.now()),
    User(
        name: 'Austine Cop',
        urlAvatar:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
        lastMessageTime: DateTime.now()),
    User(
        name: 'Joshua Isl',
        urlAvatar:
            'https://images.pexels.com/photos/1800456/pexels-photo-1800456.jpeg?cs=srgb&dl=pexels-irina-iriser-1800456.jpg&fm=jpg',
        lastMessageTime: DateTime.now()),
    User(
        name: 'Nelo Clool',
        urlAvatar:
            'https://images.pexels.com/photos/2648203/pexels-photo-2648203.jpeg?cs=srgb&dl=pexels-nappy-2648203.jpg&fm=jpg',
        lastMessageTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildChatAppBar(),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final User user = users[index];

          return ListTile(
              onTap: () {
                Get.to(() => ChatPage(user: user),
                    transition: Transition.rightToLeft);
              },
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user.urlAvatar),
              ),
              title: Text(
                user.name,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'jhgfrtyuijgftyujhg',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              trailing: Text(
                '${((user.lastMessageTime.hour * Random().nextInt(40)) / (12 * 40) * 60).ceil()} mins ago',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ));
        },
        itemCount: users.length,
      ),
    );
  }
}
