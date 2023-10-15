import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen/authenitcate_and_route.dart';

class PersonProfile extends StatefulWidget {
  const PersonProfile({super.key});

  @override
  State<PersonProfile> createState() => _PersonProfileState();
}

class _PersonProfileState extends State<PersonProfile> {
  final user = FirebaseAuth.instance.currentUser!;
  final data = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text("Account details")),
      body: SingleChildScrollView(
        child: AuthenticateAndRoute(user: user),
      ),
    );
  }
}

