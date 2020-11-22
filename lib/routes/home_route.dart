import 'package:flutter/material.dart';
import 'package:schedule_2/views/home/home_body.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}
