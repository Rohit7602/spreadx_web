import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(Country) onValuePick;
  const PhoneTextField(
      {super.key, required this.controller, required this.onValuePick});

  @override
  Widget build(BuildContext context) {
    return SecondaryTextFormField(
      onTap: () => openVirtualKeyboard(),
      prefixIcon: SizedBox(
        width: 140,
        child: CountryPickerDropdown(
          isExpanded: true,
          initialValue: 'in',
          itemBuilder: _buildDropdownItem,
          onValuePicked: (Country country) {
            onValuePick(country);
          },
        ),
      ),
      keyboardtype: TextInputType.phone,
      controller: controller,
      hinttext: "(50 | 52 | 54 | 55 | 56 | 58 | xxxxx)",
    );
  }
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
