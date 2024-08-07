import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  PasswordTextField(
      {super.key, required this.controller, this.hint = "Password"});

  final RxBool isVisibility = RxBool(true);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SecondaryTextFormField(
          controller: controller,
          suffixicon: GestureDetector(
              onTap: () {
                isVisibility(!(isVisibility.value));
              },
              child: Icon(isVisibility.value
                  ? Icons.visibility_off
                  : Icons.visibility_outlined)),
          hinttext: hint,
          onTap: () => openVirtualKeyboard(),
          obscureText: isVisibility.value,
        ));
  }
}
