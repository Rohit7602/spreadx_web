// ignore_for_file: must_be_immutable

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/apply_discount.dart';
import 'package:spreadx_web/Components/Dialog/assign_customer_dialog.dart';
import 'package:spreadx_web/Components/Dialog/custom_item_dialog.dart';
import 'package:spreadx_web/Components/Dialog/product_check.dart';
import 'package:spreadx_web/Components/Dialog/update_item_quantity.dart';
import 'package:spreadx_web/Components/Dialog/update_product_price.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Dashboard/Widget/product_check.dart';
import 'package:spreadx_web/main.dart';

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  var btnList = LocalData.buttonList;

  bool isProductCheck = false;

  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Image.asset(
          styleSheet.images.appLogoWhite,
          width: 200,
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.go(MyRoute.mainMenuDrawer);
              },
              icon: const Icon(
                Icons.settings,
              ))
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget to show Drawer Section
          // MenuDrawerView(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      styleSheet.appConfig.addHeight(10),
                      Row(
                        children: [
                          const Expanded(
                            child: PrimaryTextFormField(
                              hinttext: "Barcode",
                            ),
                          ),
                          styleSheet.appConfig.addWidth(10),
                          const Expanded(
                            child: PrimaryTextFormField(
                              hinttext: "Qty",
                            ),
                          ),
                          styleSheet.appConfig.addWidth(10),
                          SecondaryButtonView(
                            btnName: "Add",
                            onPressed: () {},
                          )
                        ],
                      ),
                      styleSheet.appConfig.addHeight(10),
                      SizedBox(
                        height:
                            styleSheet.appConfig.getScreenHeight(context) * 0.3,
                        child: DataTable2(
                          dataRowHeight: 40,
                          headingRowHeight: 30,
                          columnSpacing: 5,
                          horizontalMargin: 12,
                          columns: [
                            DataColumn2(
                              fixedWidth: view.tableSmallWidth,
                              label: const Text('No.'),
                              size: ColumnSize.L,
                            ),
                            const DataColumn2(
                              label: Text('Description'),
                            ),
                            DataColumn2(
                              fixedWidth: view.tableSmallWidth,
                              label: const Text('Price'),
                            ),
                            DataColumn2(
                              fixedWidth: view.tableSmallWidth,
                              label: const Text('Qty'),
                            ),
                            DataColumn2(
                              fixedWidth: view.tableSmallWidth,
                              label: const Text('Amount'),
                              numeric: true,
                            ),
                            DataColumn2(
                              fixedWidth: view.tableSmallWidth,
                              label: const Text(''),
                              numeric: true,
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            3,
                            (index) => DataRow(
                              cells: [
                                DataCell(Text("${(index + 1)}.".toString())),
                                const DataCell(Text("Sales About My Product")),
                                const DataCell(Text("\u{20B9} 150")),
                                const DataCell(Text('10')),
                                const DataCell(Text("\u{20B9} 150")),
                                DataCell(
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: styleSheet.COLOR.redColor,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: styleSheet.COLOR.whiteColor,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      ...List.generate(btnList.length, (i) {
                        return SecondaryButtonView(
                          btnColor: styleSheet.COLOR.primarybuttonColor,
                          btnName: btnList[i].title.toUpperCase(),
                          onPressed: () =>
                              getButtonRoute(btnList[i].title, context),
                        );
                      })
                    ],
                  ).paddingAll(20),
                ],
              ),
            ),
          ),

          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: view.dashboardSummaryCardWidth,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: styleSheet.COLOR.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRow(title: "Sub Total", trailing: "0.00"),
                  styleSheet.appConfig.addHeight(6),
                  CustomRow(title: "Discount", trailing: "0.00"),
                  styleSheet.appConfig.addHeight(6),
                  CustomRow(title: "Total Tax", trailing: "0.00"),
                  styleSheet.appConfig.addHeight(6),
                  CustomRow(
                      txtColor: styleSheet.COLOR.primaryColor,
                      title: "Grand Total",
                      trailing: "\u{20B9} 120"),
                  styleSheet.appConfig.addHeight(6),
                  CustomRow(
                      txtColor: styleSheet.COLOR.greenColor,
                      title: "Balance",
                      trailing: "\u{20B9} 120"),
                  styleSheet.appConfig.addHeight(10),
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hintStyle: styleSheet.TEXT_THEME.fs18Bold
                            .copyWith(color: styleSheet.COLOR.greyColor),
                        border: InputBorder.none,
                        hintText: "AED 0.00",
                        suffixIcon: Image.asset(
                          styleSheet.icons.moneyIcon,
                          width: 40,
                        )),
                  ),
                  styleSheet.appConfig.addHeight(8),
                  Row(
                    children: [
                      OutlinedButton(
                          onPressed: () {}, child: const Text("Cash")),
                      styleSheet.appConfig.addWidth(10),
                      OutlinedButton(
                          onPressed: () {}, child: const Text("Card")),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlineButtonView(
                            btnColor: styleSheet.COLOR.whiteColor,
                            txtColor: styleSheet.COLOR.blackColor,
                            btnName: "Split & Pay",
                            onPressed: () {}),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(8),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButtonView(
                            btnName: "Checkout".toUpperCase(),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(10),
                  GridView.builder(
                    itemCount: LocalData.keyboardBtnList.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: view.keyboardBtnSize),
                    itemBuilder: (context, i) {
                      var btn = LocalData.keyboardBtnList[i];
                      return KeyboardButtonView(
                          btnName: btn.btnName, onPressed: () {});
                    },
                  ),
                ],
              ),
            ),
          ),

          isProductCheck ? const ProductCheckView() : const SizedBox()
        ],
      ),
    );
  }

  getButtonRoute(String route, context) {
    switch (route.toLowerCase()) {
      case "discount":
        return showDialog(
            context: context,
            builder: (context) => const ApplyDiscountDialog());
      case "assign customer":
        return showDialog(
            context: context,
            builder: (context) => const AssignCustomerDialog());
      case "custom item":
        return showDialog(
            context: context, builder: (context) => const CustomItemDialog());
      case "product check":
        return showDialog(
            context: context, builder: (context) => const ProductCheckDialog());
      case "update qty":
        return showDialog(
            context: context,
            builder: (context) => const UpdateItemQuantityDialog());
      case "update price":
        return showDialog(
            context: context,
            builder: (context) => const UpdateProductPriceDialog());
      case "products":
        return setState(() {
          isProductCheck = !isProductCheck;
        });

      default:
        return null;
    }
  }
}
