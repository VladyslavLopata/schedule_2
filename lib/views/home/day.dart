import 'package:flutter/material.dart';
import 'package:schedule_2/models.dart/card.dart';
import 'package:schedule_2/models.dart/day_convert.dart';

import 'lesson_card_widget.dart';

class Day extends StatelessWidget {
  final List<LessonCard> dayCards;
  const Day({Key key, this.dayCards}) : super(key: key);

  List<Widget> _generateLessons(BuildContext context) {
    List<Widget> lessons = List();
    lessons.add(
      Container(
        margin: EdgeInsets.only(left: 20),
        child: Text(
          DayConvert.getStringFromIndex(dayCards[0].day),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
    lessons.add(
      SizedBox(
        height: 20,
      ),
    );

    lessons.addAll(dayCards.map((e) => LessonCardWidget(card: e)));
    return lessons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _generateLessons(context),
      ),
    );
  }
}
