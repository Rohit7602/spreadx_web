// ignore_for_file: non_constant_identifier_names

import 'package:spreadx_web/Utils/Styles/app_config.dart';
import 'package:spreadx_web/Utils/Styles/app_images.dart';
import 'package:spreadx_web/Utils/Styles/container_decoration.dart';
import 'package:spreadx_web/Utils/Styles/style_sheet.dart';

class ConstantSheet {
  ConstantSheet._constructor();
  static final ConstantSheet instance = ConstantSheet._constructor();

  factory ConstantSheet() {
    return instance;
  }

// Check now
  //  APP TEXT THEME GET
  AppTextTheme get TEXT_THEME => AppTextTheme();

  //  APP COLORS GET

  AppColors get COLOR => AppColors();

//   //  APP SERVICES GET
//   final _appServices = AppServices();
//   AppServices get services => _appServices;

//   //  APP Images GET
//   final _appimages = AppImage();
//   AppImage get images => _appimages;

  //  APP Config GET

  AppConfig get appConfig => AppConfig();

  //  APP Images GET

  AppIcons get icons => AppIcons();

  // Container Decoration

  ContainerDecoration get DECORATION => ContainerDecoration();
}
