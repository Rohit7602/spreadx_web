// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:spreadx_web/Components/Button/back_btn.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class OTPComponentView extends StatelessWidget {
  void Function(AuthState) getBack;
  OTPComponentView({required this.getBack, super.key});

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            BackButtonView(
              onpressed: () {
                getBack(AuthState.isForgot);
              },
            ),
            Text(
              "Verify OTP",
              style: view.loginHeadingTextSize,
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(40),
        Pinput(
          length: 6,
          controller: otpController,
        ),
        styleSheet.appConfig.addHeight(10),
        TextButtonView(
          btnName: "Didn't receive code yet?",
          onPressed: () {},
        ),
        styleSheet.appConfig.addHeight(5),
        Text(
          "00:29 sec",
          textAlign: TextAlign.center,
          style: styleSheet.TEXT_THEME.fs14Normal
              .copyWith(color: styleSheet.COLOR.blueColor),
        ),
        styleSheet.appConfig.addHeight(20),
        PrimaryBtnView(
            btnName: "Verify OTP",
            onPressed: () {
              getBack(AuthState.createPD);
            }).paddingSymmetric(horizontal: 100)
      ],
    );
  }
}
