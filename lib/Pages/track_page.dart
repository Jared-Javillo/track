import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/Pages/track_attendance_page.dart';
import 'package:track/Pages/track_sales_page.dart';
import 'package:track/colors.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  final List<String> menuList = [
    "MAPS",
    "ATTENDANCE",
    "SALES",
    "TICKETS",
    "INVENTORY"
  ];
  final List<Widget> pages = [
    Container(),
    const AttendancePage(),
    const TrackSalesPage(),
    Container(),
    Container(),
  ];
  static int selectedPage = 1;
  List<bool> _selections = [];

  @override
  void initState() {
    super.initState();
    _selections = List<bool>.filled(menuList.length, false);
    _selections[1] = true;
  }

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: d.at(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: d.at(30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  isSelected: _selections,
                  onPressed: (int index) {
                    setState(() {
                      _selections = List<bool>.generate(
                        menuList.length,
                        (buttonIndex) => buttonIndex == index,
                      );
                      _TrackPageState.selectedPage = index;
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
                    for (var index = 0; index < menuList.length; index++)
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
                                      width: d.at(
                                          5), // Customize the underline thickness
                                    ),
                                  )
                                : null,
                          ),
                          child: PanText(
                            text: menuList[index],
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
              ),
            ),
            Divider(
              height: d.at(0),
              indent: 0,
              endIndent: 0,
            ),
            pages[selectedPage],
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