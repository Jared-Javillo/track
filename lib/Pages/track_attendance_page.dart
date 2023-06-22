import 'package:codepan/resources/dimensions.dart';
import 'package:flutter/material.dart';
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
          icon: 'smiley_green',
          label: 'Timed-in',
          value: '1,245',
        ),
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'time_yellow',
          label: 'Timed-out',
          value: '0',
        ),
        //Timed-Out
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'x_orange',
          label: 'Absent',
          value: '1',
        ),
        //Absent
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'umbrella_blue',
          label: 'On leave',
          value: '2',
        ),
        //On Leave
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'alarm_purple',
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
          icon: 'exclamation_red',
          label: 'Late employees',
          value: '18',
        ), //Late employees
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'low_accuracy_red',
          label: 'Low photo accuracy',
          value: '1',
        ), //Low photo accuracy
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'mismatch_red',
          label: 'Location mismatch',
          value: '2',
        ), //Location Mismatch
        SizedBox(height: d.at(16)),
        const Divider(),
        SizedBox(height: d.at(16)),
        const CardItem(
          icon: 'no_gps_red',
          label: 'No GPS',
          value: '18',
        ), //No GPS
        SizedBox(height: d.at(16)),
      ],
    );
  }
}
