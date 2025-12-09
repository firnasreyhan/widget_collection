import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:widget_collection/widget/app_text_view.dart';

import '../constant/app_colors.dart';

class AppDropdownView<T> extends GetView {
  final String searchHint;
  final List<T> data;
  final ValueChanged<T?> onChanged;
  final DropdownSearchItemAsString<T>? itemAsString;
  final bool showClearButton;
  final DropdownSearchBuilder<T> dropdownSearchBuilder;
  final T? selectedItem;

  const AppDropdownView({
    super.key,
    required this.searchHint,
    required this.data,
    required this.onChanged,
    required this.showClearButton,
    required this.dropdownSearchBuilder,
    this.selectedItem,
    this.itemAsString,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      clearButtonProps: ClearButtonProps(
        icon: const Icon(
          Icons.clear,
        ),
        color: Colors.black,
        isVisible: showClearButton,
      ),
      dropdownBuilder: dropdownSearchBuilder,
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: searchHint,
            hintStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.BORDER_COLOR, width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        itemBuilder: (context, item, isSelected) {
          final text =
              itemAsString != null ? itemAsString!(item) : item.toString();
          return AppTextView(
            text: text,
          );
        },
      ),
      items: data,
      onChanged: onChanged,
      selectedItem: selectedItem,
      itemAsString: itemAsString,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: searchHint,
          hintStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.BORDER_COLOR, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          counterStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          errorStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          floatingLabelStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          helperStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          labelStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          prefixStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          suffixStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
              color: Colors.grey),
        ),
      ),
    );
  }
}
