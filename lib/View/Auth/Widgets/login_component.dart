// ignore_for_file: avoid_unnecessary_containers

import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/password_text_field.dart';
import 'package:spreadx_web/Components/phone_text_field.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/main.dart';

import '../../../keyboard_handler.dart';

class LoginComponentView extends StatefulWidget {
  const LoginComponentView({super.key});

  @override
  State<LoginComponentView> createState() => _LoginComponentViewState();
}

class _LoginComponentViewState extends State<LoginComponentView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isPhoneSelected = true;
  bool isVisibility = false;
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isPhoneSelected = true;
                        });
                      },
                      child: Text("Phone",
                          style: view.textFontBold_Medium.copyWith(
                              color: isPhoneSelected
                                  ? styleSheet.COLOR.primaryColor
                                  : styleSheet.COLOR.blackColor))),
                  styleSheet.appConfig.addHeight(5),
                  isPhoneSelected
                      ? Container(
                          height: 3,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: styleSheet.COLOR.primaryColor),
                        )
                      : const SizedBox()
                ],
              ),
              styleSheet.appConfig.addWidth(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isPhoneSelected = false;
                        });
                      },
                      child: Text("Email",
                          style: view.textFontBold_Medium.copyWith(
                              color: isPhoneSelected
                                  ? styleSheet.COLOR.blackColor
                                  : styleSheet.COLOR.primaryColor))),
                  styleSheet.appConfig.addHeight(5),
                  isPhoneSelected
                      ? const SizedBox()
                      : Container(
                          height: 3,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: styleSheet.COLOR.primaryColor),
                        )
                ],
              ),
            ],
          ),
          styleSheet.appConfig.addHeight(40),
          isPhoneSelected
              ? PhoneTextField(
                  controller: phoneController,
                  onValuePick: (Country country) {})
              : SecondaryTextFormField(
                  controller: emailController,
                  suffixicon: const Icon(Icons.mail),
                  hinttext: "Email",
                  onTap: () => openVirtualKeyboard(),
                ),
          styleSheet.appConfig.addHeight(20),
          PasswordTextField(controller: passwordController),
          styleSheet.appConfig.addHeight(20),
          Row(
            children: [
              Transform.scale(
                scale: 0.8,
                child: Checkbox(
                    value: isRemember,
                    onChanged: (val) {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    }),
              ),
              styleSheet.appConfig.addWidth(10),
              Text(
                "Remember me",
                style: styleSheet.TEXT_THEME.fs12Medium,
              ),
            ],
          ),
          styleSheet.appConfig.addHeight(20),
          PrimaryBtnView(
            btnName: "Login",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.go(MyRoute.homeScreen);
              }
            },
          ),
        ],
      ),
    );
  }
}
