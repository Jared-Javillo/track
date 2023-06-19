import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> menuList = [
    "MAPS",
    "ATTENDANCE",
    "SALES",
    "TICKETS",
    "INVENTORY"
  ];

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: d.at(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: d.at(30),
              child: SideScrollableButtonWidget(
                buttonList: menuList,
              ),
            ),
            Divider(
              height: d.at(0),
              indent: 0,
              endIndent: 0,
            ),
            Expanded(
              child: ListView(
                children: [
                  const AttendanceCard(),
                  SizedBox(height: d.at(25)),
                  const ExceptionReportCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final List<String> datesList = ['Today - June 2, 2022'];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = datesList.first;
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const SizedBox.shrink(),
        elevation: 16,
        selectedItemBuilder: (BuildContext context) {
          return [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PanText(
                  text: dropdownValue,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ],
            ),
          ];
        },
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: datesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class SideScrollableButtonWidget extends StatefulWidget {
  final List<String> buttonList;

  const SideScrollableButtonWidget({super.key, required this.buttonList});

  @override
  State<SideScrollableButtonWidget> createState() =>
      _SideScrollableButtonWidgetState();
}

class _SideScrollableButtonWidgetState
    extends State<SideScrollableButtonWidget> {
  List<bool> _selections = [];

  @override
  void initState() {
    super.initState();
    _selections = List<bool>.filled(widget.buttonList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
        isSelected: _selections,
        onPressed: (int index) {
          setState(() {
            _selections = List<bool>.generate(
              widget.buttonList.length,
                  (buttonIndex) => buttonIndex == index,
            );
          });
        },
        selectedColor: Colors.transparent,
        // Customize the selected color
        selectedBorderColor: Colors.transparent,
        fillColor: Colors.transparent,
        // Set to transparent to remove button fill
        borderRadius: BorderRadius.zero,
        // Set the border radius to zero
        borderColor: Colors.transparent,
        // Set the border color to transparent
        children: [
          for (var index = 0; index < widget.buttonList.length; index++)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: d.at(12),
              ),
              child: Container(
                height: d.at(30),
                decoration: BoxDecoration(
                  border: _selections[index]
                      ? Border(
                    bottom: BorderSide(
                      color: AppColors.blueShadow,
                      // Customize the underline color
                      width: d.at(5), // Customize the underline thickness
                    ),
                  )
                      : null,
                ),
                child: PanText(
                  text: widget.buttonList[index],
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: d.at(12),
                  fontColor: _selections[index]
                      ? AppColors.blueFont
                      : AppColors.grey300,
                ),
              ),
            ),
        ], // Add border radius if needed
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
              ), //Attendance
              SizedBox(height: d.at(24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'smiley_green',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: "Timed-in",
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '1,245',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //Timed-In
              SizedBox(height: d.at(16)),
              const Divider(),
              SizedBox(height: d.at(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'time_yellow',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: "Timed-out",
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '0',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //Timed-Out
              SizedBox(height: d.at(16)),
              const Divider(),
              SizedBox(height: d.at(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'x_orange',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: 'Absent',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '1',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //Absent
              SizedBox(height: d.at(16)),
              const Divider(),
              SizedBox(height: d.at(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'umbrella_blue',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: 'On Leave',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '2',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //On Leave
              SizedBox(height: d.at(16)),
              const Divider(),
              SizedBox(height: d.at(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'alarm_purple',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: 'Rest Day',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '1',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //Rest Day
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'exclamation_red',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: 'Late employees',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '18',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //Late employees
              SizedBox(height: d.at(16)),
              const Divider(),
              SizedBox(height: d.at(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'low_accuracy_red',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: 'Low photo accuracy',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '0',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //Low photo accuracy
              SizedBox(height: d.at(16)),
              const Divider(),
              SizedBox(height: d.at(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'mismatch_red',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: 'Location Mismatch',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '1',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //Location Mismatch
              SizedBox(height: d.at(16)),
              const Divider(),
              SizedBox(height: d.at(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PanIcon(
                        icon: 'no_gps_red',
                        width: d.at(28),
                        height: d.at(28),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: d.at(10),
                      ),
                      PanText(
                        text: 'No GPS',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: d.at(12),
                        fontColor: AppColors.blueFont,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: d.at(7)),
                    child: Row(
                      children: [
                        PanText(
                          text: '2',
                          fontFamily: 'Poppins',
                          fontSize: d.at(16),
                          fontWeight: FontWeight.w700,
                          fontColor: AppColors.blueFont,
                        ),
                        SizedBox(
                          width: d.at(10),
                        ),
                        PanIcon(
                          icon: 'chevron_right',
                          width: d.at(5.7),
                          height: d.at(10),
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                  )
                ],
              ), //No GPS
              SizedBox(height: d.at(16)),
            ],
          ),
        ),
      ),
    );
  }
}