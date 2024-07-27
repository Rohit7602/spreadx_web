// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Button/back_btn.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/main.dart';

class CreatePDComponentView extends StatefulWidget {
  void Function(AuthState) getBack;
  CreatePDComponentView({required this.getBack, super.key});

  @override
  State<CreatePDComponentView> createState() => _CreatePDComponentViewState();
}

class _CreatePDComponentViewState extends State<CreatePDComponentView> {
  final passwordController = TextEditingController();
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Column(
      children: [
        Row(
          children: [
            BackButtonView(
              onpressed: () {
                widget.getBack(AuthState.isForgot);
              },
            ),
            Text(
              "Create Password",
              style: view.loginHeadingTextSize,
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(40),
        PrimaryTextFormField(
          controller: passwordController,
          suffixicon: GestureDetector(
              onTap: () {
                isVisibility = !isVisibility;
                setState(() {});
              },
              child: const Icon(Icons.visibility_outlined)),
          hinttext: "Password",
          obscureText: isVisibility,
        ),
        styleSheet.appConfig.addHeight(20),
        PrimaryTextFormField(
          controller: passwordController,
          suffixicon: GestureDetector(
              onTap: () {
                isVisibility = !isVisibility;
                setState(() {});
              },
              child: const Icon(Icons.visibility_outlined)),
          hinttext: "Password",
          obscureText: isVisibility,
        ),
        styleSheet.appConfig.addHeight(20),
        PrimaryBtnView(
          btnName: "Create Password",
          onPressed: () {
            context.go(MyRoute.salesReport);
          },
        ),
      ],
    );
  }
}
