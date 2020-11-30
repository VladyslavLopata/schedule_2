import 'package:division/division.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DesktopAppBar extends StatelessWidget {
  void _signOut(context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Parent(
              style: ParentStyle()..alignment.centerLeft(),
              child: Txt(
                'Rozklad+',
                style: TxtStyle()
                  ..fontSize(30)
                  ..fontWeight(FontWeight.bold)
                  ..padding(all: 20),
              ),
            ),
            RaisedButton(
              onPressed: () {
                _signOut(context);
              },
              child: Text('Sign Out'),
            )
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
