import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:schedule_2/views/home/desktop/desktop_app_bar.dart';
import 'package:schedule_2/views/home/mobile/mobile_app_bar.dart';

class ScheduleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isMobile) {
          return MobileAppBar();
        } else {
          return DesktopAppBar();
        }
      },
    );
  }
}
