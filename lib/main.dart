import 'package:flutter/material.dart';
import 'package:schedule_2/routes/home_route.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light().copyWith(),
      routes: {
        '/': (context) => HomeRoute(),
      },
    ),
  );
}
