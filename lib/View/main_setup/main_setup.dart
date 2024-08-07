import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/main.dart';
import 'package:spreadx_web/web_config.dart';

class MainSetupView extends StatefulWidget {
  const MainSetupView({super.key});

  @override
  State<MainSetupView> createState() => _MainSetupViewState();
}

class _MainSetupViewState extends State<MainSetupView> {
  List<String> btnList = [
    "Business Setup",
    "Printer Settings",
    "Users Management",
    "Security",
    "Store Settings"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                styleSheet.images.main_setup_img,
              ),
              Text(
                "Version: 2.0.5",
                style: styleSheet.TEXT_THEME.fs14Medium
                    .copyWith(color: styleSheet.COLOR.greyColor),
              ).paddingOnly(bottom: 15)
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
                return DrawerButtonView(
                  btnName: btnList[index],
                  onPressed: () {},
                ).paddingOnly(bottom: 15);
              })
            ],
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
