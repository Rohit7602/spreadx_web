import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/users_controller.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/password_text_field.dart';
import 'package:spreadx_web/Components/phone_text_field.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class UserProfileView extends StatelessWidget {
  final void Function()? onPressedBack;
  UserProfileView({required this.onPressedBack, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UsersController>();
    return ListView(
      padding: styleSheet.DECORATION.PADDING_20,
      children: [
        SecondaryTextFormField(
            onTap: () => openVirtualKeyboard(),
            hinttext: "Employee Name",
            controller: controller.employeeName),
        styleSheet.appConfig.addHeight(20),
        PhoneTextField(
            controller: controller.phoneNumber,
            onValuePick: (Country country) {}),
        styleSheet.appConfig.addHeight(20),
        SecondaryTextFormField(
            onTap: () => openVirtualKeyboard(),
            hinttext: "Email",
            controller: controller.email),
        styleSheet.appConfig.addHeight(20),
        PasswordTextField(controller: controller.password),
        styleSheet.appConfig.addHeight(20),
        PasswordTextField(
            hint: "Confirm Password", controller: controller.confirmPassword),
        styleSheet.appConfig.addHeight(20),
        Obx(() => PrimaryDropDown(
            border: true,
            hint: "Role",
            dropdownValue: controller.role,
            items: const ["ADMIN", "SUPER-ADMIN"],
            value: (v) {
              controller.setRole(v!);
            })),
        styleSheet.appConfig.addHeight(20),
        Obx(() => PrimaryDropDown(
            border: true,
            hint: "Status",
            dropdownValue: controller.status,
            items: const ["ACTIVE", "IN-ACTIVE"],
            value: (v) {
              controller.setStatus(v!);
            })),
        styleSheet.appConfig.addHeight(20),
        PrimaryBtnView(
            btnName: "Save",
            onPressed: () {
              controller.onSave(context);
              onPressedBack!();
            },
            isExpanded: true)
      ],
    );
  }
}
