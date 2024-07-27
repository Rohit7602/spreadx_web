// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class MenuDrawerView extends StatefulWidget {
  Function(DrawerState) onTap;
  MenuDrawerView({required this.onTap, super.key});

  @override
  State<MenuDrawerView> createState() => _MenuDrawerViewState();
}

class _MenuDrawerViewState extends State<MenuDrawerView> {
  var menuList = LocalData.menuDrawerList;

  int activeTileIndex = 0;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Container(
      height: styleSheet.appConfig.getScreenHeight(context),
      decoration: BoxDecoration(color: styleSheet.COLOR.primaryColor),
      width: view.drawerTabView ? 60 : 260,
      child: SingleChildScrollView(
        child: Column(
          children: [
            styleSheet.appConfig.addHeight(20),
            Container(
              margin: styleSheet.DECORATION.PADDING_10,
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // color: styleSheet.colors.primaryDarkBGColor,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.vectorstock.com/i/500p/87/24/man-profile-vector-31988724.jpg"))),
            ),
            styleSheet.appConfig.addHeight(20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: menuList.length,
              itemBuilder: (context, i) {
                return view.drawerTabView
                    ? CustomDrawerContainer(
                        icon: menuList[i].icon,
                        onPressed: () {
                          activeTileIndex = i;
                          widget.onTap(DrawerState.values[i]);
                          setState(() {});
                        },
                        color: activeTileIndex == i
                            ? styleSheet.COLOR.primaryDarkBGColor
                            : styleSheet.COLOR.primaryColor,
                      )
                    : Material(
                        child: ListTile(
                          tileColor: activeTileIndex == i
                              ? styleSheet.COLOR.primaryDarkBGColor
                              : styleSheet.COLOR.primaryColor,
                          contentPadding: const EdgeInsets.only(left: 30),
                          onTap: () {
                            activeTileIndex = i;

                            widget.onTap(DrawerState.values[i]);
                          },
                          leading: Image.asset(
                            menuList[i].icon,
                            color: styleSheet.COLOR.whiteColor,
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            menuList[i].btnName,
                            style: styleSheet.TEXT_THEME.fs14Normal.copyWith(
                              color: styleSheet.COLOR.whiteColor,
                            ),
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawerContainer extends StatelessWidget {
  String icon;
  Function onPressed;
  Color color;
  CustomDrawerContainer(
      {required this.icon,
      required this.onPressed,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        padding: styleSheet.DECORATION.PADDING_10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Image.asset(
          icon,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}



// Container(
//       height: styleSheet.appConfig.getScreenHeight(context),
//       decoration: BoxDecoration(color: styleSheet.colors.primaryColor),
//       width: 260,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             styleSheet.appConfig.addHeight(20),
//             Container(
//               height: 100,
//               width: 100,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: styleSheet.colors.primaryDarkBGColor,
//                   image: const DecorationImage(
//                       image: NetworkImage(
//                           "https://cdn.vectorstock.com/i/500p/87/24/man-profile-vector-31988724.jpg"))),
//             ),
//             styleSheet.appConfig.addHeight(20),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: menuList.length,
//               itemBuilder: (context, i) {
//                 return CustomDrawerContainer(
//                     icon: menuList[i].icon, onPressed: () {});
//                 // Material(
//                 //   child: ListTile(
//                 //     tileColor: activeTileIndex == i
//                 //         ? styleSheet.colors.primaryDarkBGColor
//                 //         : styleSheet.colors.primaryColor,
//                 //     contentPadding: const EdgeInsets.only(left: 30),
//                 //     onTap: () {
//                 //       activeTileIndex = i;

//                 //       widget.onTap(DrawerState.values[i]);
//                 //     },
//                 //     leading: Image.asset(
//                 //       menuList[i].icon,
//                 //       color: styleSheet.colors.whiteColor,
//                 //       height: 25,
//                 //       width: 25,
//                 //     ),
//                 //     title: Text(
//                 //       menuList[i].btnName,
//                 //       style: styleSheet.textTheme.fs14Normal.copyWith(
//                 //         color: styleSheet.colors.whiteColor,
//                 //       ),
//                 //     ),
//                 //   ),
//                 // );
//               },
//             ),
//           ],
//         ),
//       ),
//     );