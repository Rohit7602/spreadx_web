import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/main.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Center(
            child: Text(
              "Manage your inventory by viewing, create MRN or make stock transfer",
              textAlign: TextAlign.center,
              style: styleSheet.TEXT_THEME.fs12Bold,
            ),
          ),
        ),
        Container(
          width: 3,
          color: styleSheet.COLOR.lightGreyColor,
        ),
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: PrimaryBtnView(
                          btnName: "View Stock", onPressed: () {})),
                ],
              ),
              styleSheet.appConfig.addHeight(10),
              Row(
                children: [
                  Expanded(
                      child: PrimaryBtnView(
                          btnName: "Purchase Products", onPressed: () {})),
                ],
              ),
              styleSheet.appConfig.addHeight(10),
              Row(
                children: [
                  Expanded(
                      child: PrimaryBtnView(
                          btnName: "Purchase History", onPressed: () {})),
                ],
              ),
            ],
          ).paddingAll(10),
        ),
      ],
    );
  }
}
