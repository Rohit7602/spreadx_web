// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/add_customer_controller.dart';
import 'package:spreadx_web/View/Customer/add_new_customer.dart';
import 'package:spreadx_web/main.dart';

class CustomerListView extends StatefulWidget {
  const CustomerListView({super.key});

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<CustomerListView> {
  bool showAddCustomerForm = false;

  var controller = Get.find<AddCustomerController>();

  @override
  Widget build(BuildContext context) {
    final defaultView = Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          height: styleSheet.appConfig.getScreenHeight(context),
          width: styleSheet.appConfig.getScreenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Customer List",
                  style: styleSheet.TEXT_THEME.fs14Bold
                      .copyWith(color: styleSheet.COLOR.primaryColor)),
              styleSheet.appConfig.addHeight(10),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  ...List.generate(controller.customer.length, (i) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: styleSheet.DECORATION.RADIUS_10,
                      ),
                      child: Container(
                        padding: styleSheet.DECORATION.PADDING_10,
                        width: 300,
                        decoration: BoxDecoration(
                          color: styleSheet.COLOR.cardColor,
                          borderRadius: styleSheet.DECORATION.RADIUS_10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: styleSheet.COLOR.productCardGreyColor,
                              ),
                              child: Text(
                                "6 X 6",
                                style: styleSheet.TEXT_THEME.fs12Medium
                                    .copyWith(
                                        color: styleSheet.COLOR.greyColor),
                              ),
                            ),
                            styleSheet.appConfig.addWidth(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.customer[i].firstName,
                                  style: styleSheet.TEXT_THEME.fs12Bold,
                                ),
                                styleSheet.appConfig.addHeight(6),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: styleSheet.COLOR.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        "unknown",
                                        style: styleSheet.TEXT_THEME.fs10Medium
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.whiteColor),
                                      ),
                                    ),
                                    styleSheet.appConfig.addWidth(5),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: styleSheet.COLOR.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        "cash",
                                        style: styleSheet.TEXT_THEME.fs10Medium
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.whiteColor),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              )
            ],
          ).paddingAll(20),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() => showAddCustomerForm = true);
          },
          child: Container(
            height: 50,
            width: 50,
            margin: styleSheet.DECORATION.PADDING_20,
            decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_10,
                color: styleSheet.COLOR.primaryColor),
            child: Icon(
              Icons.add,
              color: styleSheet.COLOR.whiteColor,
            ),
          ),
        )
      ],
    );

    return showAddCustomerForm
        ? AddNewCustomerView(
            onPressedBack: () => setState(() => showAddCustomerForm = false),
          )
        : defaultView;
  }
}
