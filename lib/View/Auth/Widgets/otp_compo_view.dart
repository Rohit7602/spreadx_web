// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:spreadx_web/Components/Button/back_btn.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class OTPComponentView extends StatelessWidget {
  final AuthState state;
  void Function(AuthState) onVerify;
  void Function() onPop;
  bool isForgot;
  OTPComponentView(
      {required this.onVerify,
      required this.onPop,
      this.state = AuthState.isSignUp,
      this.isForgot = false,
      super.key});

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
              onpressed: onPop,
            ),
            styleSheet.appConfig.addWidth(10),
            Text(
              "OTP",
              style: view.loginHeadingTextSize,
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(40),
        Pinput(
          onTap: () => openVirtualKeyboard(),
          length: 6,
          controller: otpController,
        ),
        styleSheet.appConfig.addHeight(10),
        TextButtonView(
          btnName: "Didn't receive code yet?",
          onPressed: () {},
        ),
        styleSheet.appConfig.addHeight(5),
        Center(
          child: Text("you can re-send new code after :",
              style: styleSheet.TEXT_THEME.fs14Normal
                  .copyWith(color: styleSheet.COLOR.blueColor)),
        ),
        styleSheet.appConfig.addHeight(8),
        Text(
          "00:29 sec",
          textAlign: TextAlign.center,
          style: styleSheet.TEXT_THEME.fs14Normal
              .copyWith(color: styleSheet.COLOR.blueColor),
        ),
        styleSheet.appConfig.addHeight(20),
        PrimaryBtnView(
                btnName: "Verify OTP",
                onPressed: () => onVerify(AuthState.createPD))
            .paddingSymmetric(horizontal: 100)
      ],
    );
  }
}
