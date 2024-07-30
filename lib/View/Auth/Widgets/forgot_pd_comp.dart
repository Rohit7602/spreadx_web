// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/back_btn.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class ForgotPDCompoView extends StatefulWidget {
  void Function(AuthState) onSendOTP;
  ForgotPDCompoView({required this.onSendOTP, super.key});

  @override
  State<ForgotPDCompoView> createState() => _LoginComponentViewState();
}

class _LoginComponentViewState extends State<ForgotPDCompoView> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPhoneSelected = true;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              BackButtonView(
                onpressed: () {
                  widget.onSendOTP(AuthState.isLOGIN);
                },
              ),
              styleSheet.appConfig.addWidth(20),
              Text(
                "Forgot",
                style: view.loginHeadingTextSize,
              ),
            ],
          ),
          styleSheet.appConfig.addWidth(20),
          isPhoneSelected
              ? const SizedBox()
              : Container(
                  height: 3,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: styleSheet.COLOR.primaryColor),
                ),
          styleSheet.appConfig.addHeight(40),
          PrimaryTextFormField(
            controller: emailController,
            suffixicon: const Icon(
              Icons.email,
            ),
            hinttext: "Email",
            obscureText: true,
          ),
          styleSheet.appConfig.addHeight(30),
          PrimaryBtnView(
            btnName: "Send OTP",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSendOTP(AuthState.isOTPView);

                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const OTPView()));
              }
            },
          ),
        ],
      ),
    );
  }
}
