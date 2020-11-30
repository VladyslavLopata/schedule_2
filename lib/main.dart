import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schedule_2/routes/home_route.dart';
import 'package:schedule_2/routes/sign_in_route.dart';

void main() {
  runApp(
    ScheduleApp(),
  );
}

class ScheduleApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData.light().copyWith(),
            routes: {
              '/': (context) => SignInRoute(),
              '/home': (context) => HomeRoute(),
              '/register': (context) =>
                  Scaffold(body: Center(child: Text('NOT AVAILABLE YET'))),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
