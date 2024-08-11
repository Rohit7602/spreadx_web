import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/View/Product/add_product/widgets/add_product_btn.dart';
import 'package:spreadx_web/View/Transactions/Transaction_details/issue_refund_view.dart';
import 'package:spreadx_web/main.dart';

class TransactionDetailsView extends StatefulWidget {
  final void Function()? onPressedBack;
  const TransactionDetailsView({super.key, required this.onPressedBack});

  @override
  State<TransactionDetailsView> createState() => _TransactionDetailsViewState();
}

class _TransactionDetailsViewState extends State<TransactionDetailsView> {
  final List<String> titleBar = ["No.", "Item", "Price", "Qty", "Total"];
  final List<Map<String, dynamic>> data = [
    {
      "Item": {"title": "default - PCS", "description": "default"},
      "Price": "1.00",
      "Qty": "1.0",
      "Total": "1.00"
    },
    {
      "Item": {"title": "default - PCS 2", "description": "default - 2"},
      "Price": "2.00",
      "Qty": "1.0",
      "Total": "2.00"
    },
  ];

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// *********************************** Header ***********************************
                      /// ******************************************************************************
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("INVOICE",
                                    style: styleSheet.TEXT_THEME.fs12Bold
                                        .copyWith(
                                            color: styleSheet.COLOR.greyColor)),
                                styleSheet.appConfig.addHeight(5),
                                Container(
                                  height: 130,
                                  padding: styleSheet.DECORATION.PADDING_15,
                                  decoration: BoxDecoration(
                                      color: styleSheet.COLOR.whiteColor),
                                  child: Column(
                                    children: [
                                      const _TransactionHeaderTile(
                                          title: "Invoice Number",
                                          value: "IN4290003"),
                                      styleSheet.appConfig.addHeight(5),
                                      _TransactionHeaderTile(
                                          title: "Date",
                                          value:
                                              DateFormat("dd MMM yyyy hh:mm a")
                                                  .format(DateTime.now())),
                                      styleSheet.appConfig.addHeight(5),
                                      const _TransactionHeaderTile(
                                          title: "customer",
                                          value: "VISITOR VISITOR"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          styleSheet.appConfig.addWidth(5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("SUMMARY",
                                    style: styleSheet.TEXT_THEME.fs12Bold
                                        .copyWith(
                                            color: styleSheet.COLOR.greyColor)),
                                styleSheet.appConfig.addHeight(5),
                                Container(
                                  height: 130,
                                  padding: styleSheet.DECORATION.PADDING_15,
                                  decoration: BoxDecoration(
                                      color: styleSheet.COLOR.whiteColor),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const _TransactionHeaderTile(
                                          title: "Sub Total", value: "1.00"),
                                      styleSheet.appConfig.addHeight(5),
                                      _TransactionHeaderTile(
                                          title: "Discount",
                                          color: styleSheet.COLOR.redColor,
                                          value: "0.00"),
                                      styleSheet.appConfig.addHeight(5),
                                      const _TransactionHeaderTile(
                                          title: "Net Total", value: "1.00"),
                                      styleSheet.appConfig.addHeight(5),
                                      _TransactionHeaderTile(
                                          title: "Grand Total",
                                          value: "AED 1.00",
                                          style: styleSheet.TEXT_THEME.fs18Bold
                                              .copyWith(
                                                  color: styleSheet
                                                      .COLOR.primaryColor)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox())
                        ],
                      ),

                      styleSheet.appConfig.addHeight(10),
                      Text("Returns (0)",
                          style: styleSheet.TEXT_THEME.fs20Bold
                              .copyWith(color: styleSheet.COLOR.redColor)),
                      styleSheet.appConfig.addHeight(10),
                      Text("Products (1)",
                          style: styleSheet.TEXT_THEME.fs20Bold
                              .copyWith(color: styleSheet.COLOR.primaryColor)),
                      styleSheet.appConfig.addHeight(20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            ...List.generate(titleBar.length, (i) {
                              return Expanded(
                                  flex: i == 1 ? 3 : 1,
                                  child: Text(titleBar[i],
                                      style: styleSheet.TEXT_THEME.fs14Bold
                                          .copyWith(
                                              color:
                                                  styleSheet.COLOR.greyColor)));
                            })
                          ],
                        ),
                      ),
                      styleSheet.appConfig.addHeight(10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(data.length, (i) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  color: styleSheet.COLOR.whiteColor,
                                  child: Row(
                                    children: [
                                      ...List.generate(
                                          data[i].values.length + 1, (j) {
                                        return Expanded(
                                            flex: j == 1 ? 3 : 1,
                                            child: j == 1
                                                ? ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    title: Text((data[i]
                                                            .values
                                                            .toList())[j - 1]
                                                        ['title']),
                                                    subtitle: Text((data[i]
                                                            .values
                                                            .toList())[j - 1]
                                                        ['description']),
                                                  )
                                                : Text(
                                                    j == 0
                                                        ? (i + 1).toString()
                                                        : (data[i]
                                                                    .values
                                                                    .toList())[
                                                                j - 1]
                                                            .toString(),
                                                    style: styleSheet
                                                        .TEXT_THEME.fs14Bold
                                                        .copyWith(
                                                            color: styleSheet
                                                                .COLOR
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.6))));
                                      })
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                              child: AddProductBtn(
                                  ontap: () {},
                                  title: "Share",
                                  icon: Icons.share_outlined)),
                          styleSheet.appConfig.addWidth(15),
                          Expanded(
                              child: AddProductBtn(
                                  ontap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const ReceiptsDialog();
                                        });
                                  },
                                  title: "Receipts",
                                  icon: Icons.receipt_outlined)),
                          styleSheet.appConfig.addWidth(15),
                          Expanded(
                              child: AddProductBtn(
                                  ontap: () {},
                                  title: "Reprint",
                                  icon: Icons.print_outlined)),
                          styleSheet.appConfig.addWidth(15),
                          Expanded(
                              child: AddProductBtn(
                                  ontap: () {
                                    selected("refund");
                                  },
                                  title: "Issue Refund",
                                  icon: Icons.wallet)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      )),
    );

    return Obx(() {
      if (selected.value == "default") {
        return defaultView;
      } else {
        return IssueRefundView(onPressedBack: () {
          selected("default");
        });
      }
    });
  }
}

