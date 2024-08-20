import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/View/Supppliers/payment_method_for_supplier.dart';
import 'package:spreadx_web/main.dart';

import '../../Components/primary_textfield.dart';
import '../../Data/local_data.dart';
import '../../keyboard_handler.dart';

class SupplierPaymentView extends StatefulWidget {
  void Function() onPressedBack;
  bool isComingFromCustomer;
  List<TransactionModel> tr;
  SupplierPaymentView(
      {required this.onPressedBack,
      this.isComingFromCustomer = false,
      this.tr = const [],
      super.key});

  @override
  State<SupplierPaymentView> createState() => _SupplierPaymentViewState();
}

class _SupplierPaymentViewState extends State<SupplierPaymentView> {
  RxString selectedView = RxString("default");

  final List<TextEditingController> amounts = [];

  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      for (var value in widget.tr) {
        TextEditingController amount = TextEditingController();
        amount.text = value.price;
        amounts.add(amount);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var defaultView = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: widget.onPressedBack,
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(20),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.tr.length, (i) {
            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: styleSheet.DECORATION.RADIUS_10,
                  color: styleSheet.COLOR.bgLightBlueColor2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      // widget.tr[i].trNumber,
                      widget.isComingFromCustomer ? "IN34342" : "PIN34342",
                      style: styleSheet.TEXT_THEME.fs14Bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "(AED ${widget.tr[i].price})",
                      textAlign: TextAlign.center,
                      style: styleSheet.TEXT_THEME.fs14Normal,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 100,
                        child: PlainTextField(
                          allowNumbers: true,
                          onTap: () => openVirtualKeyboard(),
                          controller: amounts[i],
                          hinttext: "0",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        styleSheet.appConfig.addHeight(30),
        PrimaryBtnView(
            isExpanded: true,
            btnName: "Submit",
            onPressed: () {
              totalAmount = 0;
              for (var element in amounts) {
                totalAmount += double.parse(element.text);
              }

              selectedView("payment");
            })
      ],
    ).paddingAll(20);
    return Obx(() {
      if (selectedView.value == "payment") {
        return PaymentMethodForSupplier(
          amount: totalAmount.toString(),
          onPressedBack: (val) {
            if (val) {
              widget.onPressedBack();
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
