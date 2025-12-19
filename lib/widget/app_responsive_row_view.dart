import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppWidget {
  static Widget rowItem({
    required BoxConstraints constraints,
    required BuildContext context,
    required List<Widget> widget1,
    List<Widget>? widget2,
  }) {
    return context.responsiveValue(
      desktop: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: rowSubItem(
          constraints: constraints,
          context: context,
          widget1: widget1,
          widget2: widget2,
        ),
      ),
      tablet: Column(
        children: rowSubItem(
          constraints: constraints,
          context: context,
          widget1: widget1,
          widget2: widget2,
        ),
      ),
      mobile: Column(
        children: rowSubItem(
          constraints: constraints,
          context: context,
          widget1: widget1,
          widget2: widget2,
        ),
      ),
    );
  }

  static List<Widget> rowSubItem({
    required BoxConstraints constraints,
    required BuildContext context,
    required List<Widget> widget1,
    List<Widget>? widget2,
  }) {
    return [
      SizedBox(
        width: context.responsiveValue(
          desktop: constraints.maxWidth * 0.475,
          mobile: constraints.maxWidth,
          tablet: constraints.maxWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget1,
        ),
      ),
      if (widget2 != null) ...[
        context.responsiveValue(
          desktop: SizedBox(width: constraints.maxWidth * 0.05),
          tablet: const SizedBox(height: 16),
          mobile: const SizedBox(height: 16),
        ),
        SizedBox(
          width: context.responsiveValue(
            desktop: constraints.maxWidth * 0.475,
            mobile: constraints.maxWidth,
            tablet: constraints.maxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget2,
          ),
        ),
      ],
    ];
  }
}