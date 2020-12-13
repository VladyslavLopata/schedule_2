import 'package:flutter/material.dart';
import 'package:schedule_2/models/card.dart';
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
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                LinkLesson(card: card),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit',
                        arguments: <String, dynamic>{'card': card});
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                )
              ]),
              const Divider(),
              LessonData(card: card),
            ],
          ),
        ),
      ),
    );
  }
}
