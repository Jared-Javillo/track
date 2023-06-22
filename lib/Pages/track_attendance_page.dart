import 'package:codepan/resources/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:track/colors.dart';
import 'package:track/widgets/card_item.dart';
import 'package:track/widgets/non_card_item.dart';
import 'package:track/widgets/track_card.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Expanded(
      child: ListView(
        children: [
          const TrackCard(
            title: 'Attendance',
            icon: 'hint',
            child: AttendanceContent(),
          ),
          SizedBox(height: d.at(25)),
          const TrackCard(
            title: 'Exception Report',
            icon: 'hint',
            child: ExceptionReportContent(),
          ),
          SizedBox(height: d.at(25)),
          const NonCardItem(
            title: 'Time-in Trends',
            subtitle: 'less on time today',
            value: '10%',
            icon: 'plus',
          ),
          Divider(height: d.at(28.5)),
          const NonCardItem(
            title: 'Late Trends',
            subtitle: 'less on time today',
            value: '10%',
            icon: 'plus',
          ),
          Divider(height: d.at(28.5)),
          const NonCardItem(
            title: 'Overtime Trends',
            subtitle: 'less on time today',
            value: '10%',
            icon: 'plus',
          ),
          Divider(height: d.at(28.5)),
        ],
      ),
    );
  }
}

class AttendanceContent extends StatelessWidget {
  const AttendanceContent({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: d.at(24)),
        const CardItem(
          icon: 'smiley',
          iconBackgroundColor: AppColors.greenFont,
          label: 'Timed-in',
          value: '1,245',
        ),
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'clock',
          iconBackgroundColor: AppColors.yellowFont,
          label: 'Timed-out',
          value: '0',
        ),
        //Timed-Out
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'circle_x',
          iconBackgroundColor: AppColors.orange1,
          label: 'Absent',
          value: '1',
        ),
        //Absent
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          iconBackgroundColor: AppColors.blueShadow,
          icon: 'umbrella',
          label: 'On leave',
          value: '2',
        ),
        //On Leave
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          iconBackgroundColor: AppColors.purple,
          icon: 'snooze',
          label: 'Rest Day',
          value: '1',
        ),
        //Rest Day
        SizedBox(height: d.at(16)),
      ],
    );
  }
}

class ExceptionReportContent extends StatelessWidget {
  const ExceptionReportContent({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Exception
        SizedBox(height: d.at(24)),
        const CardItem(
          icon: 'exclamation',
          iconBackgroundColor: AppColors.red,
          label: 'Late employees',
          value: '18',
        ), //Late employees
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'broken_image',
          iconBackgroundColor: AppColors.red,
          label: 'Low photo accuracy',
          value: '1',
        ), //Low photo accuracy
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'compare',
          iconBackgroundColor: AppColors.red,
          label: 'Location mismatch',
          value: '2',
        ), //Location Mismatch
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'gps_off',
          iconBackgroundColor: AppColors.red,
          label: 'No GPS',
          value: '18',
        ), //No GPS
        SizedBox(height: d.at(16)),
      ],
    );
  }
}
