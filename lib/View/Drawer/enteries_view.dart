// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/main.dart';

class EnteriesDrawerView extends StatelessWidget {
  EnteriesDrawerView({super.key});

  var drawerController = Get.find<DrawersController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: styleSheet.DECORATION.PADDING_20,
        margin: styleSheet.DECORATION.PADDING_20.copyWith(top: 40),
        decoration: BoxDecoration(
          borderRadius: styleSheet.DECORATION.RADIUS_10,
          color: styleSheet.COLOR.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Transaction Type",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    styleSheet.appConfig.addHeight(10),
                    const Divider(),
                    styleSheet.appConfig.addHeight(15),
                    const Text("Supplier Payment"),
                    styleSheet.appConfig.addHeight(25),
                    const Text("Customer Sales"),
                  ],
                )),
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Source",
                        style: styleSheet.TEXT_THEME.fs14Bold
                            .copyWith(color: styleSheet.COLOR.blackColor)),
                    styleSheet.appConfig.addHeight(10),
                    const Divider(),
                    styleSheet.appConfig.addHeight(15),
                    const Text("PIN967"),
                    styleSheet.appConfig.addHeight(25),
                    const Text("Manually Added"),
                  ],
                )),
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Description",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    styleSheet.appConfig.addHeight(10),
                    const Divider(),
                    styleSheet.appConfig.addHeight(15),
                    const Text("Supplier Payment [Invoice"),
                    styleSheet.appConfig.addHeight(25),
                    const Text("234"),
                  ],
                )),
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Date",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    styleSheet.appConfig.addHeight(10),
                    const Divider(),
                    styleSheet.appConfig.addHeight(15),
                    Text(DateTime.now().toString()),
                    styleSheet.appConfig.addHeight(25),
                    Text(DateTime.now().toString()),
                  ],
                )),
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Amount",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    styleSheet.appConfig.addHeight(10),
                    const Divider(),
                    styleSheet.appConfig.addHeight(15),
                    const Text("AED 77.0"),
                    styleSheet.appConfig.addHeight(25),
                    const Text("AED 234.00"),
                  ],
                )),
          ],
        ));
  }
}
