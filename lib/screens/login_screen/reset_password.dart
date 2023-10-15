import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen/auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  var _email = '';
  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      //error message

      return;
    }
    _formKey.currentState!.save();

    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "If the email was found the reset password link, Check your email"),
        ),
      );
    } on FirebaseAuthException catch (error) {
      if (error.code ==
          "There is no user record corresponding to this identifier. The user may have been deleted") {}
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? "fail to find your student"),
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthScreen(),
          ));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset password'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.contains("@gmail.com")) {
                    return "Enter a valid emali address";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Email address", border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.none,
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: _submit,
                    child: const Text(
                      "Reset password",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
