
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/widgets/chat_messages.dart';
import 'package:flutter_application_1/screens/widgets/new_message.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           FirebaseAuth.instance.signOut();
        //         },
        //         icon: Icon(
        //           Icons.exit_to_app,
        //           color: Theme.of(context).colorScheme.primary,
        //         ))
        //   ],
        //   backgroundColor: Colors.white,
        //   title: Text(
        //     "ChartBoard",
        //     style: GoogleFonts.aclonica(
        //         color: Colors.black, fontWeight: FontWeight.bold),
        //   ),
        // ),
        body:  const Column(
          children: [
            Expanded(
              child: ChatMesseges(),
            ),
            NewMessage()
          ],
        ));
  }
}
