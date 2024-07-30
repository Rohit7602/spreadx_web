import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Dashboard/Widget/custom_drawer_view.dart';
import 'package:spreadx_web/main.dart';

class MainMenuDrawerView extends StatelessWidget {
  const MainMenuDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: styleSheet.COLOR.primaryColor,
        title: Text(
          "Dashboard",
          style: styleSheet.TEXT_THEME.fs14Medium.copyWith(
            color: styleSheet.COLOR.whiteColor,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                context.go(MyRoute.mainDashboard);
              },
              child: Image.asset(styleSheet.icons.screenIcon)),
        ],
      ),
      drawer: CustomDrawerView(),
      body: Center(
          child: Image.asset(
        styleSheet.images.appLogoLarge,
        fit: BoxFit.cover,
        width: styleSheet.appConfig.getScreenWidth(context) * 0.7,
      )),
    );
  }
}
