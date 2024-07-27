import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/main.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: styleSheet.DECORATION.PADDING_20,
      decoration: BoxDecoration(
          boxShadow: styleSheet.DECORATION.secondaryShadow,
          color: styleSheet.COLOR.whiteColor,
          borderRadius: styleSheet.DECORATION.RADIUS_5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Summary",
            style: styleSheet.TEXT_THEME.fs14Normal
                .copyWith(color: styleSheet.COLOR.greyColor),
          ),
          const Divider().paddingSymmetric(vertical: 5),
          CustomRow(title: "Sub total", trailing: "\u{20B9} 100"),
          styleSheet.appConfig.addHeight(10),
          CustomRow(title: "Discount %", trailing: "\u{20B9} 0.0"),
          styleSheet.appConfig.addHeight(10),
          CustomRow(title: "Total tax %", trailing: "\u{20B9} 5"),
          styleSheet.appConfig.addHeight(10),
          CustomRow(title: "VAT", trailing: "\u{20B9} 10"),
          const Divider().paddingSymmetric(vertical: 5),
          CustomRow(title: "Total", trailing: "\u{20B9} 115"),
        ],
      ),
    );
  }
}
