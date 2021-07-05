import 'package:ecodeem/components/messages_widget.dart';
import 'package:ecodeem/components/new_message_widget.dart';
import 'package:ecodeem/components/profile_header_widget.dart';
import 'package:ecodeem/model/user.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ProfileHeaderWidget(name: widget.user.name),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesWidget(idUser: widget.user.idUser ?? ''),
                ),
              ),
              NewMessageWidget(idUser: widget.user.idUser ?? '')
            ],
          ),
        ),
      );
}
