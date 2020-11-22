import 'package:flutter/material.dart';
import 'package:schedule_2/views/home/schedule_body.dart';

import 'app_bar.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScheduleAppBar(),
        ScheduleBody(),
      ],
    );
  }
}
