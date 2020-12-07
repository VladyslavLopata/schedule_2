import 'package:flutter/material.dart';
import 'package:schedule_2/dev/lesson_card_generator.dart';
import 'package:schedule_2/models/card.dart';

import 'day.dart';

class Week extends StatelessWidget {
  Week({Key key, this.number}) : super(key: key);

  final int number;

  List<Day> _generateDays(BuildContext context) {
    final List<LessonCard> weekCards = LessonCardGenerator.cards
        .where((element) => element.week == number)
        .toList();
    final days = weekCards.map((e) => e.day).toSet();
    return days
        .map((e) => Day(
            dayCards: weekCards.where((element) => element.day == e).toList()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _generateDays(context),
    );
  }
}
