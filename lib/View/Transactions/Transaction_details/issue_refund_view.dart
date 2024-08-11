import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Product/add_product/widgets/add_product_btn.dart';
import 'package:spreadx_web/View/Transactions/Transaction_details/refund_summary_view.dart';
import 'package:spreadx_web/main.dart';

class IssueRefundView extends StatefulWidget {
  final void Function()? onPressedBack;
  const IssueRefundView({super.key, required this.onPressedBack});

  @override
  State<IssueRefundView> createState() => _IssueRefundViewState();
}

class _IssueRefundViewState extends State<IssueRefundView> {
  RxString refundAmountValue = RxString("0.0");
  Rx<List<IssueRefundModel>> selectedItems = Rx<List<IssueRefundModel>>([]);

  RxString selected = RxString("default");
  @override
  Widget build(BuildContext context) {
    final defaultView = Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: styleSheet.appConfig.getScreenWidth(context),
      height: styleSheet.appConfig.getScreenHeight(context),
      child: Padding(
        padding: styleSheet.DECORATION.PADDING_20,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: widget.onPressedBack,
                  icon: const Icon(Icons.arrow_back_outlined)),
            ),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text("Refund Amount",
                        style: styleSheet.TEXT_THEME.fs20Bold),
                    styleSheet.appConfig.addHeight(20),
                    Obx(() => Text(refundAmountValue.value,
                        style: styleSheet.TEXT_THEME.fs24Bold)),
                    Divider(
                      color: styleSheet.COLOR.blackColor,
                    ),
                    styleSheet.appConfig.addHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Max. Refundable Amount",
                            style: styleSheet.TEXT_THEME.fs18Bold
                                .copyWith(color: styleSheet.COLOR.greyColor)),
                        Text("AED 7.00",
                            style: styleSheet.TEXT_THEME.fs18Bold
                                .copyWith(color: styleSheet.COLOR.greyColor)),
                      ],
                    ),
                    styleSheet.appConfig.addHeight(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select All Items",
                            style: styleSheet.TEXT_THEME.fs20Bold),
                        Obx(() => GestureDetector(
                              onTap: () {
                                if (selectedItems.value.length ==
                                    LocalData.issueRefundData.length) {
                                  for (var data in LocalData.issueRefundData) {
                                    if (selectedItems.value.contains(data)) {
                                      selectedItems
                                          .update((v) => v!.remove(data));
                                    }
                                  }
                                } else {
                                  for (var data in LocalData.issueRefundData) {
                                    if (!(selectedItems.value.contains(data))) {
                                      selectedItems.update((v) => v!.add(data));
                                    }
                                  }
                                }

                                refundAmountValue(selectedItems.value.isEmpty
                                    ? "0.0"
                                    : selectedItems.value
                                        .map((e) => e.amount)
                                        .reduce((a, b) => a + b)
                                        .toString());
                              },
                              child: selectedItems.value.length ==
                                      LocalData.issueRefundData.length
                                  ? Icon(Icons.check_circle,
                                      size: 40,
                                      color: styleSheet.COLOR.greenColor)
                                  : Icon(Icons.circle_outlined,
                                      size: 40,
                                      color: styleSheet.COLOR.greyColor),
                            ))
                      ],
                    ),
                    Divider(
                      color: styleSheet.COLOR.greyColor.withOpacity(0.5),
                    ),
                    ListView.separated(
                        itemBuilder: (context, i) {
                          final data = LocalData.issueRefundData[i];
                          return Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: ListTile(
                                    title: Text(data.item.title),
                                    subtitle: Text(data.item.description),
                                  )),
                              Expanded(
                                  child: Text("x${data.quantity}0",
                                      textAlign: TextAlign.right,
                                      style: styleSheet.TEXT_THEME.fs14Bold
                                          .copyWith(
                                              color: styleSheet.COLOR.blackColor
                                                  .withOpacity(0.6)))),
                              Expanded(
                                  child: Text("AED ${data.amount}0",
                                      textAlign: TextAlign.right,
                                      style: styleSheet.TEXT_THEME.fs18Bold)),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(() => GestureDetector(
                                        onTap: () {
                                          if (selectedItems.value
                                              .contains(data)) {
                                            selectedItems
                                                .update((v) => v!.remove(data));
                                          } else {
                                            selectedItems
                                                .update((v) => v!.add(data));
                                          }

                                          refundAmountValue(
                                              selectedItems.value.isEmpty
                                                  ? "0.0"
                                                  : selectedItems.value
                                                      .map((e) => e.amount)
                                                      .reduce((a, b) => a + b)
                                                      .toString());
                                        },
                                        child: selectedItems.value
                                                .contains(data)
                                            ? Icon(Icons.check_circle,
                                                size: 40,
                                                color:
                                                    styleSheet.COLOR.greenColor)
                                            : Icon(Icons.circle_outlined,
                                                size: 40,
                                                color:
                                                    styleSheet.COLOR.greyColor),
                                      )),
                                ],
                              )),
                            ],
                          );
                        },
                        separatorBuilder: (context, i) {
                          return styleSheet.appConfig.addHeight(2);
                        },
                        itemCount: LocalData.issueRefundData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics()),
                    Divider(
                      color: styleSheet.COLOR.greyColor.withOpacity(0.5),
                    ),
                  ],
                )),
                AddProductBtn(
                    ontap: () {
                      selected("summary");
                    },
                    title: "Next",
                    icon: Icons.arrow_forward,
                    trailing: true)
              ],
            ))
          ],
        ),
      ),
    )));

    return Obx(() {
      if (selected.value == "default") {
        return defaultView;
      } else {
        return RefundSummaryView(onPressedBack: () {
          selected("default");
        });
      }
    });
  }
}
