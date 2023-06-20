import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:codepan/widgets/circular.dart';
import 'package:flutter/material.dart';
import 'package:track/colors.dart';

class TitledCardItem extends StatelessWidget {
  final String? title, subtitle;
  final String icon, value;
  final Color? iconColor;

  const TitledCardItem({
    super.key,
    required this.icon,
    required this.value,
    this.title,
    this.subtitle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        title != null
            ? PanText(
                alignment: Alignment.centerLeft,
                text: title,
                fontFamily: 'Poppins',
                fontColor: AppColors.grey300,
                fontSize: d.at(10),
                fontWeight: FontWeight.w700,
              )
            : Container(),
        Row(
          children: [
            Circular(
              diameter: d.at(24),
              color: iconColor ?? AppColors.primary,
              child: PanIcon(
                icon: icon,
                width: d.at(16),
                height: d.at(16),
              ),
            ),
            SizedBox(width: d.at(8)),
            PanText(
              text: value,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: d.at(37),
              fontColor: AppColors.blueFont,
            ),
          ],
        ),
        subtitle != null
            ? PanText(
                alignment: Alignment.centerLeft,
                text: subtitle,
                fontFamily: 'Poppins',
                fontColor: AppColors.greenFont,
                fontSize: d.at(10),
              )
            : const SizedBox(),
      ],
    );
  }
}
