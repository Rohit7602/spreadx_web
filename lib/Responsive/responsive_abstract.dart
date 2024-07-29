// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

abstract class ResponsiveValues {
// ************ Onboarding Responsive ***************

// ************ TextFiled  Responsive ***************

  late double textFieldheight;

  late Size secondarBtnMinWidth;
  late double carousolMaxHeight;
  late double carousolMaxWidth;

// ************ Text Font  Size ***************
  late var textFontNormal;
  late var textFontMedium;
  late var textFontLargeMedium;
  late var textFontBold;
  late var textFontBold_Medium;

// ************ Data Table Size ***************
  late double tableSmallWidth;
  late double tableLargeWidth;

// ************ Login Screen  Responsive ***************

  late double loginContainerHeight;
  late var loginHeadingTextSize;

// ************ Button  Responsive ***************

  late double keyboardBtnSize;
  late double iconSize;
  late double primaryBtnMaxHeight;

// ************ Sales Reports Card Responsive ***************

  late double salesCardMinHeight;
  late double salesCardMinWidth;
  late EdgeInsets salesCardPadding;

// ************ Drawer Card  Responsive ***************
  late double drawerCardAspectRatio;
  late bool drawerTabView;

// ************ Reports Card  Responsive ***************

  late double reportCardAspectRatio;

// ************ Dashboard Summary  Responsive ***************
  late double dashboardSummaryCardWidth;

  late double dashboardProductCardFlex;

// ************ Dialog  Responsive ***************

  late double dialogWidth;
}

// ************ Tab View ***************

class TabView implements ResponsiveValues {
  @override
  double carousolMaxWidth = 400;

  @override
  double carousolMaxHeight = 600;

  @override
  Size secondarBtnMinWidth = const Size(150, 40);

  @override
  double textFieldheight = 40;

  @override
  double tableSmallWidth = 50;

  @override
  double tableLargeWidth = 250;

  @override
  var textFontNormal = styleSheet.TEXT_THEME.fs12Normal;

  @override
  var textFontMedium = styleSheet.TEXT_THEME.fs12Medium;

  @override
  var textFontBold = styleSheet.TEXT_THEME.fs12Bold;

  @override
  double keyboardBtnSize = 12 / 6;

  @override
  double loginContainerHeight = 0.4;

  @override
  var loginHeadingTextSize = styleSheet.TEXT_THEME.fs18Bold;

  @override
  double iconSize = 22;

  @override
  var textFontBold_Medium = styleSheet.TEXT_THEME.fs12Bold;

  @override
  var textFontLargeMedium = styleSheet.TEXT_THEME.fs14Medium;

  @override
  double salesCardMinWidth = 100;

  @override
  double salesCardMinHeight = 80;

  @override
  EdgeInsets salesCardPadding = styleSheet.DECORATION.PADDING_10;

  @override
  double drawerCardAspectRatio = 16 / 6;

  @override
  double primaryBtnMaxHeight = 40;

  @override
  double reportCardAspectRatio = 10 / 3;

  @override
  bool drawerTabView = true;

  @override
  double dashboardSummaryCardWidth = 280;

  @override
  double dialogWidth = 0.6;

  @override
  double dashboardProductCardFlex = 2;
}

// ************ Web View ***************

class WebView implements ResponsiveValues {
  @override
  double carousolMaxWidth = 500;

  @override
  double carousolMaxHeight = 600;

  @override
  Size secondarBtnMinWidth = const Size(150, 45);

  @override
  double textFieldheight = 45;

  @override
  double tableSmallWidth = 100;

  @override
  double tableLargeWidth = 350;

  @override
  var textFontNormal = styleSheet.TEXT_THEME.fs14Normal;

  @override
  var textFontMedium = styleSheet.TEXT_THEME.fs12Medium;

  @override
  var textFontLargeMedium = styleSheet.TEXT_THEME.fs14Medium;

  @override
  var textFontBold = styleSheet.TEXT_THEME.fs14Bold;

  @override
  double keyboardBtnSize = 12 / 5;

  @override
  double loginContainerHeight = 0.7;

  @override
  var loginHeadingTextSize = styleSheet.TEXT_THEME.fs24Bold;

  @override
  double iconSize = 24;

  @override
  var textFontBold_Medium = styleSheet.TEXT_THEME.fs16Bold;

  @override
  double salesCardMinWidth = 130;

  @override
  double salesCardMinHeight = 100;

  @override
  EdgeInsets salesCardPadding = styleSheet.DECORATION.PADDING_20;

  @override
  double drawerCardAspectRatio = 10 / 3.5;

  @override
  double primaryBtnMaxHeight = 50;

  @override
  double reportCardAspectRatio = 16 / 5;

  @override
  bool drawerTabView = false;

  @override
  double dashboardSummaryCardWidth = 320;

  @override
  double dialogWidth = 0.4;

  @override
  double dashboardProductCardFlex = 2;
}

// ************ DeskTop View ***************

class DesktopView implements ResponsiveValues {
  @override
  double carousolMaxWidth = 500;

  @override
  double carousolMaxHeight = 650;

  @override
  Size secondarBtnMinWidth = const Size(200, 50);

  @override
  double textFieldheight = 50;

  @override
  double tableSmallWidth = 150;

  @override
  double tableLargeWidth = 400;

  @override
  var textFontNormal = styleSheet.TEXT_THEME.fs14Normal;

  @override
  var textFontMedium = styleSheet.TEXT_THEME.fs12Medium;

  @override
  var textFontLargeMedium = styleSheet.TEXT_THEME.fs16Medium;

  @override
  var textFontBold = styleSheet.TEXT_THEME.fs16Bold;

  @override
  double keyboardBtnSize = 12 / 5;

  @override
  double loginContainerHeight = 0.4;

  @override
  var loginHeadingTextSize = styleSheet.TEXT_THEME.fs26Bold;

  @override
  double iconSize = 25;

  @override
  var textFontBold_Medium = styleSheet.TEXT_THEME.fs18Bold;

  @override
  double salesCardMinWidth = 130;

  @override
  double salesCardMinHeight = 100;

  @override
  EdgeInsets salesCardPadding = styleSheet.DECORATION.PADDING_20;

  @override
  double drawerCardAspectRatio = 10 / 2;

  @override
  double primaryBtnMaxHeight = 50;

  @override
  double reportCardAspectRatio = 16 / 3;

  @override
  bool drawerTabView = false;

  @override
  double dashboardSummaryCardWidth = 350;

  @override
  double dialogWidth = 0.4;

  @override
  double dashboardProductCardFlex = 1;
}
