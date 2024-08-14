import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/Image_Picker/image_picker.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/main.dart';

import '../../../keyboard_handler.dart';

class BusinessProfileSetupView extends StatefulWidget {
  final void Function()? onPressedBack;
  const BusinessProfileSetupView({super.key, this.onPressedBack});

  @override
  State<BusinessProfileSetupView> createState() =>
      _BusinessProfileSetupViewState();
}

class _BusinessProfileSetupViewState extends State<BusinessProfileSetupView> {
  final RxString _fmcg = RxString("FMCG");

  final phoneController = TextEditingController();

  File? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: CustomAppbarView(title: "Business Profile"),
        body: Padding(
      padding: styleSheet.DECORATION.PADDING_20,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: widget.onPressedBack,
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: styleSheet.appConfig.getScreenHeight(context),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color:
                                          styleSheet.COLOR.productCardGreyColor,
                                      shape: BoxShape.circle),
                                  child: pickedFile != null
                                      ? Image.file(
                                          File(pickedFile!.path),
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(Icons.person,
                                          size: 80,
                                          color: styleSheet.COLOR.greyColor)),
                              InkWell(
                                onTap: () async {
                                  pickedFile = await ImageController
                                      .pickImageByGallery();
                                  setState(() {});
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: styleSheet.COLOR.primaryColor,
                                        shape: BoxShape.circle),
                                    child: Icon(Icons.edit,
                                        size: 20,
                                        color: styleSheet.COLOR.whiteColor)),
                              )
                            ],
                          ),
                          styleSheet.appConfig.addHeight(40),
                          Expanded(
                              child: Container(
                            width: 400,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: styleSheet.COLOR.blackColor
                                        .withOpacity(0.5),
                                    width: 10),
                                borderRadius: BorderRadius.circular(40)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("bot#3456784rf456\nBusiness",
                                    textAlign: TextAlign.center,
                                    style: styleSheet.TEXT_THEME.fs20Bold),
                                styleSheet.appConfig.addHeight(5),
                                Text("N/A",
                                    textAlign: TextAlign.center,
                                    style: styleSheet.TEXT_THEME.fs16Bold),
                                styleSheet.appConfig.addHeight(5),
                                Text("Phone : N/A",
                                    textAlign: TextAlign.center,
                                    style: styleSheet.TEXT_THEME.fs14Bold),
                                styleSheet.appConfig.addHeight(5),
                                Text("TRN : N/A",
                                    textAlign: TextAlign.center,
                                    style: styleSheet.TEXT_THEME.fs12Medium),
                              ],
                            ),
                          ))
                        ],
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: ListView(
                      padding: styleSheet.DECORATION.PADDING_20,
                      children: [
                        Text("Main Info : ",
                            style: styleSheet.TEXT_THEME.fs18Bold),
                        styleSheet.appConfig.addHeight(10),
                        SecondaryTextFormField(
                          onTap: () => openVirtualKeyboard(),
                          label: true,
                          hinttext: "Business Name",
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          onTap: () => openVirtualKeyboard(),
                          label: true,
                          hinttext: "Trade Licence Number",
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          onTap: () => openVirtualKeyboard(),
                          label: true,
                          hinttext: "TRN",
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          onTap: () => openVirtualKeyboard(),
                          label: true,
                          hinttext: "Business Email",
                        ),
                        styleSheet.appConfig.addHeight(20),
                        Obx(() => PrimaryDropDown(
                            dropdownValue: _fmcg.value,
                            border: true,
                            items: const ["FMCG", "DTA"],
                            value: (v) => _fmcg(v))),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          onTap: () => openVirtualKeyboard(),
                          prefixIcon: SizedBox(
                            width: 140,
                            child: CountryPickerDropdown(
                              isExpanded: true,
                              selectedItemBuilder: (Country country) {
                                return Row(
                                  children: <Widget>[
                                    CountryPickerUtils.getDefaultFlagImage(
                                        country),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Flexible(
                                        child: Text("+${country.phoneCode}")),
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
                          hinttext: "(50 | 52 | 54 | 55 | 56 | 58 | xxxxx)",
                        ),
                        styleSheet.appConfig.addHeight(20),
                        Text("Address : ",
                            style: styleSheet.TEXT_THEME.fs18Bold),
                        styleSheet.appConfig.addHeight(10),
                        SecondaryTextFormField(
                          onTap: () => openVirtualKeyboard(),
                          label: true,
                          hinttext: "Business Address",
                        ),
                        styleSheet.appConfig.addHeight(40),
                        PrimaryBtnView(
                            btnName: "Update",
                            onPressed: () {},
                            isExpanded: true)
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
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
