import 'package:flutter/material.dart';
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
      children: [
        Flexible(
          flex: 1,
          child: Center(
            child: Image.network(
              WebConfig.demoImage,
              height: 400,
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
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    width: styleSheet.appConfig.getScreenWidth(context),
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: styleSheet.DECORATION.RADIUS_5,
                        border:
                            Border.all(color: styleSheet.COLOR.lightGreyColor),
                        color: styleSheet.COLOR.primaryColor),
                    child: Text(
                      btnList[index],
                      style: styleSheet.TEXT_THEME.fs16Medium
                          .copyWith(color: styleSheet.COLOR.whiteColor),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ],
    );
  }
}
