import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/elevated.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/colors.dart';
import 'package:track/widgets/titled_card_item.dart';

class TrackCard extends StatelessWidget {
  final String title, icon;
  final Widget child;

  const TrackCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child ,
  });

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Elevated(
      shadowColor: Colors.grey[200],
      shadowBlurRadius: 10,
      radius: 5,
      spreadRadius: 1,
      child: Container(
        padding: EdgeInsets.only(
          top: d.at(16),
          bottom: d.at(16),
          left: d.at(16),
          right: d.at(16),
        ),
        // Add padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PanText(
                  text: title,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: d.at(16),
                  fontColor: AppColors.blueFont,
                ),
                PanIcon(
                  icon: icon,
                  width: d.at(14),
                  height: d.at(14),
                )
              ],
            ),
            SizedBox(height: d.at(12)),
            child,
          ],
        ),
      ),
    );
  }
}
