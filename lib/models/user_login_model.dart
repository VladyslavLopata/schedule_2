import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:schedule_2/services/authentication_service.dart';

import '../enums.dart';
import 'card.dart';
part 'user_login_model.g.dart';

class UserLoginModel = _UserLoginModel with _$UserLoginModel;

abstract class _UserLoginModel with Store {
  @observable
  bool authenticationError;

  @observable
  String email;

  @observable
  String name;

  @observable
  String password;

  @observable
  String passwordCheck;

  @observable
  LoginState userLoginState;

  final FirebaseFirestore _storage = FirebaseFirestore.instance;

  AuthenticationService _authenticationService;

  @action
  Future<void> signOut() async {
    await _authenticationService.signOut();
    userLoginState = LoginState.auth;
  }

  String getEmail() {
    return _authenticationService.getUserEmail();
  }

  LessonCard _getLessonData(dynamic data) {
    return LessonCard(
      week: data['week'] as int,
      day: data['day'] as int,
      link: data['link'] as String,
      name: data['name'] as String,
      number: data['start time'] as int,
      teacher: data['teacher'] as String,
    );
  }

  Future<List<LessonCard>> loadDays() async {
    final CollectionReference lessonTable = _storage.collection('Lessons');
    final QuerySnapshot query =
        await lessonTable.where('start time', isGreaterThan: -1).get();
    final List<LessonCard> res = [];
    for (final QueryDocumentSnapshot snapshot in query.docs) {
      res.add(_getLessonData(snapshot.data()));
    }
    return res;
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

    final String answer =
        await _authenticationService.signUp(email: email, password: password);

    if (answer.isEmpty) {
      authenticationError = false;
      final CollectionReference usersTable = _storage.collection('Users');
      await usersTable.doc(email).set({
        'Full Name': name,
      });
      userLoginState = LoginState.session;
    } else {
      authenticationError = true;
    }
  }

  Future<void> registerLesson(LessonCard card) async {
    final CollectionReference usersTable = _storage.collection('Lessons');
    await usersTable.doc(card.name).set({
      'day': card.day,
      'link': card.link,
      'name': card.name,
      'start time': card.number,
      'teacher': card.teacher,
      'week': card.week
    });
  }

  @action
  Future<void> authenticate() async {
    final String answer =
        await _authenticationService.signIn(email: email, password: password);
    if (answer.isEmpty) {
      authenticationError = false;
      userLoginState = LoginState.session;
    } else {
      authenticationError = true;
    }
  }

  _UserLoginModel() {
    _authenticationService = AuthenticationService(FirebaseAuth.instance);
    userLoginState = _authenticationService.isUserLogon()
        ? LoginState.session
        : LoginState.auth;
    authenticationError = false;
  }
}
