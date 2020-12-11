import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/models/card.dart';
import 'package:schedule_2/models/user_login_model.dart';

import 'day.dart';

class Week extends StatelessWidget {
  const Week({Key key, this.number}) : super(key: key);

  final int number;

// final List<LessonCard> weekCards = LessonCardGenerator.cards
//         .where((element) => element.week == number)
//         .toList();
//     final days = weekCards.map((e) => e.day).toSet();
//     return days
//         .map((e) => Day(
//             dayCards: weekCards.where((element) => element.day == e).toList()))
//         .toList();

  Future<List<Day>> _generateDays(BuildContext context) async {
    final UserLoginModel model = Provider.of<UserLoginModel>(context);
    final List<LessonCard> weekCards = await model.loadDays();

    final List<LessonCard> currentWeekCards =
        weekCards.where((element) => element.week == number).toList();
    final List<int> days = currentWeekCards.map((e) => e.day).toSet().toList();
    days.sort();
    return days
        .map((e) => Day(
            dayCards:
                currentWeekCards.where((element) => element.day == e).toList()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _generateDays(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: snapshot.data as List<Day>,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
