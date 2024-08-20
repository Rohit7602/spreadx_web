// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/back_btn.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/password_text_field.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class CreatePDComponentView extends StatefulWidget {
  void Function() onCreatePassword;
  void Function() onPop;
  CreatePDComponentView(
      {required this.onCreatePassword, required this.onPop, super.key});

  @override
  State<CreatePDComponentView> createState() => _CreatePDComponentViewState();
}

class _CreatePDComponentViewState extends State<CreatePDComponentView> {
  final passwordController = TextEditingController();
  final confirmPDController = TextEditingController();
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            BackButtonView(
              onpressed: widget.onPop,
            ),
            styleSheet.appConfig.addWidth(10),
            Text(
              "Create Password",
              style: view.loginHeadingTextSize,
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(40),
        PasswordTextField(controller: passwordController),
        styleSheet.appConfig.addHeight(20),
        PasswordTextField(
          controller: confirmPDController,
          hint: "Confirm Password",
        ),
        styleSheet.appConfig.addHeight(20),
        PrimaryBtnView(
          btnName: "Create Password",
          onPressed: () {
            widget.onCreatePassword();
            // context.go(MyRoute.homeScreen)
          },
        ),
      ],
    );
  }
}
