// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Transactions/Transaction_details/transaction_details_view.dart';
import 'package:spreadx_web/main.dart';

class TransactionView extends StatefulWidget {
  void Function() onPressedBack;
  bool isComingFromtr;
  TransactionView(
      {required this.onPressedBack, this.isComingFromtr = true, super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  List<String> btnList = ["All", "Today", "Week", "Month"];

  int btnIndex = 0;

  RxString selected = RxString("default");

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
                child: ListView.separated(
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
                      trailing: Column(
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
                    );
                  },
                ))
          ],
        ).paddingSymmetric(horizontal: 15, vertical: 10),
        if (!widget.isComingFromtr)
          IconButton(
              onPressed: () {
                widget.onPressedBack();
              },
              icon: const Icon(Icons.arrow_back)),
      ],
    );

    return Obx(() {
      if (selected.value == "default") {
        return defaultView;
      } else {
        return TransactionDetailsView(
            isComingFromTr: widget.isComingFromtr,
            onPressedBack: () {
              selected("default");
            });
      }
    });
  }
}
