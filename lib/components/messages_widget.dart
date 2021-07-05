import 'package:ecodeem/components/message_widget.dart';
import 'package:ecodeem/model/message.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({
    required this.idUser,
    Key? key,
  }) : super(key: key);

  final String idUser;

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Message>>(
        builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final List<Message>? messages = snapshot.data;

                return messages == null
                    ? buildText('Say Hi..')
                    : messages.isEmpty
                        ? buildText('Say Hi..')
                        : ListView.builder(
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Message message = messages[index];
                              return MessageWidget(
                                message: message,
                                isMe: message.idUser == 'me',
                              );
                            },
                          );
              }
          }
        },
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      );
}
