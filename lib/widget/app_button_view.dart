import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:widget_collection/constant/app_colors.dart';
import 'package:widget_collection/constant/app_font_weight.dart';

import 'app_text_view.dart';

class AppButtonView extends GetView {
  final String text;
  final Color? textIconColor;
  final Color? buttonColor;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool? isIconOnly;

  const AppButtonView({
    super.key,
    required this.text,
    this.textIconColor,
    this.buttonColor,
    this.icon,
    this.onPressed,
    this.isIconOnly,
  });

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor ?? AppColors.PRIMARY_YELLOW,
              fixedSize: const Size.fromHeight(40),
            ),
            child: AppTextView(
              text: text,
              fontWeight: AppFontWeight.SEMI_BOLD,
              color: textIconColor ?? Colors.white,
            ),
          )
        : isIconOnly == true
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: textIconColor,
                ),
              )
            : ElevatedButton.icon(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  size: 24.0,
                  color: textIconColor ?? Colors.white,
                ),
                label: Container(
                  padding: const EdgeInsets.all(8),
                  child: AppTextView(
                    text: text,
                    fontWeight: AppFontWeight.SEMI_BOLD,
                    color: textIconColor ?? Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor ?? AppColors.PRIMARY_YELLOW,
                ),
              );
  }
}
