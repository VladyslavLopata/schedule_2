import 'package:division/division.dart';
import 'package:flutter/material.dart';

class DesktopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..border(bottom: 1, color: Colors.grey)
        ..alignment.centerLeft()
        ..width(MediaQuery.of(context).size.width),
      child: Txt(
        'Розклад',
        style: TxtStyle()
          ..fontSize(30)
          ..fontWeight(FontWeight.bold)
          ..padding(all: 20),
      ),
    );
  }
}
