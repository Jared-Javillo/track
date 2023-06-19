import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/Widgets/card_item.dart';
import 'package:track/colors.dart';

import '../Widgets/non_card_item.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Expanded(
      child: ListView(
        children: [
          const AttendanceCard(),
          SizedBox(height: d.at(25)),
          const ExceptionReportCard(),
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

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({super.key});

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 0.0,
        maxHeight: double.infinity,
        minWidth: d.at(400),
        maxWidth: d.at(400),
      ),
      child: Card(
        elevation: 4, // Add a shadow effect with elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Set border radius
        ),
        child: Container(
          padding: const EdgeInsets.all(16), // Add padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PanText(
                    text: "Attendance",
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: d.at(16),
                    fontColor: AppColors.blueFont,
                  ),
                  PanIcon(
                    icon: 'hint',
                    width: d.at(20),
                    height: d.at(20),
                  )
                ],
              ),
              //Attendance
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
                label: 'Timed_out',
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
          ),
        ),
      ),
    );
  }
}
class ExceptionReportCard extends StatefulWidget {
  const ExceptionReportCard({super.key});

  @override
  State<ExceptionReportCard> createState() => _ExceptionReportCardState();
}

class _ExceptionReportCardState extends State<ExceptionReportCard> {
  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 0.0,
        maxHeight: double.infinity,
        minWidth: d.at(400),
        maxWidth: d.at(400),
      ),
      child: Card(
        elevation: 4, // Add a shadow effect with elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Set border radius
        ),
        child: Container(
          padding: const EdgeInsets.all(16), // Add padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PanText(
                    text: "Exception Report",
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: d.at(16),
                    fontColor: AppColors.blueFont,
                  ),
                  PanIcon(
                    icon: 'hint',
                    width: d.at(20),
                    height: d.at(20),
                  )
                ],
              ), //Exception
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
          ),
        ),
      ),
    );
  }
}