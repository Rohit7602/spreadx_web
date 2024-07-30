// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class BackButtonView extends StatelessWidget {
  Function? onpressed;
  BackButtonView({this.onpressed, super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            onpressed != null ? onpressed!() : Get.back();
          },
          child: Container(
            padding: styleSheet.DECORATION.PADDING_5,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: styleSheet.COLOR.primaryDarkBGColor),
            child: Icon(
              Icons.arrow_back,
              size: view.iconSize,
              color: styleSheet.COLOR.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
