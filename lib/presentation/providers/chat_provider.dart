import 'package:chat_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getAnswer = GetYesNoAnswer();
  List<Message> listMessages = [
    Message(text: 'Hola', sender: FromWho.me),
    Message(text: 'Ya estas en casa?', sender: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    //method
    if (text.isEmpty) return;
    final Message newMessage = Message(text: text, sender: FromWho.me);
    listMessages.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    //method
    final itsMessage = await getAnswer.getAnswer();
    listMessages.add(itsMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    //method
    await Future.delayed(const Duration(milliseconds: 100)); //Check this out
    chatScrollController.animateTo(chatScrollController.position.extentTotal,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
