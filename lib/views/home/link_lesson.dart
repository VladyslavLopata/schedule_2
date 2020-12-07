import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:schedule_2/models/card.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkLesson extends StatelessWidget {
  const LinkLesson({
    Key key,
    @required this.card,
  }) : super(key: key);

  final LessonCard card;

  @override
  Widget build(BuildContext context) {
    return Txt(
      '${card.number + 1}. ${card.name}',
      gesture: Gestures()
        ..onTap(() async {
          await launch(card.link);
        }),
      style: TxtStyle()
        ..textColor(Colors.blueAccent)
        ..overflow.hidden()
        ..fontSize(20),
    );
  }
}
