import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
