import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/enums.dart';
import 'package:schedule_2/models/user_login_model.dart';
import 'package:schedule_2/services/navigation_service.dart';
import 'package:schedule_2/views/user/user_body.dart';

class UserRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserLoginModel>(context);
    final navigator = Provider.of<NavigationService>(context);
    if (model.userLoginState != LoginState.session) {
      Future.microtask(
        () => navigator.renavigate(model.userLoginState, context),
      );
    }

    return Scaffold(
      body: UserBody(),
    );
  }
}
