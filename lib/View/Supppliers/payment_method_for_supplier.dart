import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class PaymentMethodForSupplier extends StatefulWidget {
  void Function(bool) onPressedBack;
  String amount;
  PaymentMethodForSupplier(
      {required this.onPressedBack, required this.amount, super.key});

  @override
  State<PaymentMethodForSupplier> createState() =>
      _PaymentMethodForSupplierState();
}

class _PaymentMethodForSupplierState extends State<PaymentMethodForSupplier> {
  String _paymentMode = "";

  final List<Map<String, dynamic>> _splits = [];

  addSplit(String type) {
    bool isAvailable = _splits.any((v) => v['type'].toString().contains(type));
    if (!isAvailable) {
      _splits.add({'type': type, 'amount': 0});
    }
    setState(() {});
  }

  removeSplit(String type) {
    _splits.removeWhere((v) => v['type'] == type);
    setState(() {});
  }

  setPayment(String mode) {
    setState(() {
      _paymentMode = mode;
    });
  }

  isModeActive(String mode) => _paymentMode == mode;

  final amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      // _splits.add({'type': 'CARD', 'amount': 0});

      amountController.text = "0";
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                widget.onPressedBack(false);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(20),
        Text("Total", style: styleSheet.TEXT_THEME.fs14Bold),
        styleSheet.appConfig.addHeight(10),
        Text("AED ${widget.amount}",
            style: styleSheet.TEXT_THEME.fs20Bold
                .copyWith(fontWeight: FontWeight.w900)),
        styleSheet.appConfig.addHeight(10),
        Text("${0} of ${0}", style: styleSheet.TEXT_THEME.fs14Bold),
        styleSheet.appConfig.addHeight(20),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: styleSheet.COLOR.greyColor.withOpacity(0.1)),
                child: _splits.isEmpty
                    ? Text("No Method Selected",
                        style: styleSheet.TEXT_THEME.fs14Bold)
                    : Column(
                        children: List.generate(_splits.length, (i) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: styleSheet.COLOR.keyboardBtnColor),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(_splits[i]['type'],
                                        style: styleSheet.TEXT_THEME.fs14Bold)),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //   _splits[i]['amount'].toString(),
                                      //   style:
                                      //       styleSheet.TEXT_THEME.fs14Bold,
                                      // ),

                                      SizedBox(
                                        width: 100,
                                        child: PlainTextField(
                                          allowNumbers: true,
                                          onTap: () => openVirtualKeyboard(),
                                          controller: amountController,
                                          hinttext: "0",
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () =>
                                              removeSplit(_splits[i]['type']),
                                          icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: styleSheet.COLOR.redColor))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
              ),
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(20),
        Align(
            alignment: Alignment.centerLeft,
            child:
                Text("Payment Methods", style: styleSheet.TEXT_THEME.fs14Bold)),
        styleSheet.appConfig.addHeight(5),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => addSplit("CASH"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: styleSheet.COLOR.keyboardBtnColor),
                  child: Text("CASH", style: styleSheet.TEXT_THEME.fs12Bold),
                ),
              ),
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(10),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => addSplit("CARD"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: styleSheet.COLOR.keyboardBtnColor),
                  child: Text("CARD", style: styleSheet.TEXT_THEME.fs12Bold),
                ),
              ),
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(20),
        Row(
          children: [
            Expanded(
              child: SecondaryButtonView(
                  btnName: "Payment".toUpperCase(),
                  onPressed: () {
                    widget.onPressedBack(true);
                  }),
            ),
          ],
        ),
      ],
    ).paddingAll(20);
  }
}
