import 'package:flutter/material.dart';

import '../enums.dart';

class NavigationService {
  void renavigate(LoginState loginState, BuildContext context) {
    switch (loginState) {
      case LoginState.auth:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case LoginState.register:
        Navigator.pushReplacementNamed(context, '/register');
        break;
      case LoginState.session:
        Navigator.pushReplacementNamed(context, '/home');
        break;
    }
  }
}
