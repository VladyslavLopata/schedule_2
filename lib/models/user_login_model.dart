import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:schedule_2/services/authentication_service.dart';

import '../enums.dart';
part 'user_login_model.g.dart';

class UserLoginModel = _UserLoginModel with _$UserLoginModel;

abstract class _UserLoginModel with Store {
  @observable
  LoginState userLoginState;

  @observable
  String email;

  @observable
  String password;

  @observable
  bool authenticationError;

  @observable
  String passwordCheck;

  @observable
  String name;

  @action
  Future<void> signOut() async {
    await _authenticationService.signOut();
    userLoginState = LoginState.auth;
  }

  String getEmail() {
    return _authenticationService.getUserEmail();
  }

  @action
  Future<void> register() async {
    if (password != passwordCheck ||
        name.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      authenticationError = true;
      return;
    }

    String answer =
        await _authenticationService.signUp(email: email, password: password);

    if (answer.isEmpty) {
      authenticationError = false;
      userLoginState = LoginState.session;
    } else {
      authenticationError = true;
    }
  }

  @action
  Future<void> authenticate() async {
    String answer =
        await _authenticationService.signIn(email: email, password: password);
    if (answer.isEmpty) {
      authenticationError = false;
      userLoginState = LoginState.session;
    } else {
      authenticationError = true;
    }
  }

  AuthenticationService _authenticationService;

  _UserLoginModel() {
    _authenticationService = AuthenticationService(FirebaseAuth.instance);
    userLoginState = _authenticationService.isUserLogon()
        ? LoginState.session
        : LoginState.auth;
    authenticationError = false;
  }
}
