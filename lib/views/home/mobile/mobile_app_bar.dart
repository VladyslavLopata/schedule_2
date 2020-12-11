import 'package:division/division.dart';
import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..alignmentContent.center()
        ..padding(all: 20)
        ..background.color(Colors.blue),
      child: Txt(
        'Розклад',
        style: TxtStyle()
          ..fontSize(30)
          ..fontWeight(FontWeight.bold)
          ..textColor(Colors.white),
      ),
    );
  }
}
