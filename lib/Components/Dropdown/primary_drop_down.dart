// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class PrimaryDropDown extends StatelessWidget {
  String dropdownValue;
  List<String> items;
  Function(String?)? value;
  bool isExpanded;
  bool border;
  String hint;
  PrimaryDropDown(
      {required this.dropdownValue,
      required this.items,
      required this.value,
      this.isExpanded = false,
      this.border = false,
      this.hint = "",
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: styleSheet.COLOR.lightGreyColor,
          borderRadius: BorderRadius.circular(border ? 0 : 4),
          border: border ? const Border(bottom: BorderSide()) : null),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: isExpanded,
            hint: hint.isEmpty
                ? null
                : Text(
                    hint,
                    style: view.textFontMedium,
                  ),
            focusColor: Colors.transparent,
            padding: const EdgeInsets.only(right: 15, left: 20),
            value: dropdownValue.isEmpty ? null : dropdownValue,
            items: items
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: view.textFontNormal,
                    ).paddingOnly(right: 15)))
                .toList(),
            onChanged: (val) {
              value!(val);
            }),
      ),
    );
  }
}
