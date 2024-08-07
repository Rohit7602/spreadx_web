import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/main_setup/widgets/main_setup_button.dart';
import 'package:spreadx_web/main.dart';

class BusinessSetupView extends StatelessWidget {
  const BusinessSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarView(title: "Profile"),
      body: Padding(
        padding: styleSheet.DECORATION.PADDING_20,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: styleSheet.COLOR.productCardGreyColor,
                            shape: BoxShape.circle),
                        child: Text("150 X 150",
                            style: styleSheet.TEXT_THEME.fs18Bold
                                .copyWith(color: styleSheet.COLOR.greyColor))),
                    styleSheet.appConfig.addHeight(10),
                    Text("bot#3456784rf456",
                        style: styleSheet.TEXT_THEME.fs16Bold)
                  ],
                )),
            styleSheet.appConfig.addWidth(20),
            Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainSetupButton(
                          ontap: () {
                            context.go(MyRoute.profileSetupView);
                          },
                          title: "Profile"),
                      styleSheet.appConfig.addHeight(10),
                      MainSetupButton(
                          ontap: () {
                            context.go(MyRoute.businessProfileSetupview);
                          },
                          title: "Business")
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
