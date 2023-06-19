import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/colors.dart';

class NonCardItem extends StatelessWidget {
  final String title, subtitle, icon, value;

  const NonCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Padding(
      padding: EdgeInsets.all(d.at(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PanText(
                text: title,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: d.at(16),
                fontColor: AppColors.blueFont,
              ),
              SizedBox(
                height: d.at(10),
              ),
              Row(children: [
                PanText(
                  text: value,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: d.at(12),
                  fontColor: AppColors.grey300,
                ),
                SizedBox(width: d.at(5)),
                PanText(
                  text: subtitle,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: d.at(12),
                  fontColor: AppColors.grey300,
                ),
              ]),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(right: d.at(7)),
              child: PanIcon(
                icon: 'plus',
                width: d.at(18),
                height: d.at(18),
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
