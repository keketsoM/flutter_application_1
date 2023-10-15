import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/widgets/bottomNavBar.dart';

import 'package:flutter_application_1/screens/widgets/chat_messages.dart';
import 'package:flutter_application_1/screens/widgets/new_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "ChartBoard",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatMesseges(),
          ),
          NewMessage()
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
