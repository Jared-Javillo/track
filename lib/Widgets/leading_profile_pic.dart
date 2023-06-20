import 'package:codepan/resources/dimensions.dart';
import 'package:codepan/widgets/circular.dart';
import 'package:codepan/widgets/elevated.dart';
import 'package:codepan/widgets/icon.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:track/colors.dart';

class LeadingProfilePic extends StatelessWidget {
  final String? leadingText, icon;
  final Color? frameColor;
  final String image;

  const LeadingProfilePic({
    super.key,
    required this.image,
    this.leadingText,
    this.icon,
    this.frameColor,
  });

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return Row(
      children: [
        if (leadingText != null)
          PanText(
            text: leadingText!,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: d.at(12),
            fontColor: AppColors.blueFont,
          ),
        SizedBox(width: d.at(8)),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            Circular(
              diameter: d.at(36),
              color: frameColor ?? Colors.transparent,
              child: Image.asset('assets/images/$image.png'),
            ),
            if (icon != null)
              Positioned(
                bottom: d.at(-5),
                child: PanIcon(
                  icon: icon!,
                  width: d.at(16),
                  height: d.at(16),
                ),
            ),
          ],
        ),
      ],
    );
  }
}
