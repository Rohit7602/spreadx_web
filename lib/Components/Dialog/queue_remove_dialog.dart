// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/main.dart';

class QueueRemoveDialog extends StatelessWidget {
  Function() onTap;
  QueueRemoveDialog({required this.onTap, super.key});

  var queueList = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: styleSheet.DECORATION.RADIUS_50),
      backgroundColor: styleSheet.COLOR.bgLightBlueColor2,
      child: Container(
        width: styleSheet.appConfig.getScreenWidth(context) * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            color: styleSheet.COLOR.bgLightBlueColor2,
            boxShadow: styleSheet.DECORATION.primaryShadow,
            borderRadius: styleSheet.DECORATION.RADIUS_50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Alert", style: styleSheet.TEXT_THEME.fs20Bold),
            styleSheet.appConfig.addHeight(10),
            Text("Order No: #SO4430001 will be cancelled, continue?",
                style: styleSheet.TEXT_THEME.fs14Medium),
            styleSheet.appConfig.addHeight(60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    child: Text(
                      "Back",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.primaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                TextButton(
                    child: Text(
                      "Confirm",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.primaryColor),
                    ),
                    onPressed: () {
                      onTap();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyQueueDialog extends StatelessWidget {
  const EmptyQueueDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: styleSheet.DECORATION.RADIUS_50),
      backgroundColor: styleSheet.COLOR.bgLightBlueColor2,
      child: Container(
        width: styleSheet.appConfig.getScreenWidth(context) * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            color: styleSheet.COLOR.bgLightBlueColor2,
            boxShadow: styleSheet.DECORATION.primaryShadow,
            borderRadius: styleSheet.DECORATION.RADIUS_50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Alert", style: styleSheet.TEXT_THEME.fs20Bold),
            styleSheet.appConfig.addHeight(10),
            Text("Cart is Empty.", style: styleSheet.TEXT_THEME.fs14Medium),
            styleSheet.appConfig.addHeight(60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    child: Text(
                      "OK",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.primaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
