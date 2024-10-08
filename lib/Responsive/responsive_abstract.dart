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

  /// *******DASHBOARD GRID BUTTONS RESPONSIVE ***********
  late int crossCount;
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
  var textFontMedium = styleSheet.TEXT_THEME.fs14Medium;

  @override
  var textFontBold = styleSheet.TEXT_THEME.fs12Bold;

  @override
  double keyboardBtnSize = 12 / 6;

  @override
  double loginContainerHeight = 0.4;

  @override
  var loginHeadingTextSize = styleSheet.TEXT_THEME.fs18Bold
      .copyWith(color: styleSheet.COLOR.primaryColor);

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
  @override
  double reportCardAspectRatio = 10 / 3;

  @override
  bool drawerTabView = true;

  @override
  double dashboardSummaryCardWidth = 260;

  @override
  double dialogWidth = 0.4;

  @override
  double dashboardProductCardFlex = 2;

  @override
  int crossCount = 3;
}

// ************ Web View ***************

class WebView implements ResponsiveValues {
  @override
  double carousolMaxWidth = 500;

  @override
  double carousolMaxHeight = 600;

  @override
  Size secondarBtnMinWidth = const Size(150, 40);

  @override
  double textFieldheight = 40;

  @override
  double tableSmallWidth = 60;

  @override
  double tableLargeWidth = 350;

  @override
  var textFontNormal = styleSheet.TEXT_THEME.fs14Normal;

  @override
  var textFontMedium = styleSheet.TEXT_THEME.fs14Medium;

  @override
  var textFontLargeMedium = styleSheet.TEXT_THEME.fs14Medium;

  @override
  var textFontBold = styleSheet.TEXT_THEME.fs14Bold;

  @override
  double keyboardBtnSize = 12 / 7;

  @override
  double loginContainerHeight = 0.7;

  @override
  var loginHeadingTextSize = styleSheet.TEXT_THEME.fs24Bold
      .copyWith(color: styleSheet.COLOR.primaryColor);

  @override
  double iconSize = 20;

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
  @override
  double reportCardAspectRatio = 16 / 4;

  @override
  bool drawerTabView = false;

  @override
  double dashboardSummaryCardWidth = 300;

  @override
  double dialogWidth = 0.4;

  @override
  double dashboardProductCardFlex = 2;

  @override
  int crossCount = 4;
}

// ************ DeskTop View ***************

class DesktopView implements ResponsiveValues {
  @override
  double carousolMaxWidth = 500;

  @override
  double carousolMaxHeight = 650;

  @override
  Size secondarBtnMinWidth = const Size(200, 40);

  @override
  double textFieldheight = 40;

  @override
  double tableSmallWidth = 60;

  @override
  double tableLargeWidth = 400;

  @override
  var textFontNormal = styleSheet.TEXT_THEME.fs16Normal;

  @override
  var textFontMedium = styleSheet.TEXT_THEME.fs14Medium;

  @override
  var textFontLargeMedium = styleSheet.TEXT_THEME.fs16Medium;

  @override
  var textFontBold = styleSheet.TEXT_THEME.fs16Bold;

  @override
  double keyboardBtnSize = 12 / 5;

  @override
  double loginContainerHeight = 0.4;

  @override
  var loginHeadingTextSize = styleSheet.TEXT_THEME.fs26Bold
      .copyWith(color: styleSheet.COLOR.primaryColor);

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
  @override
  double reportCardAspectRatio = 16 / 3;

  @override
  bool drawerTabView = false;

  @override
  double dashboardSummaryCardWidth = 350;

  @override
  double dialogWidth = 0.3;

  @override
  double dashboardProductCardFlex = 1;

  @override
  int crossCount = 6;
}
