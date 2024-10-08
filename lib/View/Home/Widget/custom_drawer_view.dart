// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Button/back_btn.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/main.dart';

class CustomDrawerView extends StatelessWidget {
  void Function(DrawerState) onTap;
  CustomDrawerView({required this.onTap, super.key});

  var menuList = LocalData.menuDrawerList;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 500,
      ),
      child: Drawer(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: styleSheet.appConfig.getScreenHeight(context),
              decoration: BoxDecoration(color: styleSheet.COLOR.primaryColor),
              child: Column(
                children: [
                  styleSheet.appConfig.addHeight(40),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: styleSheet.COLOR.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: styleSheet.COLOR.greyColor,
                      size: 30,
                    ),
                  ),
                  styleSheet.appConfig.addHeight(5),
                  Text(
                    "bot#2304589f9sd890",
                    style: styleSheet.TEXT_THEME.fs14Medium
                        .copyWith(color: styleSheet.COLOR.whiteColor),
                  ),
                  styleSheet.appConfig.addHeight(10),
                  InkWell(
                    onTap: () {
                      context.go(MyRoute.login);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          color: styleSheet.COLOR.whiteColor,
                        ),
                        styleSheet.appConfig.addWidth(5),
                        Text(
                          "Logout",
                          style: styleSheet.TEXT_THEME.fs14Normal
                              .copyWith(color: styleSheet.COLOR.whiteColor),
                        )
                      ],
                    ),
                  ),
                  styleSheet.appConfig.addHeight(30),
                  Expanded(
                    child: SizedBox(
                        child: GridView.builder(
                            padding: styleSheet.DECORATION.PADDING_20,
                            itemCount: menuList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  getRoute(menuList[i].btnName.toLowerCase());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          styleSheet.DECORATION.RADIUS_5,
                                      color:
                                          styleSheet.COLOR.primaryDarkBGColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(menuList[i].icon),
                                      styleSheet.appConfig.addHeight(10),
                                      Text(
                                        menuList[i].btnName,
                                        style: styleSheet.TEXT_THEME.fs14Medium
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })

                        // SingleChildScrollView(
                        //   child: Wrap(
                        //     spacing: 20,
                        //     runSpacing: 20,
                        //     children: [
                        //       ...List.generate(
                        //         menuList.length,
                        //         (i) => Container(
                        //           alignment: Alignment.center,
                        //           height: 120,
                        //           width: 120,
                        //           decoration: BoxDecoration(
                        //               borderRadius:
                        //                   styleSheet.DECORATION.RADIUS_5,
                        //               color: styleSheet.COLOR.primaryDarkBGColor),
                        //           child: Column(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Image.asset(menuList[i].icon),
                        //               styleSheet.appConfig.addHeight(10),
                        //               Text(
                        //                 menuList[i].btnName,
                        //                 style: styleSheet.TEXT_THEME.fs14Medium
                        //                     .copyWith(
                        //                         color:
                        //                             styleSheet.COLOR.whiteColor),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        ),
                  ),
                  styleSheet.appConfig.addHeight(20)
                ],
              ),
            ),
            Positioned(
              top: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BackButtonView(
                    onpressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  styleSheet.appConfig.addWidth(15)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getRoute(String routeName) {
    switch (routeName) {
      case "products":
        return onTap(DrawerState.Products);

      case "inventory":
        return onTap(DrawerState.Inventory);

      case "transactions":
        return onTap(DrawerState.Transactions);

      case "suppliers":
        return onTap(DrawerState.Suppliers);

      case "customers":
        return onTap(DrawerState.Customers);
      case "reports":
        return onTap(DrawerState.Reports);
      case "data center":
        return onTap(DrawerState.DataCenter);
      case "main setup":
        return onTap(DrawerState.MainSetup);
      case "support & legal":
        return onTap(DrawerState.Support);

      default:
        return onTap(DrawerState.Products);
    }
  }
}
