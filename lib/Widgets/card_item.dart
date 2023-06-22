import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/circular.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/colors.dart';

class CardItem extends StatelessWidget {
  final String icon, label, value;
  final Color? iconBackgroundColor;

  const CardItem({
    super.key,
    required this.icon,
    this.iconBackgroundColor = AppColors.grey300,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Circular(
              diameter: d.at(28),
              color: iconBackgroundColor,
              padding: EdgeInsets.all(d.at(5)),
              child: PanIcon(
                icon: icon,
                width: d.at(28),
                height: d.at(28),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              width: d.at(10),
            ),
            PanText(
              text: label,
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
                text: value,
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
    );
  }
}
