// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/main.dart';
import 'package:spreadx_web/web_config.dart';

class SupportAndLegalView extends StatelessWidget {
  SupportAndLegalView({super.key});

  List<ContactSupport> btnList = [
    ContactSupport(() {}, Icons.support_agent, "Contact Support"),
    ContactSupport(() async {
      await styleSheet.appConfig.openWebView(WebConfig.termURL);
    }, Icons.contact_page, "Terms And Conditions"),
    ContactSupport(() async {
      await styleSheet.appConfig.openWebView(WebConfig.privacyURL);
    }, Icons.privacy_tip, "Privacy Policy"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(btnList.length, (index) {
          return InkWell(
            onTap: () {
              btnList[index].onTap();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              width: styleSheet.appConfig.getScreenWidth(context),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: styleSheet.DECORATION.RADIUS_5,
                  border: Border.all(color: styleSheet.COLOR.lightGreyColor),
                  color: styleSheet.COLOR.primaryColor),
              child: Row(
                children: [
                  Icon(
                    btnList[index].icon,
                    color: styleSheet.COLOR.whiteColor,
                    size: 40,
                  ),
                  styleSheet.appConfig.addWidth(10),
                  Text(
                    btnList[index].name,
                    style: styleSheet.TEXT_THEME.fs18Medium
                        .copyWith(color: styleSheet.COLOR.whiteColor),
                  ),
                ],
              ),
            ),
          ).paddingOnly(bottom: 15);
        })
      ],
    ).paddingAll(20);
  }
}

class ContactSupport {
  Function onTap;
  String name;
  IconData icon;

  ContactSupport(this.onTap, this.icon, this.name);
}
