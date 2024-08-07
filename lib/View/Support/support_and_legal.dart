// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/main.dart';

class SupportAndLegalView extends StatelessWidget {
  SupportAndLegalView({super.key});

  List<ContactSupport> btnList = [
    ContactSupport(Icons.support_agent, "Contact Support"),
    ContactSupport(Icons.contact_page, "Terms And Conditions"),
    ContactSupport(Icons.privacy_tip, "Privacy Policy"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(btnList.length, (index) {
          return InkWell(
            onTap: () {},
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
  String name;
  IconData icon;

  ContactSupport(this.icon, this.name);
}
