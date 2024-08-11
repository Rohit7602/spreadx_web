import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/password_text_field.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class UpdateEmailDialog extends StatelessWidget {
  UpdateEmailDialog({super.key});

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "",
      child: Container(
        padding: styleSheet.DECORATION.PADDING_20,
        color: styleSheet.COLOR.bgLightBlueColor,
        child: Container(
          padding: styleSheet.DECORATION.PADDING_20,
          decoration: BoxDecoration(
            borderRadius: styleSheet.DECORATION.RADIUS_5,
            color: styleSheet.COLOR.whiteColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                styleSheet.images.appLogo,
                width: 280,
              ),
              styleSheet.appConfig.addHeight(10),
              Text(
                "New Email",
                style: styleSheet.TEXT_THEME.fs24Bold
                    .copyWith(color: styleSheet.COLOR.primaryColor),
              ),
              styleSheet.appConfig.addHeight(15),
              SecondaryTextFormField(
                onTap: () => openVirtualKeyboard(),
                keyboardtype: TextInputType.emailAddress,
                controller: emailController,
                label: true,
                hinttext: "Email",
              ),
              styleSheet.appConfig.addHeight(20),
              PasswordTextField(
                controller: passwordController,
                hint: "Confirm Password",
              ),
              styleSheet.appConfig.addHeight(30),
              PrimaryBtnView(
                  isExpanded: true, btnName: "Continue", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
