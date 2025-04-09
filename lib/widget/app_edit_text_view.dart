import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../constant/app_colors.dart';
import '../constant/app_font_size.dart';

class AppEditTextView extends GetView {
  final TextEditingController textEditingController;
  final String hint;
  final bool? isPassword;
  final bool? isPasswordVisible;
  final bool? isReadOnly;
  final bool? isNumber;
  final bool? isCurrency;
  final bool? isShowIcon;
  final bool? isMultiline;
  final GestureTapCallback? onTap;
  final ValueChanged? onChanged;

  const AppEditTextView({
    super.key,
    required this.textEditingController,
    required this.hint,
    this.isPassword,
    this.isPasswordVisible,
    this.isReadOnly,
    this.isNumber,
    this.isCurrency,
    this.isMultiline,
    this.isShowIcon,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly == true ? true : false,
      controller: textEditingController,
      onChanged: onChanged,
      minLines: isMultiline == true ? 10 : null,
      maxLines: isMultiline == true ? 10 : 1,
      obscureText: isPassword == true
          ? isPasswordVisible == true
              ? false
              : true
          : false,
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
        suffixIcon: isPassword == true
            ? GestureDetector(
                onTap: onTap,
                child: Icon(isPasswordVisible == true
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded),
              )
            : isNumber == true
                ? isShowIcon == true
                    ? const Icon(Icons.percent_rounded)
                    : null
                : null,
      ),
      keyboardType: isNumber == true
          ? TextInputType.number
          : isMultiline == true
              ? TextInputType.multiline
              : TextInputType.text,
      inputFormatters: [
        if (isNumber == true) ...{
          FilteringTextInputFormatter.allow(RegExp('[0-9\.]'))
        },
        if (isCurrency == true) ...{
          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
        },
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
