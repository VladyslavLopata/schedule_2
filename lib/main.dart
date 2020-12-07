import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/models/user_login_model.dart';
import 'package:schedule_2/routes/home_route.dart';
import 'package:schedule_2/routes/sign_in_route.dart';
import 'package:schedule_2/routes/sign_up_route.dart';
import 'package:schedule_2/routes/user_route.dart';
import 'package:schedule_2/services/navigation_service.dart';

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
          return MultiProvider(
            providers: [
              Provider<UserLoginModel>(
                create: (_) => UserLoginModel(),
              ),
              Provider<NavigationService>(
                create: (_) => NavigationService(),
              ),
            ],
            child: MaterialApp(
              theme: ThemeData.light().copyWith(),
              routes: {
                '/': (context) => SignInRoute(),
                '/home': (context) => HomeRoute(),
                '/register': (context) => SignUpRoute(),
                '/user': (context) => UserRoute(),
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
