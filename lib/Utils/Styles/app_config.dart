import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConfig {
  AppConfig._private();

  static final AppConfig _instance = AppConfig._private();

  factory AppConfig() {
    return _instance;
  }

  // add Height

  addHeight(double h) {
    return SizedBox(height: h);
  }

  // add Width
  addWidth(double w) {
    return SizedBox(width: w);
  }

// get Full Screen Height
  getScreenHeight(context) {
    return MediaQuery.of(context).size.height;
  }

// get Full Screen Width
  getScreenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  // Random id Generator

  generateId() {
    return Random().nextInt(1000);
  }

  // Share Function

  shareNow() {
    Share.share("Share Invoice");
  }

  // Web View

  openWebView(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
  }
}
