import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen/reset_password.dart';
import 'package:flutter_application_1/screens/widgets/user_image_picker.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formkey = GlobalKey<FormState>();
  var _islogin = true;
  var _userName = "";
  var _enteredEmail = "";
  var _enteredPassword = "";
  File? _selectedImage;
  var _isAuthenticating = false;
  void _submit() async {
    final isvalid = _formkey.currentState!.validate();
    if (!isvalid || !_islogin && _selectedImage == null) {
      return;
    }
    _formkey.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_islogin) {
        final UserCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      } else {
        final UserCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);

        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${UserCredentials.user!.uid}.jpg');

        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(UserCredentials.user!.uid)
            .set({
          'username': _userName,
          'email': _enteredEmail,
          'image_url': imageUrl,
        });
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? "Authentication failed."),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_islogin)
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  width: 100,
                ),
              const Text(
                'Welcome to Trade Hub ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_islogin)
                            UserImagePicker(
                              onPickedImage: (pickedImage) {
                                _selectedImage = pickedImage;
                              },
                            ),
                          if (!_islogin)
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: "Username"),
                              keyboardType: TextInputType.name,
                              enableSuggestions: false,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    value.trim().length < 4) {
                                  return "Please enter a user name at least 4 characters.";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _userName = newValue!;
                              },
                            ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: "Email address"),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@gmail.com')) {
                                return "Please enter a vaild email";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredEmail = newValue!;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Password"),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return "Password must be 6 characters long";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredPassword = newValue!;
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          if (_isAuthenticating) CircularProgressIndicator(),
                          if (!_isAuthenticating)
                            ElevatedButton(
                              onPressed: _submit,
                              child: Text(
                                _islogin ? "Login" : "Sign up",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                            ),
                          if (_islogin)
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPassword(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'forget password',
                                  style: TextStyle(color: Colors.black),
                                )),
                          if (!_isAuthenticating)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _islogin = !_islogin;
                                });
                              },
                              child: Text(
                                _islogin
                                    ? 'Create an account'
                                    : 'I already have an account',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
