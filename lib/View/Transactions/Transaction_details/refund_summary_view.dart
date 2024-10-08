import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/View/Inventory/invoice_view.dart';
import 'package:spreadx_web/main.dart';

class RefundSummaryView extends StatefulWidget {
  final void Function(bool)? onPressedBack;
  bool isCustomerSide;
  RefundSummaryView(
      {super.key, required this.onPressedBack, required this.isCustomerSide});

  @override
  State<RefundSummaryView> createState() => _RefundSummaryViewState();
}

class _RefundSummaryViewState extends State<RefundSummaryView> {
  RxString selectedReason = RxString("");
  RxString selectedView = RxString("default");
  @override
  Widget build(BuildContext context) {
    var defaultView = Padding(
        padding: styleSheet.DECORATION.PADDING_20,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    widget.onPressedBack!(false);
                  },
                  icon: const Icon(Icons.arrow_back_outlined)),
            ),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text("Refund Amount",
                        style: styleSheet.TEXT_THEME.fs18Bold),
                    styleSheet.appConfig.addHeight(20),
                    Text("AED 1.00", style: styleSheet.TEXT_THEME.fs28Bold),
                    styleSheet.appConfig.addHeight(20),
                    Text("[DEFAULT - PCS]",
                        style: styleSheet.TEXT_THEME.fs18Bold
                            .copyWith(color: styleSheet.COLOR.greyColor)),
                    styleSheet.appConfig.addHeight(30),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Refund Reason",
                            style: styleSheet.TEXT_THEME.fs18Bold)),
                    styleSheet.appConfig.addHeight(40),
                    Padding(
                      padding: styleSheet.DECORATION.PADDING_10,
                      child: Obx(() => Row(
                            children: [
                              Expanded(
                                child: RefundReasonTile(
                                    title: "Product Exchange",
                                    selected: selectedReason.value,
                                    ontap: (v) {
                                      selectedReason(v);
                                    }),
                              ),
                              styleSheet.appConfig.addWidth(80),
                              Expanded(
                                child: RefundReasonTile(
                                    title: "Item Expired",
                                    selected: selectedReason.value,
                                    ontap: (v) {
                                      selectedReason(v);
                                    }),
                              ),
                            ],
                          )),
                    ),
                    Divider(color: styleSheet.COLOR.greyColor.withOpacity(0.5)),
                    Padding(
                      padding: styleSheet.DECORATION.PADDING_10,
                      child: Obx(() => Row(
                            children: [
                              Expanded(
                                child: RefundReasonTile(
                                    title: "Item Break Down",
                                    selected: selectedReason.value,
                                    ontap: (v) {
                                      selectedReason(v);
                                    }),
                              ),
                              styleSheet.appConfig.addWidth(80),
                              const Expanded(child: SizedBox()),
                            ],
                          )),
                    ),
                  ],
                )),
                PrimaryBtnView(
                    btnName: "Submit Return",
                    onPressed: () {
                      selectedView("invoice");
                    },
                    isExpanded: true)
              ],
            ))
          ],
        ));
    return Obx(() {
      if (selectedView.value == "invoice") {
        return InvoiceView(
          isCustomerSide: widget.isCustomerSide,
          onPressedBack: () {
            widget.onPressedBack!(true);
          },
        );
      } else {
        return defaultView;
      }
    });
  }
}

class RefundReasonTile extends StatelessWidget {
  final String title;
  final String selected;
  final Function(String) ontap;
  const RefundReasonTile(
      {super.key,
      required this.title,
      required this.selected,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap(title);
      },
      child: Row(
        children: [
          const Icon(Icons.circle, size: 10),
          styleSheet.appConfig.addWidth(20),
          Expanded(child: Text(title, style: styleSheet.TEXT_THEME.fs16Bold)),
          styleSheet.appConfig.addWidth(20),
          selected == title
              ? Icon(Icons.check_circle,
                  size: 30, color: styleSheet.COLOR.greenColor)
              : Icon(Icons.circle_outlined,
                  size: 30, color: styleSheet.COLOR.greyColor)
        ],
      ),
    );
  }
}
