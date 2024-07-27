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
  PrimaryDropDown(
      {required this.dropdownValue,
      required this.items,
      required this.value,
      this.isExpanded = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Container(
      height: view.primaryBtnMaxHeight,
      decoration: BoxDecoration(
          color: styleSheet.COLOR.lightGreyColor,
          borderRadius: BorderRadius.circular(12)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: isExpanded,
            focusColor: Colors.transparent,
            padding: const EdgeInsets.only(right: 15, left: 20),
            value: dropdownValue,
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
