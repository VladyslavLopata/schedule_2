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
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 7 - 72),
      child: InkWell(
        onTap: () async {
          if (card.link.startsWith('www.')) {
            card.link = 'http://${card.link}';
          }
          if (!card.link.startsWith('http')) {
            card.link = 'https://${card.link}';
          }
          await launch(card.link);
        },
        child: Expanded(
            child: Text(
          '${card.number + 1}. ${card.name}',
          overflow: TextOverflow.fade,
          softWrap: true,
          style: const TextStyle(color: Colors.blueAccent, fontSize: 20),
        )),
      ),
    );

    // Txt(
    //   '${card.number + 1}. ${card.name}',
    //   gesture: Gestures()
    //     ..onTap(() async {
    //       await launch(card.link);
    //     }),
    //   style: TxtStyle()
    //     ..textColor(Colors.blueAccent)
    //     ..overflow.hidden()
    //     ..fontSize(20),
    // );
  }
}
