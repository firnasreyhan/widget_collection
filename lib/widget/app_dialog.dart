import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_collection/constant/app_font_weight.dart';

import '../constant/app_colors.dart';
import 'app_text_view.dart';

abstract class AppDialog {
  static void dialogSuccess(
    String message,
    VoidCallback action,
  ) {
    Get.defaultDialog(
      title: "Selamat",
      barrierDismissible: false,
      titleStyle: const TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 21,
      ),
      middleText: message,
      middleTextStyle: const TextStyle(
        fontFamily: "Montserrat",
        color: Colors.black,
        fontSize: 14,
      ),
      confirm: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        child: ElevatedButton(
          onPressed: action,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.BUTTON_YELLOW),
          ),
          child: const AppTextView(
            text: "Oke",
            fontWeight: AppFontWeight.BOLD,
          ),
        ),
      ),
    );
  }

  static void dialogError(
    String message,
    VoidCallback action,
  ) {
    Get.defaultDialog(
      title: "Terjadi kesalahan",
      barrierDismissible: false,
      titleStyle: const TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 21,
      ),
      middleText: message,
      middleTextStyle: const TextStyle(
        fontFamily: "Montserrat",
        color: Colors.black,
        fontSize: 14,
      ),
      confirm: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        child: ElevatedButton(
          onPressed: action,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.BUTTON_YELLOW),
          ),
          child: const AppTextView(
            text: "Oke",
            fontWeight: AppFontWeight.BOLD,
          ),
        ),
      ),
    );
  }

  static void dialogLoading() {
    Get.defaultDialog(
      title: "",
      barrierDismissible: false,
      content: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 32,
          ),
          AppTextView(
            text: "Loading...",
            fontWeight: AppFontWeight.BOLD,
          ),
        ],
      ),
    );
  }

  static void dialogConfirmation(
    String title,
    String content,
    VoidCallback action,
  ) {
    Get.defaultDialog(
      title: title,
      barrierDismissible: false,
      titleStyle: const TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 21,
      ),
      middleText: content,
      middleTextStyle: const TextStyle(
        fontFamily: "Montserrat",
        color: Colors.black,
        fontSize: 14,
      ),
      confirm: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.BUTTON_YELLOW),
          ),
          onPressed: action,
          child: const AppTextView(
            text: "Iya",
            fontWeight: AppFontWeight.BOLD,
          ),
        ),
      ),
      cancel: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const AppTextView(
            text: "Tidak",
            fontWeight: AppFontWeight.BOLD,
          ),
        ),
      ),
    );
  }

  static void dialogAction(
    String title,
    List<Widget> content,
    String confirmText,
    VoidCallback confirm,
    String cancelText,
    VoidCallback cancel,
  ) {
    Get.dialog(
        AlertDialog(
          scrollable: true,
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 21,
              ),
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          content: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: content,
                ),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: cancel,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: AppTextView(
                          text: cancelText,
                          fontWeight: AppFontWeight.BOLD,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.BUTTON_YELLOW),
                        ),
                        onPressed: confirm,
                        child: AppTextView(
                          text: confirmText,
                          fontWeight: AppFontWeight.BOLD,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        barrierDismissible: false);
  }
}
