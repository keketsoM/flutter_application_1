import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class streamBuilder extends StatelessWidget {
  const streamBuilder({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No Details fouund "),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Somthing went wrong..."),
          );
        }

        Map<String, dynamic> m = {};

        int savedIndex = 0;
        // ignore: unused_local_variable
        final display = snapshot.data!.docs;
        for (int v = 0; v < display.length; v++) {
          m.addAll(display[v].data());
        }
        for (int w = 0; w < display.length; w++) {
          if (display[w]['email'] == user.email) {
            savedIndex = w;
          }
        }
        return Container(
          margin: EdgeInsets.only(left: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Profile Picture:"),
              const SizedBox(height: 10,),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Image.network(
                '${display[savedIndex]['image_url']}',
              ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text("Username:"),
                  SizedBox(width: 20,),
                  Text(display[savedIndex]['username'])
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  const Text("Mail Address:"),
                  SizedBox(width: 15,),
                  Text(display[savedIndex]['email'])
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
