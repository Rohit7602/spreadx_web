// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/main.dart';

import '../Button/primary_btn.dart';

class SplitPayDialog extends StatefulWidget {
  String amount;
  String method;
  SplitPayDialog({
    super.key,
    required this.amount,
    required this.method,
  });

  @override
  State<SplitPayDialog> createState() => _SplitPayDialogState();
}

class _SplitPayDialogState extends State<SplitPayDialog> {
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      _splits.add({'type': 'CARD', 'amount': widget.amount});
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            styleSheet.appConfig.addHeight(20),
            Text("Total", style: styleSheet.TEXT_THEME.fs14Bold),
            styleSheet.appConfig.addHeight(10),
            Text("AED ${widget.amount}",
                style: styleSheet.TEXT_THEME.fs20Bold
                    .copyWith(fontWeight: FontWeight.w900)),
            styleSheet.appConfig.addHeight(10),
            Text("${widget.amount} of ${widget.amount}",
                style: styleSheet.TEXT_THEME.fs14Bold),
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
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(_splits[i]['type'],
                                            style: styleSheet
                                                .TEXT_THEME.fs14Bold)),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _splits[i]['amount'].toString(),
                                            style:
                                                styleSheet.TEXT_THEME.fs14Bold,
                                          ),
                                          IconButton(
                                              onPressed: () => removeSplit(
                                                  _splits[i]['type']),
                                              icon: Icon(
                                                  Icons.remove_circle_outline,
                                                  color: styleSheet
                                                      .COLOR.redColor))
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
                child: Text("Payment Methods",
                    style: styleSheet.TEXT_THEME.fs14Bold)),
            styleSheet.appConfig.addHeight(5),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => addSplit("CASH"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: styleSheet.COLOR.keyboardBtnColor),
                      child:
                          Text("CASH", style: styleSheet.TEXT_THEME.fs12Bold),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: styleSheet.COLOR.keyboardBtnColor),
                      child:
                          Text("CARD", style: styleSheet.TEXT_THEME.fs12Bold),
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
                      btnName: "Payment".toUpperCase(), onPressed: () {}),
                ),
              ],
            ),
          ],
        ));
  }
}
