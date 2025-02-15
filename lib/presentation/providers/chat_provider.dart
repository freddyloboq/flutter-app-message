import 'package:flutter/material.dart';
import 'package:yer_no_app/config/helpers/get_yes_not_answer.dart';
import 'package:yer_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNotAnswer getYesNotAnswer = GetYesNotAnswer();

  List<Message> messageList = [
    Message(text: 'Hola camarada!', fromWho: FromWho.me),
    Message(text: 'Ya terminaste el proyecto?', fromWho: FromWho.me),
    ];

    Future <void>sendMessage(String text) async{
      if (text.isEmpty) return;
      final newMessage = Message(text: text, fromWho: FromWho.me);
      messageList.add(newMessage);

      if(text.endsWith('?')){
        heResponse();
      }

      notifyListeners();
      moveScrollToBotttom();
    }

    Future<void> heResponse() async {
      final heMessage = await getYesNotAnswer.getAnswer();
      messageList.add(heMessage);
      notifyListeners();
      moveScrollToBotttom();
    }

    void moveScrollToBotttom() async {
      await Future.delayed(const Duration(milliseconds: 100));

      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
}
