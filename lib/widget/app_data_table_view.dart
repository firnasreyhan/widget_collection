import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:widget_collection/constant/app_font_weight.dart';

import '../constant/app_colors.dart';
import 'app_text_view.dart';

class AppDataTableView<T> extends GetView {
  final List<String> column;
  final List<DataRow> row;
  final ScrollController controller = ScrollController();
  final double? customWidth;
  final int? currentPage;
  final int? lastPage;
  final VoidCallback? nextPage;
  final VoidCallback? prevPage;
  final DataColumnSortCallback? onSort;
  int? sortColumnIndex;
  bool? sortAscending;

  AppDataTableView({
    super.key,
    required this.column,
    required this.row,
    required this.currentPage,
    required this.lastPage,
    required this.prevPage,
    required this.nextPage,
    this.onSort,
    this.customWidth,
    this.sortColumnIndex,
    this.sortAscending,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth,
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.STROKE,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Scrollbar(
                trackVisibility: true,
                interactive: true,
                controller: controller,
                child: SingleChildScrollView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  dragStartBehavior: DragStartBehavior.down,
                  child: Container(
                    width: constraints.maxWidth * (customWidth ?? 1),
                    padding: const EdgeInsetsDirectional.all(0),
                    child: DataTable(
                      showCheckboxColumn: false,
                      sortColumnIndex: sortColumnIndex ?? 0,
                      sortAscending: sortAscending ?? true,
                      columnSpacing: 16,
                      columns: column
                          .map((e) => customDataColumn(label: e.toString()))
                          .toList(),
                      rows: row,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            AppTextView(text: "Menampilkan halaman ${currentPage} dari ${lastPage}"),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if(currentPage != 1) ...{
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        onPressed: prevPage,
                        icon: const Icon(Icons.navigate_before_rounded),
                        iconSize: 36,
                      ),
                    ),
                  },
                  AppTextView(text: "${currentPage}"),
                  if(currentPage != lastPage) ...{
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        onPressed: nextPage,
                        icon: const Icon(Icons.navigate_next_rounded),
                        iconSize: 36,
                      ),
                    ),
                  },
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  DataColumn customDataColumn({required String label}) {
    return DataColumn(
      onSort: onSort,
      label: AppTextView(
        text: label,
        fontWeight: AppFontWeight.SEMI_BOLD,
        color: AppColors.TEXT_COLOR_GREY,
      ),
    );
  }
}
