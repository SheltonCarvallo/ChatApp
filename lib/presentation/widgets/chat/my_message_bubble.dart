import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final Message messageSend;
  const MyMessageBubble({super.key, required this.messageSend});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              messageSend.text,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
