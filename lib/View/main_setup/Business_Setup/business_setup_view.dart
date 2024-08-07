import 'package:flutter/material.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/business_profile_setup_view.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/profile_setup_view.dart';
import 'package:spreadx_web/View/main_setup/widgets/main_setup_button.dart';
import 'package:spreadx_web/main.dart';

class BusinessSetupView extends StatefulWidget {
  final void Function()? onPressedBack;
  const BusinessSetupView({super.key, this.onPressedBack});

  @override
  State<BusinessSetupView> createState() => _BusinessSetupViewState();
}

class _BusinessSetupViewState extends State<BusinessSetupView> {
  bool showProfile = false;
  bool showBusiness = false;
  @override
  Widget build(BuildContext context) {
    final defaultView = Scaffold(
      // appBar: CustomAppbarView(title: "Profile"),
      body: Padding(
        padding: styleSheet.DECORATION.PADDING_20,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: widget.onPressedBack,
                  icon: const Icon(Icons.arrow_back_outlined)),
            ),
            Expanded(
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
                                      .copyWith(
                                          color: styleSheet.COLOR.greyColor))),
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
                                  setState(() => showProfile = true);
                                },
                                title: "Profile"),
                            styleSheet.appConfig.addHeight(10),
                            MainSetupButton(
                                ontap: () {
                                  setState(() => showBusiness = true);
                                },
                                title: "Business")
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return showProfile
        ? ProfileSetupView(
            onPressedBack: () => setState(() => showProfile = false),
          )
        : showBusiness
            ? BusinessProfileSetupView(
                onPressedBack: () => setState(() => showBusiness = false),
              )
            : defaultView;
  }
}
