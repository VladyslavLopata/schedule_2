import 'package:flutter/material.dart';
import 'package:schedule_2/models.dart/card.dart';
import 'package:schedule_2/views/home/lesson_data.dart';
import 'package:schedule_2/views/home/link_lesson.dart';

class LessonCardWidget extends StatelessWidget {
  final LessonCard card;
  const LessonCardWidget({
    Key key,
    this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width / 7,
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinkLesson(card: card),
              Divider(),
              LessonData(card: card),
            ],
          ),
        ),
      ),
    );
  }
}
