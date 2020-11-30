import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedule_2/views/sign_in/sign_in_body.dart';

class SignInRoute extends StatelessWidget {
  SignInRoute({Key key}) : super(key: key);
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
    return Scaffold(
      body: SignInBody(),
    );
  }
}
