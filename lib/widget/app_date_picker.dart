import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';
import '../constant/app_font_size.dart';
import '../constant/app_utils.dart';

class AppDatePicker extends GetView {
  final String hint;
  final String date;
  final GestureTapCallback action;
  final bool? isReadOnly;

  const AppDatePicker(
      {super.key,
      required this.hint,
      required this.date,
      required this.action,
      this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap: action,
          controller: TextEditingController(
            text: date.isNotEmpty ? AppUtils.reformatDate(date) : "",
          ),
          readOnly: true,
          obscureText: false,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: bodyFontSize(context).toDouble()),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: isReadOnly == true ? AppColors.DISABLE : Colors.white,
            hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.normal,
                color: Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.BORDER_COLOR, width: 1),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.amber,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsetsDirectional.all(16),
            suffixIcon:
                const Icon(Icons.calendar_month_rounded, color: Colors.black),
          ),
          keyboardType: TextInputType.text,
        )
      ],
    );
  }

  int bodyFontSize(BuildContext context) {
    return context.responsiveValue(
        desktop: AppFontSize.D_BODY,
        tablet: AppFontSize.P_BODY,
        mobile: AppFontSize.P_BODY);
  }
}
