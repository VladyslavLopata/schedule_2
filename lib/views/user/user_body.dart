import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/models/user_login_model.dart';

class UserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserLoginModel>(context);
    return Center(
      child: Text('Особистий кабінет користувача ${model.getEmail()}'),
    );
  }
}
