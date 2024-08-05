// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/back_btn.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

import '../../../keyboard_handler.dart';

class ForgotPDCompoView extends StatefulWidget {
  void Function() onSendOTP;
  void Function() onPop;
  ForgotPDCompoView({super.key, required this.onSendOTP, required this.onPop});

  @override
  State<ForgotPDCompoView> createState() => _LoginComponentViewState();
}

class _LoginComponentViewState extends State<ForgotPDCompoView> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();

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
                "Forgot Password",
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
                  prefixIcon: SizedBox(
                    width: 140,
                    child: CountryPickerDropdown(
                      isExpanded: true,
                      initialValue: 'in',
                      itemBuilder: _buildDropdownItem,
                      onValuePicked: (Country country) {},
                    ),
                  ),
                  keyboardtype: TextInputType.phone,
                  controller: phoneController,
                  hinttext: "(50 | 52 | 54 | 55 | 56 | 58 | xxxxx)",
                )
              : PrimaryTextFormField(
                  controller: emailController,
                  suffixicon: const Icon(Icons.mail),
                  hinttext: "Email",
                  onTap: () => openVirtualKeyboard(),
                ),
          styleSheet.appConfig.addHeight(40),
          PrimaryBtnView(
            btnName: "Send Otp",
            onPressed: widget.onSendOTP,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}"),
          ],
        ),
      );
}
