//import 'package:chat_app/domain/entities/message.dart';
//import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ItsMessageBubble extends StatelessWidget {
  final Message itsMessage;
  const ItsMessageBubble({
    super.key,
    required this.itsMessage,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              itsMessage.text,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _ImageBubble(itsMessage.imageUrl!),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // to get the dimensions of the divice

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.5,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
                width: size.width * 0.7,
                height: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text('my cat is writing...'));
          },
        ));
  }
}
