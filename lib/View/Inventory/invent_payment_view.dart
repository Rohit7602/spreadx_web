import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/money_dialog.dart';
import 'package:spreadx_web/Components/Dialog/split_pay.dart';
import 'package:spreadx_web/Components/keyboard_component.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Inventory/invoice_view.dart';
import 'package:spreadx_web/main.dart';

class InventoryPaymentView extends StatefulWidget {
  void Function(bool) onPressedBack;

  InventoryPaymentView({required this.onPressedBack, super.key});

  @override
  State<InventoryPaymentView> createState() => _InventoryPaymentViewState();
}

class _InventoryPaymentViewState extends State<InventoryPaymentView> {
  final amountController = TextEditingController();

  var product = Get.find<ProductController>();

  var btnList = LocalData.buttonList;

  bool isProductCheck = false;

  bool isQueueList = false;

  bool isShowAssignedCustomer = false;

  dynamic isPaymentCash;

  int selectedValue = 0;

  RxString selectedView = RxString("default");

  @override
  Widget build(BuildContext context) {
    var defaultView = SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: styleSheet.COLOR.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  widget.onPressedBack(true);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Container(
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

            styleSheet.appConfig.addHeight(10),

            PlainTextField(
              hinttext: "0.00",
              controller: amountController,
              suffixicon: GestureDetector(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return MoneyDialog();
                      }).then((val) {
                    amountController.text = val;
                    setState(() {});
                  });
                },
                child: Image.asset(
                  styleSheet.icons.moneyIcon,
                  width: 40,
                ),
              ),
            ),

            styleSheet.appConfig.addHeight(8),

            // Widget to show payment Methods Toggle
            Row(
              children: [
                OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            isPaymentCash != null && isPaymentCash
                                ? styleSheet.COLOR.primaryColor
                                : null)),
                    onPressed: () {
                      isPaymentCash = true;
                      setState(() {});
                    },
                    child: Text(
                      "Cash",
                      style: styleSheet.TEXT_THEME.fs12Normal.copyWith(
                          color: isPaymentCash != null && isPaymentCash
                              ? styleSheet.COLOR.whiteColor
                              : styleSheet.COLOR.primaryColor),
                    )),
                styleSheet.appConfig.addWidth(10),
                OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            isPaymentCash != null && !isPaymentCash
                                ? styleSheet.COLOR.primaryColor
                                : null)),
                    onPressed: () {
                      isPaymentCash = false;
                      setState(() {});
                    },
                    child: Text(
                      "Card",
                      style: styleSheet.TEXT_THEME.fs12Normal.copyWith(
                          color: isPaymentCash != null && !isPaymentCash
                              ? styleSheet.COLOR.whiteColor
                              : styleSheet.COLOR.primaryColor),
                    )),
              ],
            ),
            styleSheet.appConfig.addHeight(8),
            Row(
              children: [
                Expanded(
                    child: OutlineButtonView(
                  btnColor: styleSheet.COLOR.whiteColor,
                  txtColor: styleSheet.COLOR.blackColor,
                  btnName: "Split Pay",
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => SplitPayDialog(
                        amount: amountController.text.isEmpty
                            ? "0"
                            : amountController.text,
                        method: isPaymentCash != null
                            ? isPaymentCash
                                ? "CASH"
                                : 'CARD'
                            : "CASH"),
                  ),
                ))
              ],
            ),
            styleSheet.appConfig.addHeight(12),

            KeyboardComponentView(
              onInput: (value) {
                setState(() => amountController.text += value);
              },
              onValueRemove: () {
                if (amountController.text.isNotEmpty) {
                  amountController.text = amountController.text
                      .substring(0, amountController.text.length - 1);
                }
                setState(() {});
              },
            ),
            styleSheet.appConfig.addHeight(12),

            PrimaryBtnView(
                isExpanded: true,
                btnName: "PAY",
                onPressed: () {
                  selectedView("invoice");
                })
          ],
        ),
      ),
    );

    return Obx(() {
      if (selectedView.value == "invoice") {
        return InvoiceView(
          onPressedBack: () {
            selectedView("default");
          },
        );
      } else {
        return defaultView;
      }
    });
  }
}
