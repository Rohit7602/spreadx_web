// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class TransactionsInvoiceView extends StatefulWidget {
  const TransactionsInvoiceView({super.key});

  @override
  State<TransactionsInvoiceView> createState() =>
      _TransactionsInvoiceViewState();
}

class _TransactionsInvoiceViewState extends State<TransactionsInvoiceView> {
  List<String> filterList = ["All", "Today", "This Week", "This Month"];

  String filterValue = "All";

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Scaffold(
      appBar: CustomAppbarView(title: "Transaction"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: styleSheet.TEXT_THEME.fs20Bold
                      .copyWith(color: styleSheet.COLOR.blackColor),
                  text: "History ",
                  children: [
                    TextSpan(
                        style: styleSheet.TEXT_THEME.fs20Medium
                            .copyWith(color: styleSheet.COLOR.greyColor),
                        text: "(100)")
                  ],
                ),
              ),
              Row(
                children: [
                  PrimaryDropDown(
                      dropdownValue: filterValue,
                      items: filterList,
                      value: (val) {
                        filterValue = val!;
                        setState(() {});
                        return null;
                      }),
                  styleSheet.appConfig.addWidth(20),
                  SizedBox(
                    width: styleSheet.appConfig.getScreenWidth(context) * 0.25,
                    child: PrimaryTextFormField(
                      hinttext: "Search in menu",
                    ),
                  ),
                  styleSheet.appConfig.addWidth(15),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: styleSheet.COLOR.blackColor,
                        borderRadius: styleSheet.DECORATION.RADIUS_10),
                    child: Icon(
                      Icons.filter_list,
                      color: styleSheet.COLOR.whiteColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          styleSheet.appConfig.addHeight(30),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, i) =>
                styleSheet.appConfig.addHeight(17),
            itemCount: 4,
            itemBuilder: (context, i) {
              return Container(
                padding: styleSheet.DECORATION.PADDING_10,
                decoration: BoxDecoration(
                  boxShadow: styleSheet.DECORATION.secondaryShadow,
                  color: styleSheet.COLOR.whiteColor,
                  borderRadius: styleSheet.DECORATION.RADIUS_10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: styleSheet.COLOR.whiteColor,
                              image: DecorationImage(
                                  image: AssetImage(
                                      styleSheet.icons.receiptIcon))),
                        ),
                        styleSheet.appConfig.addWidth(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "#INR58374",
                              style: view.textFontBold_Medium,
                            ),
                            styleSheet.appConfig.addHeight(3),
                            Text(
                              "25 Jun 2024 06:08 PM",
                              style: view.textFontNormal,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "AED 15.11",
                          style: view.textFontNormal,
                        ),
                        RichText(
                          text: TextSpan(
                            style: styleSheet.TEXT_THEME.fs14Medium
                                .copyWith(color: styleSheet.COLOR.greyColor),
                            text: "(Pending) ",
                            children: [
                              TextSpan(
                                  style: view.textFontBold_Medium.copyWith(
                                      color: styleSheet.COLOR.blackColor),
                                  text: "AED 0.00")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ).paddingSymmetric(horizontal: 40, vertical: 10),
    );
  }
}
