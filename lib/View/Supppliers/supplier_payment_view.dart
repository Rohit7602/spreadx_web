import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/View/Supppliers/payment_method_for_supplier.dart';
import 'package:spreadx_web/main.dart';

class SupplierPaymentView extends StatelessWidget {
  void Function() onPressedBack;
  bool isComingFromCustomer;
  SupplierPaymentView(
      {required this.onPressedBack,
      this.isComingFromCustomer = false,
      super.key});

  RxString selectedView = RxString("default");

  @override
  Widget build(BuildContext context) {
    var defaultView = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: onPressedBack,
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: styleSheet.DECORATION.RADIUS_10,
              color: styleSheet.COLOR.bgLightBlueColor2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isComingFromCustomer ? "IN34342" : "PIN34342",
                style: styleSheet.TEXT_THEME.fs14Bold,
              ),
              Text(
                "(AED 12.00)",
                style: styleSheet.TEXT_THEME.fs14Normal,
              ),
              Text(
                "12.00",
                style: styleSheet.TEXT_THEME.fs14Bold,
              ),
            ],
          ),
        ),
        styleSheet.appConfig.addHeight(30),
        PrimaryBtnView(
            isExpanded: true,
            btnName: "Submit",
            onPressed: () {
              selectedView("payment");
            })
      ],
    ).paddingAll(20);
    return Obx(() {
      if (selectedView.value == "payment") {
        return PaymentMethodForSupplier(
          onPressedBack: (val) {
            if (val) {
              onPressedBack();
            } else {
              selectedView("default");
            }
          },
        );
      } else {
        return defaultView;
      }
    });
  }
}
