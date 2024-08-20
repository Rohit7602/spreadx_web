// ignore_for_file: must_be_immutable

import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

import '../../../Components/Button/back_btn.dart';
import '../../../keyboard_handler.dart';

class SignUpComponentView extends StatefulWidget {
  void Function() onContinue;
  void Function() onPop;
  SignUpComponentView(
      {super.key, required this.onContinue, required this.onPop});

  @override
  State<SignUpComponentView> createState() => _LoginComponentViewState();
}

class _LoginComponentViewState extends State<SignUpComponentView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isPhoneSelected = true;

  bool isTerms = false;

  toggleTerms() {
    setState(() => isTerms = !isTerms);
  }

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
                onpressed: widget.onPop,
              ),
              styleSheet.appConfig.addWidth(10),
              Text(
                "Signup",
                style: view.loginHeadingTextSize,
              ),
            ],
          ),
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
              ? SecondaryTextFormField(
                  onTap: () => openVirtualKeyboard(),
                  prefixIcon: CountryListPick(
                    initialSelection: "AE",
                    onChanged: (val) {},
                  ),

                  //   SizedBox(
                  //     height: 10,
                  //     width: 140,
                  //     child: CountryPickerDropdown(
                  //       isExpanded: true,
                  //       initialValue: 'AE',
                  //       itemBuilder: _buildDropdownItem,
                  //       onValuePicked: (Country country) {},
                  //     ),
                  //   ),
                  keyboardtype: TextInputType.phone,
                  controller: phoneController,
                  hinttext: "(50 | 52 | 54 | 55 | 56 | 58 | xxxxx)",
                )
              : SecondaryTextFormField(
                  controller: emailController,
                  suffixicon: const Icon(Icons.mail),
                  hinttext: "Email",
                  onTap: () => openVirtualKeyboard(),
                ),
          styleSheet.appConfig.addHeight(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox.adaptive(
                  value: isTerms, onChanged: (v) => toggleTerms()),
              Text.rich(TextSpan(
                  text: "I agree to ",
                  style: styleSheet.TEXT_THEME.fs12Medium,
                  children: [
                    TextSpan(
                        text: "Terms And Conditions",
                        style: styleSheet.TEXT_THEME.fs12Bold
                            .copyWith(color: styleSheet.COLOR.primaryColor)),
                    TextSpan(
                        text: " & ", style: styleSheet.TEXT_THEME.fs12Medium),
                    TextSpan(
                        text: "Privacy Policy",
                        style: styleSheet.TEXT_THEME.fs12Bold
                            .copyWith(color: styleSheet.COLOR.primaryColor)),
                  ]))
            ],
          ),
          // PrimaryTextFormField(
          //   controller: passwordController,
          //   suffixicon: const Icon(Icons.visibility_outlined),
          //   hinttext: "Password",
          //   obscureText: true,
          //   onTap: () => openVirtualKeyboard(),
          // ),
          styleSheet.appConfig.addHeight(20),
          PrimaryBtnView(
            btnName: "Continue",
            onPressed: widget.onContinue,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: 8.0,
          ),
          Text("+${country.phoneCode}"),
        ],
      );
}
