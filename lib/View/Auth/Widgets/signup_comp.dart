import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class SignUpComponentView extends StatefulWidget {
  const SignUpComponentView({super.key});

  @override
  State<SignUpComponentView> createState() => _LoginComponentViewState();
}

class _LoginComponentViewState extends State<SignUpComponentView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

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
          Text(
            "Signup",
            style: view.loginHeadingTextSize,
          ),
          styleSheet.appConfig.addHeight(40),
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
                          style: styleSheet.TEXT_THEME.fs18Bold.copyWith(
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
                          style: styleSheet.TEXT_THEME.fs18Bold.copyWith(
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
              ? PrimaryTextFormField(
                  keyboardtype: TextInputType.phone,
                  controller: phoneController,
                  suffixicon: const Icon(Icons.phone),
                  hinttext: "Phone Number",
                )
              : PrimaryTextFormField(
                  controller: emailController,
                  suffixicon: const Icon(Icons.mail),
                  hinttext: "Email",
                ),
          styleSheet.appConfig.addHeight(20),
          PrimaryTextFormField(
            controller: passwordController,
            suffixicon: const Icon(Icons.visibility_outlined),
            hinttext: "Password",
            obscureText: true,
          ),
          styleSheet.appConfig.addHeight(20),
          PrimaryBtnView(
            btnName: "Sign up",
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