class _TransactionHeaderTile extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? style;
  final Color? color;
  const _TransactionHeaderTile(
      {super.key,
      required this.title,
      required this.value,
      this.style,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(title.toUpperCase(),
                style: style ??
                    styleSheet.TEXT_THEME.fs14Bold
                        .copyWith(color: color ?? styleSheet.COLOR.greyColor))),
        Expanded(
            child: Text(value,
                textAlign: TextAlign.right,
                style: style ??
                    styleSheet.TEXT_THEME.fs16Bold
                        .copyWith(color: color ?? styleSheet.COLOR.blackColor)))
      ],
    );
  }
}

class ReceiptsDialog extends StatelessWidget {
  const ReceiptsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "",
        child: Padding(
            padding: styleSheet.DECORATION.PADDING_10,
            child: ListView.separated(
                separatorBuilder: (context, i) {
                  return styleSheet.appConfig.addHeight(5);
                },
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Container(
                    padding: styleSheet.DECORATION.PADDING_10,
                    decoration: BoxDecoration(
                        color: styleSheet.COLOR.discountCardGrenColor
                            .withOpacity(0.5),
                        borderRadius: styleSheet.DECORATION.RADIUS_5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("PR4290002",
                                style: styleSheet.TEXT_THEME.fs18Bold),
                            Text("AED 1.00",
                                style: styleSheet.TEXT_THEME.fs18Normal),
                          ],
                        ),
                        styleSheet.appConfig.addHeight(5),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 27,
                              padding: styleSheet.DECORATION.PADDING_5,
                              decoration: BoxDecoration(
                                  borderRadius: styleSheet.DECORATION.RADIUS_5,
                                  color: styleSheet.COLOR.greenColor),
                              child: Text("CASH",
                                  style: styleSheet.TEXT_THEME.fs12Bold
                                      .copyWith(
                                          color: styleSheet.COLOR.whiteColor)),
                            ),
                            styleSheet.appConfig.addWidth(10),
                            Container(
                              width: 4,
                              height: 27,
                              decoration: BoxDecoration(
                                  color: styleSheet.COLOR.orange,
                                  borderRadius:
                                      styleSheet.DECORATION.RADIUS_10),
                            )
                          ],
                        ),
                        styleSheet.appConfig.addHeight(5),
                        Text(
                            DateFormat("yyyy-MM-dd hh:mm:ss")
                                .format(DateTime.now()),
                            style: styleSheet.TEXT_THEME.fs14Bold)
                      ],
                    ),
                  );
                })));
  }
}
