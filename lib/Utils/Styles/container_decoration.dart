// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spreadx_web/main.dart';

class ContainerDecoration {
  ContainerDecoration._private();

  static final ContainerDecoration _instance = ContainerDecoration._private();

  factory ContainerDecoration() {
    return _instance;
  }

  //  ****************  shadow Section ***************************
  List<BoxShadow> primaryShadow = [
    BoxShadow(
        color: styleSheet.COLOR.greyColor.withOpacity(0.3), blurRadius: 10)
  ];
  List<BoxShadow> secondaryShadow = [
    BoxShadow(
        color: styleSheet.COLOR.greyColor.withOpacity(0.1), blurRadius: 20)
  ];

  //  ****************  Radius Section ***************************

  BorderRadius RADIUS_10 = BorderRadius.circular(10);
  BorderRadius RADIUS_5 = BorderRadius.circular(5);
  BorderRadius RADIUS_20 = BorderRadius.circular(20);
  BorderRadius RADIUS_50 = BorderRadius.circular(50);

  //  ****************  Padding Section ***************************

  EdgeInsets PADDING_5 = const EdgeInsets.all(5);
  EdgeInsets PADDING_10 = const EdgeInsets.all(10);
  EdgeInsets PADDING_20 = const EdgeInsets.all(20);
  EdgeInsets PADDING_40 = const EdgeInsets.all(40);
}
