import 'package:division/division.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  void _auth(login, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: login, password: password);
      if (userCredential != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String login = '';
    String password = '';
    final headerSize = 60.0;
    final bodySize = MediaQuery.of(context).size.height - headerSize;
    final registrationContainerSize = MediaQuery.of(context).size.height / 3.0;
    var txtStyle = TxtStyle()
      ..border(all: 1, color: Theme.of(context).accentColor)
      ..borderRadius(all: 8)
      ..fontSize(20)
      ..padding(all: 15);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Parent(
          style: ParentStyle()
            ..padding(all: 16)
            ..height(headerSize)
            ..alignmentContent.center()
            ..alignment.center(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt(
                'Rozklad+',
                style: TxtStyle()..fontSize(30),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Sign Up'),
              )
            ],
          ),
        ),
        Container(
          height: bodySize,
          alignment: Alignment.center,
          child: Container(
            height: registrationContainerSize,
            width: MediaQuery.of(context).size.width / 3.0,
            child: Column(
              children: [
                Parent(
                  style: ParentStyle()
                    ..border(all: 1, color: Theme.of(context).accentColor)
                    ..borderRadius(all: 12)
                    ..alignment.center()
                    ..alignmentContent.center()
                    ..padding(all: 20),
                  child: Column(
                    children: [
                      Txt(
                        'Sign In',
                        style: TxtStyle()..fontSize(25),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Txt(
                        '',
                        style: txtStyle
                          ..editable(
                              autoFocus: true,
                              onEditingComplete: () {},
                              placeholder: 'Email',
                              onChange: (text) {
                                login = text;
                              }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Txt('',
                          style: txtStyle.clone()
                            ..editable(
                                maxLines: 1,
                                obscureText: true,
                                placeholder: 'Password',
                                onEditingComplete: () {},
                                onChange: (text) {
                                  password = text;
                                })),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        onPressed: () {
                          _auth(login, password, context);
                        },
                        child: Text("Sign in"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
