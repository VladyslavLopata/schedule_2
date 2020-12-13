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
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit');
            },
            icon: const Icon(Icons.add),
            iconSize: 20,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
