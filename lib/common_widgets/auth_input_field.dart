import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
        ),
      ),
    );
  }
}
