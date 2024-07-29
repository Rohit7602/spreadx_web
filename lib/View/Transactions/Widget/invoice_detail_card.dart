import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class InvoiceDetailCard extends StatelessWidget {
  const InvoiceDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Container(
      padding: styleSheet.DECORATION.PADDING_20,
      decoration: BoxDecoration(
          color: styleSheet.COLOR.whiteColor,
          boxShadow: styleSheet.DECORATION.secondaryShadow,
          borderRadius: styleSheet.DECORATION.RADIUS_5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Invoice Details",
            style:
                view.textFontNormal.copyWith(color: styleSheet.COLOR.greyColor),
          ),
          const Divider().paddingSymmetric(vertical: 5),
          Text(
            "Customer Name",
            style: view.textFontNormal,
          ),
          Text(
            "Rohit Verma",
            style: view.textFontBold,
          ),
          styleSheet.appConfig.addHeight(20),
          Text(
            "Invoice no",
            style: view.textFontNormal,
          ),
          Text(
            "# 01",
            style: view.textFontBold,
          ),
          styleSheet.appConfig.addHeight(20),
          Text(
            "Invoice Date",
            style: view.textFontNormal,
          ),
          Text(
            "12 / 06 /24",
            style: view.textFontBold,
          ),
        ],
      ),
    );
  }
}
