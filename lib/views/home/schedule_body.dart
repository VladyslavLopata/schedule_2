import 'package:flutter/material.dart';
import 'package:schedule_2/views/home/week.dart';

class ScheduleBody extends StatelessWidget {
  int _getWeekShowing() {
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 30,
      ),
      Week(
        number: _getWeekShowing(),
      ),
    ]);
  }
}
