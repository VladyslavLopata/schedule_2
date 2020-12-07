// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserLoginModel on _UserLoginModel, Store {
  final _$userLoginStateAtom = Atom(name: '_UserLoginModel.userLoginState');

  @override
  LoginState get userLoginState {
    _$userLoginStateAtom.reportRead();
    return super.userLoginState;
  }

  @override
  set userLoginState(LoginState value) {
    _$userLoginStateAtom.reportWrite(value, super.userLoginState, () {
      super.userLoginState = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserLoginModel.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_UserLoginModel.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$authenticationErrorAtom =
      Atom(name: '_UserLoginModel.authenticationError');

  @override
  bool get authenticationError {
    _$authenticationErrorAtom.reportRead();
    return super.authenticationError;
  }

  @override
  set authenticationError(bool value) {
    _$authenticationErrorAtom.reportWrite(value, super.authenticationError, () {
      super.authenticationError = value;
    });
  }

  final _$passwordCheckAtom = Atom(name: '_UserLoginModel.passwordCheck');

  @override
  String get passwordCheck {
    _$passwordCheckAtom.reportRead();
    return super.passwordCheck;
  }

  @override
  set passwordCheck(String value) {
    _$passwordCheckAtom.reportWrite(value, super.passwordCheck, () {
      super.passwordCheck = value;
    });
  }

  final _$nameAtom = Atom(name: '_UserLoginModel.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$signOutAsyncAction = AsyncAction('_UserLoginModel.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$registerAsyncAction = AsyncAction('_UserLoginModel.register');

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$authenticateAsyncAction = AsyncAction('_UserLoginModel.authenticate');

  @override
  Future<void> authenticate() {
    return _$authenticateAsyncAction.run(() => super.authenticate());
  }

  @override
  String toString() {
    return '''
userLoginState: ${userLoginState},
email: ${email},
password: ${password},
authenticationError: ${authenticationError},
passwordCheck: ${passwordCheck},
name: ${name}
    ''';
  }
}
