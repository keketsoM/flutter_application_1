import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/widgets/message_bubble.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (context, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No messages found.'),
          );
        }

        if (chatSnapshot.hasError) {
          return Center(
            child: Text('Something went wrong...'),
          );
        }

        final loadMessages = chatSnapshot.data!.docs;

        return ListView.builder(
          padding: EdgeInsets.only(
            bottom: 40,
            left: 13,
            right: 13,
          ),
          reverse: true,
          itemCount: loadMessages.length,
          itemBuilder: (context, index) {
            // return Text(
            //   loadMessages[index].data()['text'],
            // );
            final ChatMessage = loadMessages[index].data();

            final nextChatMessage = index + 1 < loadMessages.length
                ? loadMessages[index + 1].data()
                : null;

            final currentMessageUserId = ChatMessage['username'];
            final nextMessageUserId =
                nextChatMessage != null ? nextChatMessage['username'] : null;
            final nextUserIsSame = nextMessageUserId == currentMessageUserId;

            if (nextUserIsSame) {
              return MessageBubble.next(
                  message: ChatMessage["text"],
                  isMe: authenticatedUser!.uid == currentMessageUserId);
            } else {
              return MessageBubble.first(
                  userImage: ChatMessage['userImage'],
                  username: ChatMessage['username'],
                  message: ChatMessage['text'],
                  isMe: authenticatedUser!.uid == currentMessageUserId);
            }
          },
        );
      },
    );
    // return Center(
    //   child: Text("No message has been found"),
    // );
  }
}
