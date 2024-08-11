import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dialog/update_email_dialog.dart';
import 'package:spreadx_web/Components/Dialog/update_phone_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class ProfileSetupView extends StatelessWidget {
  final void Function()? onPressedBack;
  ProfileSetupView({super.key, this.onPressedBack});

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppbarView(title: "Profile"),
      body: Padding(
        padding: styleSheet.DECORATION.PADDING_20,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: onPressedBack,
                  icon: const Icon(Icons.arrow_back_outlined)),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color:
                                          styleSheet.COLOR.productCardGreyColor,
                                      shape: BoxShape.circle),
                                  child: Text("150 X 150",
                                      style: styleSheet.TEXT_THEME.fs18Bold
                                          .copyWith(
                                              color:
                                                  styleSheet.COLOR.greyColor))),
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: styleSheet.COLOR.primaryColor,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.edit,
                                      size: 30,
                                      color: styleSheet.COLOR.whiteColor))
                            ],
                          ),
                          styleSheet.appConfig.addHeight(10),
                          Text("bot#3456784rf456",
                              style: styleSheet.TEXT_THEME.fs16Bold)
                        ],
                      )),
                  styleSheet.appConfig.addWidth(20),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          SecondaryTextFormField(
                            label: true,
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "First Name",
                            controller: firstName,
                          ),
                          styleSheet.appConfig.addHeight(20),
                          SecondaryTextFormField(
                            label: true,
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "Last Name",
                            controller: lastName,
                          ),
                          styleSheet.appConfig.addHeight(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SecondaryTextFormField(
                                onTap: () => openVirtualKeyboard(),
                                prefixIcon: SizedBox(
                                  width: 140,
                                  child: CountryPickerDropdown(
                                    isExpanded: true,
                                    selectedItemBuilder: (Country country) {
                                      return Row(
                                        children: <Widget>[
                                          CountryPickerUtils
                                              .getDefaultFlagImage(country),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          Flexible(
                                              child: Text(
                                                  "+${country.phoneCode}")),
                                        ],
                                      );
                                    },
                                    initialValue: 'in',
                                    itemBuilder: _buildDropdownItem,
                                    onValuePicked: (Country country) {},
                                  ),
                                ),
                                keyboardtype: TextInputType.phone,
                                controller: phoneController,
                                hinttext:
                                    "(50 | 52 | 54 | 55 | 56 | 58 | xxxxx)",
                              ),
                              styleSheet.appConfig.addHeight(10),
                              TextButtonView(
                                  btnName: "Update Phone",
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return UpdatePhoneDialog();
                                        });
                                  })
                            ],
                          ),
                          styleSheet.appConfig.addHeight(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SecondaryTextFormField(
                                onTap: () => openVirtualKeyboard(),
                                keyboardtype: TextInputType.emailAddress,
                                controller: emailController,
                                label: true,
                                hinttext: "Email",
                              ),
                              styleSheet.appConfig.addHeight(10),
                              TextButtonView(
                                  btnName: "Update Email",
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return UpdateEmailDialog();
                                        });
                                  })
                            ],
                          ),
                          styleSheet.appConfig.addHeight(10),
                          PrimaryBtnView(
                              btnName: "Update",
                              isExpanded: true,
                              onPressed: () {})
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
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
            Flexible(child: Text("+${country.phoneCode}")),
          ],
        ),
      );
}
