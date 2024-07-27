import 'package:flutter/material.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Responsive/responsive_abstract.dart';
import 'package:spreadx_web/main.dart';

class ResponsiveHandler {
  ResponsiveHandler._privateConstructor();

  static final ResponsiveHandler _instance =
      ResponsiveHandler._privateConstructor();

  factory ResponsiveHandler() {
    return _instance;
  }

  ScreenView _getView(BuildContext context) {
    ScreenView? view;
    final width = styleSheet.appConfig.getScreenWidth(context);

    if (width <= 1024) {
      view = ScreenView.Tablet;
    }
    if (width > 1024 && width <= 1366) {
      view = ScreenView.Web;
    }
    if (width > 1366) {
      view = ScreenView.Desktop;
    }

    return view!;
  }

  ResponsiveValues getResponsiveness(BuildContext context) {
    switch (_getView(context)) {
      case ScreenView.Tablet:
        return TabView();
      case ScreenView.Web:
        return WebView();
      case ScreenView.Desktop:
        return DesktopView();
      default:
        return TabView();
    }
  }
}
