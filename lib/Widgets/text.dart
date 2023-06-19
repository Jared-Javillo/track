import 'package:codepan/widgets/loading_placeholder.dart';
import 'package:codepan/widgets/text.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Poppins extends StatelessWidget {
  final double? fontHeight, width, height;
  final bool isSpannable, isRequired;
  final EdgeInsets? margin, padding;
  final TextDecoration? decoration;
  final bool isScalable, isLoading;
  final FontWeight fontWeight;
  final Alignment? alignment;
  final TextAlign? textAlign;
  final Color? fontColor;
  final double fontSize;
  final int? maxLines;
  final String? text;

  const Poppins({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontColor,
    this.fontWeight = FontWeight.normal,
    this.fontHeight,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.maxLines,
    this.textAlign,
    this.decoration,
    this.isSpannable = false,
    this.isRequired = false,
    this.isScalable = true,
    this.isLoading = false,
  });

  factory Poppins.reg({
    required String? text,
    required double fontSize,
    Color? fontColor,
    double? fontHeight,
    double? width,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Alignment? alignment,
    TextAlign? textAlign,
    TextDecoration? decoration,
    int? maxLines,
    bool isSpannable = false,
    bool isRequired = false,
    bool isScalable = true,
    bool isLoading = false,
  }) {
    return Poppins(
      text: text,
      width: width,
      height: height,
      fontSize: fontSize,
      fontColor: fontColor,
      fontHeight: fontHeight,
      fontWeight: FontWeight.normal,
      margin: margin,
      padding: padding,
      alignment: alignment,
      textAlign: textAlign,
      decoration: decoration,
      maxLines: maxLines,
      isSpannable: isSpannable,
      isRequired: isRequired,
      isScalable: isScalable,
      isLoading: isLoading,
    );
  }

  factory Poppins.med({
    required String? text,
    required double fontSize,
    Color? fontColor,
    double? fontHeight,
    double? width,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Alignment? alignment,
    TextAlign? textAlign,
    TextDecoration? decoration,
    int? maxLines,
    bool isSpannable = false,
    bool isRequired = false,
    bool isScalable = true,
    bool isLoading = false,
  }) {
    return Poppins(
      text: text,
      width: width,
      height: height,
      fontSize: fontSize,
      fontColor: fontColor,
      fontHeight: fontHeight,
      fontWeight: FontWeight.w500,
      margin: margin,
      padding: padding,
      alignment: alignment,
      textAlign: textAlign,
      decoration: decoration,
      maxLines: maxLines,
      isSpannable: isSpannable,
      isRequired: isRequired,
      isScalable: isScalable,
      isLoading: isLoading,
    );
  }

  factory Poppins.semi({
    required String? text,
    required double fontSize,
    Color? fontColor,
    double? fontHeight,
    double? width,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Alignment? alignment,
    TextAlign? textAlign,
    TextDecoration? decoration,
    int? maxLines,
    bool isSpannable = false,
    bool isRequired = false,
    bool isScalable = true,
    bool isLoading = false,
  }) {
    return Poppins(
      text: text,
      width: width,
      height: height,
      fontSize: fontSize,
      fontColor: fontColor,
      fontHeight: fontHeight,
      fontWeight: FontWeight.w600,
      margin: margin,
      padding: padding,
      alignment: alignment,
      textAlign: textAlign,
      decoration: decoration,
      maxLines: maxLines,
      isSpannable: isSpannable,
      isRequired: isRequired,
      isScalable: isScalable,
      isLoading: isLoading,
    );
  }

  factory Poppins.bold({
    required String? text,
    required double fontSize,
    Color? fontColor,
    double? fontHeight,
    double? width,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Alignment? alignment,
    TextAlign? textAlign,
    TextDecoration? decoration,
    int? maxLines,
    bool isSpannable = false,
    bool isRequired = false,
    bool isScalable = true,
    bool isLoading = false,
  }) {
    return Poppins(
      text: text,
      width: width,
      height: height,
      fontSize: fontSize,
      fontColor: fontColor,
      fontHeight: fontHeight,
      fontWeight: FontWeight.bold,
      margin: margin,
      padding: padding,
      alignment: alignment,
      textAlign: textAlign,
      decoration: decoration,
      maxLines: maxLines,
      isSpannable: isSpannable,
      isRequired: isRequired,
      isScalable: isScalable,
      isLoading: isLoading,
    );
  }
  @override
  Widget build(BuildContext context) {
    return LoadingPlaceholder(
      isLoading: isLoading,
      child: PanText(
        text: text,
        width: width,
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontHeight: fontHeight,
        fontFamily: 'Poppins',
        fontColor: fontColor ?? AppColors.grey100,
        alignment: alignment ?? Alignment.centerLeft,
        margin: margin,
        padding: padding,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign ?? TextAlign.left,
        decoration: decoration,
        maxLines: maxLines,
        isRequired: isRequired,
        isScalable: isScalable,
        spannable: isSpannable
            ? const SpannableText(
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          identifiers: ['<s>', '</s>'],
        )
            : null,
      ),
    );
  }
}