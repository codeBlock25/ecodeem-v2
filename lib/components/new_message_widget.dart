import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicons/unicons.dart';

class NewMessageWidget extends StatefulWidget {
  const NewMessageWidget({
    required this.idUser,
    Key? key,
  }) : super(key: key);

  final String idUser;

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final TextEditingController _controller = TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(5),
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  labelText: 'Type your message',
                  border: OutlineInputBorder(
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (String value) => setState(() {
                  message = value;
                }),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                color: Colors.red,
                icon: const Icon(UniconsLine.message, color: Colors.white),
                onPressed: message.trim().isEmpty ? null : () {},
              ),
            )
          ],
        ),
      );
}
