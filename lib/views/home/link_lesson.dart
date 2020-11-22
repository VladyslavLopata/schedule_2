import 'package:flutter/material.dart';
import 'package:schedule_2/models.dart/card.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkLesson extends StatelessWidget {
  const LinkLesson({
    Key key,
    @required this.card,
  }) : super(key: key);

  final LessonCard card;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launch(card.link);
      },
      child: Expanded(
        child: Text(
          '${card.number + 1}. ${card.name}',
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 20),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
