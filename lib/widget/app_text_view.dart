import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:widget_collection/constant/app_colors.dart';
import 'package:widget_collection/constant/app_font_weight.dart';

import '../constant/app_font_size.dart';

class AppTextView extends GetView {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final int? headingSize;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const AppTextView({
    super.key,
    required this.text,
    this.headingSize,
    this.fontWeight,
    this.color,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          fontFamily: 'Montserrat',
          color: color ?? AppColors.TEXT_COLOR,
          fontWeight: fontWeight ?? AppFontWeight.REGULAR,
          fontSize: fontSize(context).toDouble()),
    );
  }

  int fontSize(BuildContext context) {
    if (headingSize != null) {
      switch (headingSize) {
        case 1:
          {
            var size = context.responsiveValue(
              desktop: AppFontSize.D_H1,
              mobile: AppFontSize.P_H1,
              tablet: AppFontSize.P_H1,
            );

            return size;
          }
        case 2:
          {
            var size = context.responsiveValue(
              desktop: AppFontSize.D_H2,
              mobile: AppFontSize.P_H2,
              tablet: AppFontSize.P_H2,
            );

            return size;
          }
        case 3:
          {
            var size = context.responsiveValue(
              desktop: AppFontSize.D_H3,
              mobile: AppFontSize.P_H3,
              tablet: AppFontSize.P_H3,
            );

            return size;
          }
        case 4:
          {
            var size = context.responsiveValue(
              desktop: AppFontSize.D_H4,
              mobile: AppFontSize.P_H4,
              tablet: AppFontSize.P_H4,
            );

            return size;
          }
        case 5:
          {
            var size = context.responsiveValue(
              desktop: AppFontSize.D_H5,
              mobile: AppFontSize.P_H5,
              tablet: AppFontSize.P_H5,
            );

            return size;
          }
        case 6:
          {
            var size = context.responsiveValue(
              desktop: AppFontSize.D_H6,
              mobile: AppFontSize.P_H6,
              tablet: AppFontSize.P_H6,
            );

            return size;
          }
        default:
          {
            var size = context.responsiveValue(
              desktop: AppFontSize.D_H1,
              mobile: AppFontSize.P_H1,
              tablet: AppFontSize.P_H1,
            );

            return size;
          }
      }
    } else {
      var size = context.responsiveValue(
        desktop: AppFontSize.D_BODY,
        mobile: AppFontSize.P_BODY,
        tablet: AppFontSize.P_BODY,
      );

      return size;
    }
  }
}
