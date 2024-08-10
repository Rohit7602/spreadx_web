import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class CheckStockAvailabilityTile extends StatelessWidget {
  CheckStockAvailabilityTile({
    super.key,
  });

  final RxBool enableCheckStockAvailability = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            title: Text("Check Stock Availability",
                style: styleSheet.TEXT_THEME.fs14Bold.copyWith(
                    color: styleSheet.COLOR.blackColor.withOpacity(0.6))),
            trailing: Obx(() => Switch.adaptive(
                value: enableCheckStockAvailability.value,
                onChanged: (v) {
                  enableCheckStockAvailability(v);
                }))),
        Obx(() => enableCheckStockAvailability.value
            ? SecondaryTextFormField(
                label: true,
                hinttext: "Initial Stock",
                onTap: () => openVirtualKeyboard(),
              )
            : const SizedBox())
      ],
    );
  }
}
