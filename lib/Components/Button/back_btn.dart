// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';

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
            margin: const EdgeInsets.only(right: 25),
            padding: const EdgeInsets.all(4),
            child: Icon(
              Icons.arrow_back,
              size: view.iconSize,
            ),
          ),
        ),
      ],
    );
  }
}
