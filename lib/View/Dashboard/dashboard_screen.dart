// ignore_for_file: must_be_immutable

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/apply_discount.dart';
import 'package:spreadx_web/Components/Dialog/assign_customer_dialog.dart';
import 'package:spreadx_web/Components/Dialog/barcode_dialog.dart';
import 'package:spreadx_web/Components/Dialog/custom_item_dialog.dart';
import 'package:spreadx_web/Components/Dialog/money_dialog.dart';
import 'package:spreadx_web/Components/Dialog/product_check.dart';
import 'package:spreadx_web/Components/Dialog/update_item_quantity.dart';
import 'package:spreadx_web/Components/Dialog/update_product_price.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Components/keyboard_component.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Dashboard/Widget/product_check.dart';
import 'package:spreadx_web/View/Dashboard/queue_list.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

import '../../Components/Dialog/item_details_dialog.dart';

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  final amountController = TextEditingController();
  final barcodeController = TextEditingController();
  final quantityController = TextEditingController();

  var product = Get.find<ProductController>();

  var btnList = LocalData.buttonList;

  bool isProductCheck = false;
  bool isQueueList = false;
  dynamic isPaymentCash;
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
                          Expanded(
                            child: PrimaryTextFormField(
                              controller: barcodeController,
                              onTap: () async {
                                await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BarcodeDialog(
                                        hintText: "Enter Barcode",
                                      );
                                    }).then((val) {
                                  barcodeController.text = val;
                                  setState(() {});
                                });
                              },
                              hinttext: "Barcode",
                            ),
                          ),
                          styleSheet.appConfig.addWidth(10),
                          Expanded(
                            child: PrimaryTextFormField(
                                controller: quantityController,
                                hinttext: "Qty",
                                onTap: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return BarcodeDialog(
                                          hintText: "Enter QTY",
                                        );
                                      }).then((val) {
                                    quantityController.text = val;
                                    setState(() {});
                                  });
                                }),
                          ),
                          styleSheet.appConfig.addWidth(10),
                          SecondaryButtonView(
                            btnName: "Add",
                            onPressed: () {},
                          )
                        ],
                      ),
                      styleSheet.appConfig.addHeight(10),
                      styleSheet.appConfig.addHeight(10),
                      GetBuilder(
                        init: ProductController(),
                        builder: (data) {
                          return data.productList.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    styleSheet.appConfig.addHeight(30),
                                    Image.asset(styleSheet.images.empty_cart),
                                    Text(
                                      "Cart is empty. Add items to show",
                                      style: styleSheet.TEXT_THEME.fs14Medium
                                          .copyWith(
                                              color:
                                                  styleSheet.COLOR.greyColor),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: styleSheet.appConfig
                                          .getScreenHeight(context) *
                                      0.4,
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ItemDetailsDialog(
                                              itemCount: 1,
                                            );
                                          });
                                    },
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
                                        data.productList.length,
                                        (index) => DataRow(
                                          cells: [
                                            DataCell(Text(
                                                "${(index + 1)}.".toString())),
                                            DataCell(Text(data
                                                .productList[index]
                                                .description)),
                                            DataCell(Text(
                                                "${data.productList[index].price}.0")),
                                            DataCell(Text(
                                                "${data.productList[index].qty}.0")),
                                            DataCell(Text(
                                                "${double.parse(data.productList[index].qty.toString()) * double.parse(data.productList[index].qty.toString())}.0")),
                                            DataCell(
                                              InkWell(
                                                onTap: () {
                                                  product.removeProduct();
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: styleSheet
                                                        .COLOR.redColor,
                                                  ),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: styleSheet
                                                        .COLOR.whiteColor,
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
                                );
                        },
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
                      trailing: "AED 120"),
                  styleSheet.appConfig.addHeight(6),
                  CustomRow(
                      txtColor: styleSheet.COLOR.redColor,
                      title: "Balance",
                      trailing: "AED 120"),
                  styleSheet.appConfig.addHeight(10),

                  PlainTextField(
                    hinttext: "AED 0.00",
                    controller: amountController,
                    suffixicon: GestureDetector(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return MoneyDialog();
                            }).then((val) {
                          amountController.text = val;
                          setState(() {});
                        });
                      },
                      child: Image.asset(
                        styleSheet.icons.moneyIcon,
                        width: 40,
                      ),
                    ),
                  ),

                  styleSheet.appConfig.addHeight(8),

                  // Widget to show payment Methods Toggle
                  Row(
                    children: [
                      OutlinedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  isPaymentCash != null && isPaymentCash
                                      ? styleSheet.COLOR.primaryColor
                                      : null)),
                          onPressed: () {
                            isPaymentCash = true;
                            setState(() {});
                          },
                          child: Text(
                            "Cash",
                            style: styleSheet.TEXT_THEME.fs12Normal.copyWith(
                                color: isPaymentCash != null && isPaymentCash
                                    ? styleSheet.COLOR.whiteColor
                                    : styleSheet.COLOR.primaryColor),
                          )),
                      styleSheet.appConfig.addWidth(10),
                      OutlinedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  isPaymentCash != null && !isPaymentCash
                                      ? styleSheet.COLOR.primaryColor
                                      : null)),
                          onPressed: () {
                            isPaymentCash = false;
                            setState(() {});
                          },
                          child: Text(
                            "Card",
                            style: styleSheet.TEXT_THEME.fs12Normal.copyWith(
                                color: isPaymentCash != null && !isPaymentCash
                                    ? styleSheet.COLOR.whiteColor
                                    : styleSheet.COLOR.primaryColor),
                          )),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlineButtonView(
                            btnColor: styleSheet.COLOR.whiteColor,
                            txtColor: styleSheet.COLOR.blackColor,
                            btnName: "Split Pay",
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
                            onPressed: () {
                              openVirtualKeyboard();
                            }),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(10),

                  // Widget to show Keypad Buttons

                  KeyboardComponentView(
                    controller: (val) {
                      amountController.text = val;
                    },
                  ),
                ],
              ),
            ),
          ),
          // Widget to show Product List
          isProductCheck
              ? ProductCheckView(
                  backBtn: (val) {
                    isProductCheck = false;
                    setState(() {});
                  },
                )
              : const SizedBox(),

          // Widget to show Queue List
          isQueueList
              ? QueueListView(
                  backBtn: (val) {
                    isQueueList = false;
                    setState(() {});
                  },
                )
              : const SizedBox()
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
          isQueueList = false;
          isProductCheck = !isProductCheck;
        });
      case "queue list":
        return setState(() {
          isProductCheck = false;
          isQueueList = !isQueueList;
        });

      default:
        return null;
    }
  }
}
