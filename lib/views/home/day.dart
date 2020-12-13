import 'package:flutter/material.dart';
import 'package:schedule_2/models/card.dart';
import 'package:schedule_2/models/day_convert.dart';

import 'lesson_card_widget.dart';

class Day extends StatelessWidget {
  final List<LessonCard> dayCards;
  const Day({Key key, this.dayCards}) : super(key: key);

  List<Widget> _generateLessons(BuildContext context) {
    final List<Widget> lessons = [];

    if (_isLesson(0)) {
      lessons.add(LessonCardWidget(
          card: dayCards.where((element) => element.number == 0).first));
    }
    if (_isLesson(1)) {
      lessons.add(LessonCardWidget(
          card: dayCards.where((element) => element.number == 1).first));
    }
    if (_isLesson(2)) {
      lessons.add(LessonCardWidget(
          card: dayCards.where((element) => element.number == 2).first));
    }
    if (_isLesson(3)) {
      lessons.add(LessonCardWidget(
          card: dayCards.where((element) => element.number == 3).first));
    }
    if (_isLesson(4)) {
      lessons.add(LessonCardWidget(
          card: dayCards.where((element) => element.number == 4).first));
    }

    //lessons.addAll(dayCards.map((e) => LessonCardWidget(card: e)));
    return lessons;
  }

  bool _isLesson(int n) {
    return dayCards.where((element) => element.number == n).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            DayConvert.getStringFromIndex(dayCards[0].day),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ..._generateLessons(context)
      ],
    );
  }
}
