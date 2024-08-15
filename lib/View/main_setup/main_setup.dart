import 'package:flutter/material.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/business_setup_view.dart';
import 'package:spreadx_web/View/main_setup/Printer_Settings/printer_settings.dart';
import 'package:spreadx_web/View/main_setup/User_Management/user_management.dart';
import 'package:spreadx_web/View/main_setup/security/security_view.dart';
import 'package:spreadx_web/View/main_setup/store_settings/store_settings_view.dart';
import 'package:spreadx_web/View/main_setup/widgets/main_setup_button.dart';
import 'package:spreadx_web/main.dart';

class MainSetupView extends StatefulWidget {
  const MainSetupView({super.key});

  @override
  State<MainSetupView> createState() => _MainSetupViewState();
}

class _MainSetupViewState extends State<MainSetupView> {
  List<Map<String, dynamic>> btnList = [
    {"title": "Business Setup", "route": MyRoute.businessSetup},
    {"title": "Printer Settings", "route": MyRoute.printerSetting},
    {"title": "Users Management", "route": MyRoute.usersManagement},
    {"title": "Security", "route": MyRoute.security},
    {"title": "Store Settings", "route": MyRoute.storeSettings},
  ];

  MainSetUpState _state = MainSetUpState.Default;

  setViewState(MainSetUpState newState) {
    setState(() => _state = newState);
  }

  @override
  Widget build(BuildContext context) {
    final defaultView = Padding(
      padding: styleSheet.DECORATION.PADDING_20,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Image.asset(
                  styleSheet.images.main_setup_img,
                  height: 300,
                ),
                Text(
                  "Version: 2.0.5",
                  style: styleSheet.TEXT_THEME.fs14Medium
                      .copyWith(color: styleSheet.COLOR.greyColor),
                )
              ],
            ),
          ),
          styleSheet.appConfig.addWidth(10),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(btnList.length, (index) {
                  return MainSetupButton(
                      ontap: () {
                        setViewState(getViewByRoutes(btnList[index]['title']));
                      },
                      title: btnList[index]['title']);
                })
              ],
            ),
          ),
        ],
      ),
    );

    return getView(defaultView);
  }

  void onPressBack() {
    setState(() => _state = MainSetUpState.Default);
  }

  getViewByRoutes(String route) {
    switch (route) {
      case "Business Setup":
        return MainSetUpState.Business;
      case "Printer Settings":
        return MainSetUpState.Printer;
      case "Users Management":
        return MainSetUpState.Users;
      case "Security":
        return MainSetUpState.Security;
      case "Store Settings":
        return MainSetUpState.Store;

      default:
        return MainSetUpState.Default;
    }
  }

  getView(Widget defaultView) {
    switch (_state) {
      case MainSetUpState.Business:
        return BusinessSetupView(
          onPressedBack: onPressBack,
        );
      case MainSetUpState.Printer:
        return PrinterSettings(
          onPressedBack: onPressBack,
        );
      case MainSetUpState.Security:
        return SecurityView(
          onPressedBack: onPressBack,
        );
      case MainSetUpState.Store:
        return StoreSettingsView(
          onPressedBack: onPressBack,
        );
      case MainSetUpState.Users:
        return UserManagementView(
          onPressedBack: onPressBack,
        );
      default:
        return defaultView;
    }
  }
}
