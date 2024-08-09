import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/main.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        styleSheet.appConfig.addHeight(30),
        const Text("bot#werwrmwer"),
        styleSheet.appConfig.addHeight(10),
        Text(
          "PURCHASE INVOICE",
          style: styleSheet.TEXT_THEME.fs12Bold,
        ),
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
                onPressed: () {},
                icon: Icons.share),
          ],
        )
      ],
    ).paddingAll(20);
  }
}
