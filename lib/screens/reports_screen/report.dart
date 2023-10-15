import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen/homePage.dart';
import 'package:http/http.dart' as http;

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final controllerTo = TextEditingController();
  final controllerSub = TextEditingController();
  final controllerMes = TextEditingController();
  final controllerMail=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text("Report"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextfield(title: "Name", controller: controllerTo),
            const SizedBox(
              height: 16,
            ),
            buildTextfield(title: "Subject", controller: controllerSub),
            const SizedBox(
              height: 16,
            ),
            buildTextfield(title: "Student Mail", controller: controllerMail),
            buildTextfield(
                title: "Message", controller: controllerMes, maxLine: 8),
                
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton (
                onPressed:(){
                 sendEmail(name: controllerTo.text, email: controllerMail.text, subject: controllerSub.text, message: controllerMes.text);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
                } ,
                
                child: const Text("Send"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
void send( TextEditingController name,TextEditingController email, TextEditingController subject,TextEditingController message)
{
  sendEmail(name: name.text, email: email.text, subject: subject.text, message: message.text);
}
Future? sendEmail(
    {required String name,
    required email,
    required String subject,
    required String message}) async {
  const serviceid = 'service_dar2r09';
  const templateid = 'template_tueqjzo';
  const userid = 'pyj7bLmhMb1YFzwII';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final res = await http.post(url,
      headers: {'origin':'http://localhost',
        'Content-Type': 'application/json'},
      body: json.encode(
        {
          'service_id': serviceid,
          'template_id': templateid,
          'user_id': userid,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'message': message,
          }
        },
      ));
}

Widget buildTextfield(
    {required String title,
    required TextEditingController controller,
    int maxLine = 1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      TextField(
        maxLines: maxLine,
        controller: controller,
        decoration: const InputDecoration(border: OutlineInputBorder()),
      ),
    ],
  );
}
