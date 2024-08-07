import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: styleSheet.DECORATION.PADDING_20,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: Image.asset(
                styleSheet.images.main_setup_img,
                height: 300,
              ),
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
                        context.go(btnList[index]['route']);
                      },
                      title: btnList[index]['title']);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
