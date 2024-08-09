import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/main.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Scaffold(
      appBar: CustomAppbarView(title: "Drawers"),
      body: ListView.builder(
        padding: styleSheet.DECORATION.PADDING_20,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, i) {
          return Container(
            padding: styleSheet.DECORATION.PADDING_20,
            decoration: BoxDecoration(
              color: styleSheet.COLOR.greenColor.withOpacity(0.2),
              borderRadius: styleSheet.DECORATION.RADIUS_10,
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
                          context.go(MyRoute.addDrawer);
                        },
                        icon: Icons.add),
                    styleSheet.appConfig.addWidth(20),
                    PrimaryBtnWithIcon(
                        isExpanded: true,
                        btnColor: styleSheet.COLOR.redColor,
                        btnName: "Close Navigation Menu",
                        onPressed: () {},
                        icon: Icons.close)
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
