// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextAlign? textAlign;
  final String? title;
  final String? hinttext;
  final Widget? suffixicon;
  final Widget? prefixIcon;
  final Color? hinttextColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardtype;
  final Function(String)? fieldSubmitted;
  void Function(String)? onChanged;
  final bool obscureText;
  final bool isDense;
  final bool label;
  final Function? onTap;
  final bool readonly;
  PrimaryTextFormField({
    super.key,
    this.textAlign,
    this.title,
    this.hinttext,
    this.hinttextColor,
    this.controller,
    this.focusNode,
    this.fieldSubmitted,
    this.onChanged,
    this.keyboardtype,
    this.suffixicon,
    this.prefixIcon,
    this.obscureText = false,
    this.label = false,
    this.isDense = true,
    this.readonly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return TextFormField(
      // onChanged: (val) => onChanged!(val),
      textAlign: textAlign ?? TextAlign.left,
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
      readOnly: readonly,
      decoration: InputDecoration(
        filled: true,
        fillColor: styleSheet.COLOR.fieldGreyColor,
        constraints:
            BoxConstraints(minHeight: 30, maxHeight: view.textFieldheight),
        labelText: label ? hinttext : null,
        labelStyle:
            view.textFontMedium.copyWith(color: styleSheet.COLOR.greyColor),
        hintText: hinttext,
        hintStyle: view.textFontMedium
            .copyWith(color: hinttextColor ?? styleSheet.COLOR.greyColor),
        suffixIconColor: styleSheet.COLOR.greyColor,
        suffixIcon: suffixicon?.paddingOnly(right: 20),
        prefixIconColor: styleSheet.COLOR.greyColor,
        prefixIcon: prefixIcon?.paddingOnly(left: 5),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: styleSheet.COLOR.whiteColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: styleSheet.COLOR.whiteColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: styleSheet.COLOR.whiteColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: styleSheet.COLOR.redColor)),
      ),
    );
  }
}

class SecondaryTextFormField extends StatelessWidget {
  final String? hinttext;
  final Widget? suffixicon;
  final Widget? prefixIcon;
  final Color? hinttextColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardtype;
  final Function(String)? fieldSubmitted;
  final bool obscureText;
  final bool isDense;
  final bool label;
  final bool fillColor;
  final bool fieldColor;
  final Function? onTap;
  final bool readOnly;
  final bool allowNumbers;
  final void Function(String)? onChange;
  const SecondaryTextFormField({
    super.key,
    this.hinttext,
    this.hinttextColor,
    this.controller,
    this.focusNode,
    this.fieldSubmitted,
    this.keyboardtype,
    this.suffixicon,
    this.prefixIcon,
    this.obscureText = false,
    this.label = false,
    this.isDense = true,
    this.fillColor = true,
    this.fieldColor = false,
    this.onTap,
    this.readOnly = false,
    this.allowNumbers = false,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Container(
      margin: const EdgeInsets.only(top: 5),
      color: fillColor ? styleSheet.COLOR.fieldGreyColor : null,
      child: TextFormField(
        onChanged: onChange != null
            ? (val) {
                onChange!(val);
              }
            : null,
        inputFormatters: allowNumbers
            ? [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                TextInputFormatter.withFunction(
                  (oldValue, newValue) => newValue.copyWith(
                    text: newValue.text.replaceAll(',', '.'),
                  ),
                ),
              ]
            : [],
        readOnly: readOnly,
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
          fillColor: fieldColor
              ? styleSheet.COLOR.whiteColor
              : styleSheet.COLOR.fieldGreyColor,
          constraints: const BoxConstraints(minHeight: 30),
          labelText: label ? hinttext : null,

          labelStyle:
              view.textFontMedium.copyWith(color: styleSheet.COLOR.greyColor),
          hintText: hinttext,
          hintStyle: view.textFontMedium
              .copyWith(color: hinttextColor ?? styleSheet.COLOR.greyColor),
          suffixIconColor: styleSheet.COLOR.greyColor,
          suffixIcon: suffixicon?.paddingOnly(right: 20),
          prefixIconColor: styleSheet.COLOR.greyColor,
          prefixIcon: prefixIcon?.paddingOnly(left: 5),

          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(4),
          //     borderSide: BorderSide(color: styleSheet.COLOR.whiteColor)),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(4),
          //     borderSide: BorderSide(color: styleSheet.COLOR.whiteColor)),
          // errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(4),
          //     borderSide: BorderSide(color: styleSheet.COLOR.redColor)),
        ),
      ),
    );
  }
}

class PlainTextField extends StatelessWidget {
  final String? hinttext;
  final Widget? suffixicon;
  final Widget? prefixIcon;
  final bool allowNumbers;

  final TextEditingController? controller;

  final Function? onTap;
  const PlainTextField({
    super.key,
    this.hinttext,
    this.controller,
    this.suffixicon,
    this.prefixIcon,
    this.onTap,
    this.allowNumbers = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: allowNumbers
          ? [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
              TextInputFormatter.withFunction(
                (oldValue, newValue) => newValue.copyWith(
                  text: newValue.text.replaceAll(',', '.'),
                ),
              ),
            ]
          : [],
      onTap: () {
        onTap != null ? onTap!() : null;
      },
      style: styleSheet.TEXT_THEME.fs14Medium,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          hintStyle: styleSheet.TEXT_THEME.fs16Bold
              .copyWith(color: styleSheet.COLOR.greyColor),
          border: InputBorder.none,
          hintText: hinttext,
          suffixIcon: suffixicon),
    );
  }
}
