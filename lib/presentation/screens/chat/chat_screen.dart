import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/widgets/chat/its_message_bubble.dart';
import 'package:chat_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi gato'),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjqps9G1MHf7CVES13XNRFeqlfLhGR765RRg&s')),
        ),
      ),
      body: _ChatView(), //the class below
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<
        ChatProvider>(); //This is pendind of any change in this instance of the ChatProvide class
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.listMessages
                        .length, //chatProvider is an instance of the ChatProvider class
                    itemBuilder: (context, index) {
                      final message = chatProvider.listMessages[
                          index]; //here it gets and message Object
                      return (message.sender == FromWho.its
                          ? ItsMessageBubble(itsMessage: message)
                          : MyMessageBubble(messageSend: message));
                      /* return (index % 2 == 0
                          ? const MyMessageBubble()
                          : const ItsMessageBubble()); */
                    })),
            //Caja de texto mensajes
            MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value))
          ],
        ),
      ),
    );
  }
}
