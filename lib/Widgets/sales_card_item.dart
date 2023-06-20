import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/colors.dart';

class SalesCardItem extends StatelessWidget {
  final String title, subtitle, value;
  final dynamic leading;
  final Widget? titleIcon;
  final Color? valueColor;
  final double? iconSize, spaceBetween;

  const SalesCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.leading,
    this.titleIcon,
    this.spaceBetween,
    this.iconSize,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Padding(
      padding: EdgeInsets.only(top:d.at(8.0),bottom: d.at(8.0), left: d.at(8.0), right: d.at(16.0),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (leading is int) // Check if leading is of type int
                PanText(
                  text: leading.toString(),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: d.at(12),
                  fontColor: AppColors.blueFont,
                ),
              if (leading is Widget) // Check if leading is of type Widget
                leading as Widget, // Check if null
              SizedBox(width: d.at(16)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      titleIcon ?? Container(),
                      FittedBox(
                        child: Container(
                          width: d.at(160),
                          child: PanText(
                            text: title,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: d.at(16),
                            fontColor: AppColors.blueFont,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: spaceBetween ?? d.at(10),
                  ),
                  Row(children: [
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
            ],
          ),
          PanText(
            text: value,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: d.at(12),
            fontColor: valueColor ?? Colors.black,
          ),
        ],
      ),
    );
  }
}
