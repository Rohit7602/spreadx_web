import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/main.dart';

class InvoiceView extends StatelessWidget {
  void Function() onPressedBack;

  InvoiceView({required this.onPressedBack, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: onPressedBack, icon: const Icon(Icons.arrow_back)),
        ),
        styleSheet.appConfig.addHeight(30),
        const Text("bot#werwrmwer"),
        styleSheet.appConfig.addHeight(10),
        Text(
          "PURCHASE INVOICE",
          style: styleSheet.TEXT_THEME.fs14Bold,
        ),
        styleSheet.appConfig.addHeight(30),
        CustomRow(
            title: DateTime.now().toIso8601String(), trailing: "PIN93849"),
        styleSheet.appConfig.addHeight(5),
        const Divider(),
        styleSheet.appConfig.addHeight(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item",
                    style: styleSheet.TEXT_THEME.fs14Bold,
                  ),
                  styleSheet.appConfig.addHeight(5),
                  Text(
                    "default",
                    style: styleSheet.TEXT_THEME.fs14Medium,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "Qty/Wt",
                    style: styleSheet.TEXT_THEME.fs14Bold,
                  ),
                  styleSheet.appConfig.addHeight(5),
                  Text(
                    "2.0",
                    style: styleSheet.TEXT_THEME.fs14Medium,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "Rate",
                    style: styleSheet.TEXT_THEME.fs14Bold,
                  ),
                  styleSheet.appConfig.addHeight(5),
                  Text(
                    "0.0",
                    style: styleSheet.TEXT_THEME.fs14Medium,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "Total",
                    style: styleSheet.TEXT_THEME.fs14Bold,
                  ),
                  styleSheet.appConfig.addHeight(5),
                  Text(
                    "0.0",
                    style: styleSheet.TEXT_THEME.fs14Medium,
                  ),
                ],
              ),
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(10),
        const Divider(),
        styleSheet.appConfig.addHeight(10),
        CustomRow(title: "Sub Total", trailing: "0.0"),
        styleSheet.appConfig.addHeight(10),
        CustomRow(title: "Discount", trailing: "0.0"),
        styleSheet.appConfig.addHeight(10),
        CustomRow(title: "Net Total", trailing: "0.0"),
        styleSheet.appConfig.addHeight(10),
        CustomRow(title: "Grand Total", trailing: "AED 0.0"),
        styleSheet.appConfig.addHeight(30),
        Row(
          children: [
            PrimaryBtnWithIcon(
                isExpanded: true,
                btnName: "New Sale",
                onPressed: () {},
                icon: Icons.home),
            styleSheet.appConfig.addWidth(15),
            PrimaryBtnWithIcon(
                isExpanded: true,
                btnName: "Share",
                onPressed: () {
                  styleSheet.appConfig.shareNow();
                },
                icon: Icons.share),
          ],
        )
      ],
    ).paddingAll(20);
  }
}
