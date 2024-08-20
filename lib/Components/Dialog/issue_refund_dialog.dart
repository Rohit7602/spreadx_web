import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class IssueRefundDialog extends StatefulWidget {
  IssueRefundModel data;

  IssueRefundDialog({required this.data, super.key});

  @override
  State<IssueRefundDialog> createState() => _IssueRefundDialogState();
}

class _IssueRefundDialogState extends State<IssueRefundDialog> {
  final updateAmtController = TextEditingController();
  final updateQTYController = TextEditingController();

  @override
  void initState() {
    getInitialState();
    super.initState();
  }

  getInitialState() {
    updateAmtController.text = widget.data.amount.toString();
    updateQTYController.text = widget.data.quantity.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.data.item.title),
              ],
            ),
            styleSheet.appConfig.addHeight(10),
            Text(
              "QUANTITY",
              style: styleSheet.TEXT_THEME.fs12Bold,
            ),
            SecondaryTextFormField(
              onTap: () => openVirtualKeyboard(),
              onChange: (val) {
                setState(() {});
              },
              controller: updateQTYController,
              allowNumbers: true,
              hinttext: "0.0",
            ),
            styleSheet.appConfig.addHeight(20),
            Text(
              "PRICE",
              style: styleSheet.TEXT_THEME.fs12Bold,
            ),
            SecondaryTextFormField(
              onTap: () => openVirtualKeyboard(),
              onChange: (val) {
                setState(() {});
              },
              controller: updateAmtController,
              allowNumbers: true,
              hinttext: "0.0",
            ),
            styleSheet.appConfig.addHeight(20),
            Container(
              padding: styleSheet.DECORATION.PADDING_10,
              width: styleSheet.appConfig.getScreenWidth(context),
              decoration: BoxDecoration(
                  borderRadius: styleSheet.DECORATION.RADIUS_5,
                  color: styleSheet.COLOR.discountCardGrenColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New Total",
                    style: styleSheet.TEXT_THEME.fs10Bold,
                  ),
                  styleSheet.appConfig.addHeight(4),
                  Text(
                    "AED ${updateAmtController.text.isNotEmpty && updateQTYController.text.isNotEmpty ? double.parse(updateAmtController.text) * double.parse(updateQTYController.text) : "0"}",
                    style: styleSheet.TEXT_THEME.fs16Bold,
                  ),
                ],
              ),
            ),
            styleSheet.appConfig.addHeight(20),
            PrimaryBtnView(
                isExpanded: true,
                btnName: "UPDATE",
                onPressed: () {
                  Navigator.of(context).pop(
                      [updateAmtController.text, updateQTYController.text]);
                })
          ],
        ));
  }
}
