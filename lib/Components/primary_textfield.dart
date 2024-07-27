import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class PrimaryTextFormField extends StatelessWidget {
  final String? title;
  final String? hinttext;
  final Widget? suffixicon;
  final Color? hinttextColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardtype;
  final Function(String)? fieldSubmitted;
  final bool obscureText;
  final bool isDense;
  final Function? onTap;
  const PrimaryTextFormField({
    super.key,
    this.title,
    this.hinttext,
    this.hinttextColor,
    this.controller,
    this.focusNode,
    this.fieldSubmitted,
    this.keyboardtype,
    this.suffixicon,
    this.obscureText = false,
    this.isDense = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: styleSheet.TEXT_THEME.fs16Normal,
              ).paddingOnly(bottom: 10)
            : const SizedBox(),
        TextFormField(
          onTap: () {
            onTap != null ? onTap!() : null;
          },
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted:
              fieldSubmitted != null ? (value) => fieldSubmitted!(value) : null,
          keyboardType: keyboardtype,

          // validator: validator == null ? null : (v) => validator!.validator(v),
          style: view.textFontLargeMedium,
          obscureText: obscureText,

          decoration: InputDecoration(
            filled: true,
            fillColor: styleSheet.COLOR.lightGreyColor,
            constraints:
                BoxConstraints(minHeight: 30, maxHeight: view.textFieldheight),
            labelText: hinttext,
            labelStyle:
                view.textFontMedium.copyWith(color: styleSheet.COLOR.greyColor),
            hintText: hinttext,
            hintStyle: view.textFontMedium
                .copyWith(color: hinttextColor ?? styleSheet.COLOR.greyColor),
            suffixIconColor: styleSheet.COLOR.greyColor,
            suffixIcon: suffixicon?.paddingOnly(right: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: styleSheet.COLOR.whiteColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: styleSheet.COLOR.whiteColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: styleSheet.COLOR.whiteColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: styleSheet.COLOR.redColor)),
          ),
        ),
      ],
    );
  }
}
