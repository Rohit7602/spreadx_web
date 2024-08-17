// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Inventory/invent_payment_view.dart';
import 'package:spreadx_web/View/Transactions/Transaction_details/transaction_details_view.dart';
import 'package:spreadx_web/main.dart';

class CustomerTransactionView extends StatefulWidget {
  void Function() onPressedBack;
  bool isShowIssueRefund;
  CustomerTransactionView(
      {required this.onPressedBack, this.isShowIssueRefund = true, super.key});

  @override
  State<CustomerTransactionView> createState() =>
      _CustomerTransactionViewState();
}

class _CustomerTransactionViewState extends State<CustomerTransactionView> {
  List<String> btnList = ["All", "Today", "Week", "Month"];

  int btnIndex = 0;

  RxString selected = RxString("default");

  RxBool isPaid = RxBool(true);

  var trList = LocalData.transactionList;

  List<TransactionModel> lisOfTr = [];

  @override
  Widget build(BuildContext context) {
    final defaultView = Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(btnList.length, (index) {
                    return DrawerButtonView(
                        elevation: 0,
                        btnColor: btnIndex == index
                            ? styleSheet.COLOR.primaryColor
                            : styleSheet.COLOR.whiteColor,
                        txtColor: btnIndex == index
                            ? styleSheet.COLOR.whiteColor
                            : styleSheet.COLOR.blackColor,
                        btnName: btnList[index],
                        onPressed: () {
                          btnIndex = index;
                          setState(() {});
                        }).paddingOnly(bottom: 15);
                  })
                ],
              ),
            ),
            styleSheet.appConfig.addWidth(10),
            Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Obx(() {
                      return Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: styleSheet.DECORATION.RADIUS_5,
                          color: styleSheet.COLOR.bgLightBlueColor2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                isPaid.value = !isPaid.value;
                                setState(() {});
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  Text(
                                    "Paid",
                                    style: styleSheet.TEXT_THEME.fs12Bold
                                        .copyWith(
                                            color: isPaid.value
                                                ? styleSheet.COLOR.primaryColor
                                                : styleSheet.COLOR.blackColor),
                                  ),
                                  isPaid.value
                                      ? Container(
                                          height: 2,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: styleSheet
                                                  .DECORATION.RADIUS_10,
                                              color: styleSheet
                                                  .COLOR.primaryColor),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ),
                            styleSheet.appConfig.addWidth(30),
                            InkWell(
                              onTap: () {
                                isPaid.value = !isPaid.value;
                                setState(() {});
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  Text(
                                    "Not Paid",
                                    style: styleSheet.TEXT_THEME.fs12Bold
                                        .copyWith(
                                            color: isPaid.value
                                                ? styleSheet.COLOR.blackColor
                                                : styleSheet
                                                    .COLOR.primaryColor),
                                  ),
                                  isPaid.value
                                      ? const SizedBox()
                                      : Container(
                                          height: 2,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: styleSheet
                                                  .DECORATION.RADIUS_10,
                                              color: styleSheet
                                                  .COLOR.primaryColor),
                                        )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).paddingOnly(bottom: 10),
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, i) =>
                          styleSheet.appConfig.addHeight(10),
                      itemCount: trList.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          onTap: () {
                            selected("details");
                          },
                          minLeadingWidth: 20,
                          visualDensity: const VisualDensity(vertical: -4),
                          tileColor: styleSheet.COLOR.fieldGreyColor,
                          leading: const Icon(Icons.contact_page_sharp),
                          title: Text(
                            trList[i].trNumber,
                            style: styleSheet.TEXT_THEME.fs14Bold,
                          ),
                          subtitle: Text("31 Jul12:04 PM",
                              style: styleSheet.TEXT_THEME.fs12Bold),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "AED 0.00",
                                    style: styleSheet.TEXT_THEME.fs12Bold,
                                  ),
                                  Text(
                                    "Pending: AED 0.00",
                                    style: styleSheet.TEXT_THEME.fs12Bold,
                                  )
                                ],
                              ),
                              styleSheet.appConfig.addWidth(10),
                              if (!isPaid.value)
                                IconButton(
                                    onPressed: () {
                                      if (lisOfTr
                                          .any((e) => e.id == trList[i].id)) {
                                        lisOfTr.remove(trList[i]);
                                      } else {
                                        lisOfTr.add(trList[i]);
                                      }
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: lisOfTr
                                              .any((e) => e.id == trList[i].id)
                                          ? styleSheet.COLOR.greenColor
                                          : styleSheet.COLOR.blackColor,
                                    ))
                            ],
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    if (!isPaid.value)
                      PrimaryBtnView(
                          isExpanded: true,
                          btnName: "Pay Invoices",
                          onPressed: () {
                            selected("paymentView");
                          })
                  ],
                ))
          ],
        ).paddingSymmetric(horizontal: 15, vertical: 10),
        IconButton(
            onPressed: () {
              widget.onPressedBack();
            },
            icon: const Icon(Icons.arrow_back)),
      ],
    );

    return Obx(() {
      if (selected.value == "details") {
        return TransactionDetailsView(
          onPressedBack: setDefaultView,
          isComingFromTr: widget.isShowIssueRefund,
        );
      } else if (selected.value == "paymentView") {
        return InventoryPaymentView(onPressedBack: (val) {
          setDefaultView();
        });
      } else {
        return defaultView;
      }
    });
  }

  setDefaultView() => selected("default");
}
