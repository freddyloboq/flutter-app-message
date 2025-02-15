import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yer_no_app/domain/entities/message.dart';
import 'package:yer_no_app/presentation/providers/chat_provider.dart';
import 'package:yer_no_app/presentation/widgets/chat/he_message_bubble.dart';
import 'package:yer_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yer_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.chat),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://singifyai.fineshare.com/song-ai/covers/elon-musk.webp'),
          ),
        ),
        title: const Text('Chat Screen 🗯️'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      // left: false,
      // right: false,
      // bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: /*Container(color: Colors.red,)*/
                  ListView.builder(
                    controller: chatProvider.chatScrollController,
                      itemCount: chatProvider.messageList.length,
                      itemBuilder: (context, index) {
                        // return index.isEven ? const HerMessageBubble() : const MyMessageBubble();
                        // return (index % 2 == 0)
                        //             ? const HerMessageBubble()
                        //             : const MyMessageBubble();

                        final message = chatProvider.messageList[index];
                        return (message.fromWho == FromWho.me)
                            ? MyMessageBubble(message: message)
                            : HeMessageBubble(message: message);
                        // return MyMessageBubble();
                      })),

          // Caja de mensajes
          MessageFieldBox(
            // onValue: (text) => chatProvider.sendMessage(text)
            onValue: chatProvider.sendMessage // Lo mismo que arriba solo que como son los mismos se llama directamente
          ),
        ]),
      ),
    );
  }
}
