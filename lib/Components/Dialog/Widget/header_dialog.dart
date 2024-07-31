// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class CustomHeaderDialog extends StatelessWidget {
  String title;
  Widget child;

  CustomHeaderDialog({required this.title, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Dialog(
      child: Container(
        constraints: BoxConstraints(
            minHeight: 350,
            maxHeight: styleSheet.appConfig.getScreenHeight(context) * 0.8),
        width: styleSheet.appConfig.getScreenWidth(context) * view.dialogWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                height: 60,
                color: styleSheet.COLOR.blueColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: styleSheet.TEXT_THEME.fs16Medium
                          .copyWith(color: styleSheet.COLOR.whiteColor),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: styleSheet.COLOR.lightGreyColor),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: styleSheet.COLOR.whiteColor,
                          )),
                    )
                  ],
                ),
              ),
            if (title.isNotEmpty) styleSheet.appConfig.addHeight(20),

            // Widget to add Childs
            child.paddingAll(10)
          ],
        ),
      ),
    );
  }
}
