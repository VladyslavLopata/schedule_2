import 'package:flutter/material.dart';
import 'package:schedule_2/models/card.dart';
import 'package:schedule_2/models/day_convert.dart';

class LessonData extends StatelessWidget {
  const LessonData({Key key, this.card}) : super(key: key);
  final LessonCard card;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Початок: ${DayConvert.getStringTimeFromNumber(card.number)}',
        style: const TextStyle(fontSize: 20),
      ),
      Text(
        'Викладач: ${card.teacher}',
        style: const TextStyle(fontSize: 20),
      ),
    ]);
  }
}
