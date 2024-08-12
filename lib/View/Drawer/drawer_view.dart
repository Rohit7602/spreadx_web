// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Drawer/add_drawer.dart';
import 'package:spreadx_web/View/Drawer/close_drawer_navigation.dart';
import 'package:spreadx_web/View/Drawer/drawer_report.dart';
import 'package:spreadx_web/View/Drawer/open_new_drawer.dart';
import 'package:spreadx_web/main.dart';

class DrawerView extends StatefulWidget {
  void Function() onPressedBack;
  DrawerView({required this.onPressedBack, super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  RxString selectedView = RxString("default");

  var drawerController = Get.find<DrawersController>();

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    var defaultView = Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: widget.onPressedBack,
              icon: const Icon(Icons.arrow_back)),
        ),
        drawerController.drawer.isEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "No opening drawer exists",
                    style: styleSheet.TEXT_THEME.fs14Bold
                        .copyWith(color: styleSheet.COLOR.blackColor),
                  ).paddingOnly(left: 30),
                  PrimaryBtnView(
                      btnName: "Open New Drawer",
                      onPressed: () {
                        selectedView("opendrawer");
                      })
                ],
              ).paddingAll(20)
            : Obx(() {
                return ListView.builder(
                  padding: styleSheet.DECORATION.PADDING_20.copyWith(top: 40),
                  shrinkWrap: true,
                  itemCount: drawerController.drawer.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        selectedView("drawerreport");
                      },
                      child: Container(
                        padding: styleSheet.DECORATION.PADDING_10,
                        decoration: BoxDecoration(
                          color: styleSheet.COLOR.greenColor.withOpacity(0.2),
                          borderRadius: styleSheet.DECORATION.RADIUS_5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DRAWER 279343802432",
                              style: view.textFontBold_Medium,
                            ),
                            styleSheet.appConfig.addHeight(10),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_rounded,
                                  color: styleSheet.COLOR.greenColor,
                                ),
                                styleSheet.appConfig.addWidth(10),
                                Text(
                                  "Opened with AED 0.00 on 28 May 2024 01:57 PM",
                                  overflow: TextOverflow.fade,
                                  style: view.textFontBold,
                                ),
                              ],
                            ),
                            styleSheet.appConfig.addHeight(15),
                            Row(
                              children: [
                                PrimaryBtnWithIcon(
                                    isExpanded: true,
                                    btnName: "Add Entry",
                                    onPressed: () {
                                      selectedView("addEntry");
                                    },
                                    icon: Icons.add),
                                styleSheet.appConfig.addWidth(20),
                                PrimaryBtnWithIcon(
                                    isExpanded: true,
                                    btnColor: styleSheet.COLOR.redColor,
                                    btnName: "Close Navigation Menu",
                                    onPressed: () {
                                      selectedView("closeNavigation");
                                    },
                                    icon: Icons.close)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
        Obx(() {
          return ListView.separated(
            separatorBuilder: (context, i) =>
                styleSheet.appConfig.addHeight(10),
            padding: styleSheet.DECORATION.PADDING_20.copyWith(top: 0),
            shrinkWrap: true,
            itemCount: drawerController.closedrawer.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  selectedView("drawerreport");
                },
                child: Container(
                  padding: styleSheet.DECORATION.PADDING_10,
                  decoration: BoxDecoration(
                    color: styleSheet.COLOR.whiteColor,
                    borderRadius: styleSheet.DECORATION.RADIUS_5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DRAWER 279343802432",
                        style: view.textFontBold_Medium,
                      ),
                      styleSheet.appConfig.addHeight(10),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_rounded,
                            color: styleSheet.COLOR.greenColor,
                          ),
                          styleSheet.appConfig.addWidth(10),
                          Text(
                            "Opened with AED 0.00 on 28 May 2024 01:57 PM",
                            overflow: TextOverflow.fade,
                            style: view.textFontBold,
                          ),
                        ],
                      ),
                      styleSheet.appConfig.addHeight(10),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_rounded,
                            color: styleSheet.COLOR.redColor,
                          ),
                          styleSheet.appConfig.addWidth(10),
                          Text(
                            "Opened with AED 0.00 on 28 May 2024 01:57 PM",
                            overflow: TextOverflow.fade,
                            style: view.textFontBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        })
      ],
    );

    return Obx(() {
      if (selectedView.value.toLowerCase() == "addentry") {
        return AddDrawerView(
          onPressedBack: () {
            selectedView.value = "default";
            setState(() {});
          },
        );
      } else if (selectedView.value.toLowerCase() == "closenavigation") {
        return CloseDrawerNavigationView(
          onPressedBack: () {
            selectedView.value = "default";
            setState(() {});
          },
          drawerModel: drawerController.drawer.first,
        );
      } else if (selectedView.value.toLowerCase() == "opendrawer") {
        return OpenNewDrawerView(
          onPressedBack: () {
            selectedView.value = "default";
            setState(() {});
          },
        );
      } else if (selectedView.value.toLowerCase() == "drawerreport") {
        return DrawerReportView(
          onPressedBack: () {
            selectedView.value = "default";
            setState(() {});
          },
        );
      } else {
        return defaultView;
      }
    });
  }
}
