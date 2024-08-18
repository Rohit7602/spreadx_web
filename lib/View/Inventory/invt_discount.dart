import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/View/Inventory/invoice_view.dart';
import 'package:spreadx_web/main.dart';

class InventoryDiscountView extends StatelessWidget {
  void Function(bool) onPressedBack;
  InventoryDiscountView({required this.onPressedBack, super.key});

  RxString selectedView = RxString("default");
  @override
  Widget build(BuildContext context) {
    var defaultView = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              onPressedBack(false);
            },
            icon: const Icon(Icons.arrow_back)),
        Container(
          padding: styleSheet.DECORATION.PADDING_20,
          decoration: BoxDecoration(
              color: styleSheet.COLOR.whiteColor,
              borderRadius: styleSheet.DECORATION.RADIUS_5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Total",
                    style: styleSheet.TEXT_THEME.fs14Medium,
                  ),
                  styleSheet.appConfig.addHeight(5),
                  Text(
                    "AED 0.00",
                    style: styleSheet.TEXT_THEME.fs16Bold,
                  ),
                ],
              )
            ],
          ),
        ),
        const Spacer(),
        PrimaryBtnView(
            isExpanded: true,
            btnName: "Save",
            onPressed: () {
              selectedView("invoice");
            })
      ],
    ).paddingAll(20);

    return Obx(() {
      if (selectedView.value == "invoice") {
        return InvoiceView(
          isPurchasedIN: true,
          onPressedBack: () {
            onPressedBack(true);
          },
        );
      } else {
        return defaultView;
      }
    });
  }
}
