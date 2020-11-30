import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedule_2/views/home/home_body.dart';

class HomeRoute extends StatelessWidget {
  HomeRoute({Key key}) : super(key: key);
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      Navigator.pushReplacementNamed(context, '/');
    }
    return Scaffold(
      body: HomeBody(),
    );
  }
}
