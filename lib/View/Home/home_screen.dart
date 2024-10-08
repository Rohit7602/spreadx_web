// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Controller/users_controller.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/Dialog/apply_discount.dart';
import 'package:spreadx_web/Components/Dialog/assign_customer_dialog.dart';
import 'package:spreadx_web/Components/Dialog/barcode_dialog.dart';
import 'package:spreadx_web/Components/Dialog/custom_item_dialog.dart';
import 'package:spreadx_web/Components/Dialog/money_dialog.dart';
import 'package:spreadx_web/Components/Dialog/passcode_dialog.dart';
import 'package:spreadx_web/Components/Dialog/product_check.dart';
import 'package:spreadx_web/Components/Dialog/queue_remove_dialog.dart';
import 'package:spreadx_web/Components/Dialog/split_pay.dart';
import 'package:spreadx_web/Components/Dialog/update_item_quantity.dart';
import 'package:spreadx_web/Components/Dialog/update_product_price.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/custom_grid.dart';
import 'package:spreadx_web/Components/custom_row.dart';
import 'package:spreadx_web/Components/keyboard_component.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Home/Widget/product_check.dart';
import 'package:spreadx_web/View/Home/queue_list.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

import '../../Components/Dialog/item_details_dialog.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView>
    with WidgetsBindingObserver {
  final amountController = TextEditingController();
  final barcodeController = TextEditingController();
  final quantityController = TextEditingController();
  var userController = Get.find<UsersController>();

  var product = Get.find<ProductController>();

  var btnList = LocalData.buttonList;

  bool isProductCheck = false;
  bool isQueueList = false;
  bool isShowAssignedCustomer = false;
  dynamic isPaymentCash;
  int selectedValue = 0;

  CustomerModel? customer;

  double _keyboardHeight = 0.0;

  void showDetails(ProductModel product, int i) {
    showDialog(
        context: context,
        builder: (context) {
          return ItemDetailsDialog(productModel: product, i: i);
        });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _keyboardHeight = bottomInset;
    });
  }

  getSubTotal(List<ProductModel> data) {
    double amount = 0;
    for (var item in data) {
      amount +=
          (double.tryParse(item.price) ?? 0) * (double.parse(item.qty) ?? 0);
    }
    return amount;
  }

  getTotalDiscount(List<ProductModel> data) {
    double discount = 0;
    for (var item in data) {
      discount += double.tryParse(item.discount) ?? 0;
    }
    return discount;
  }

  getTotalVAT(List<ProductModel> data) {
    double tax = 0;
    for (var item in data) {
      final subtotal =
          (double.tryParse(item.price) ?? 0) * (double.parse(item.qty) ?? 0);
      tax += subtotal * ((double.tryParse(item.vat) ?? 0) / 100);
    }
    return tax;
  }

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 0,
        title: Image.asset(
          styleSheet.images.appLogoWhite,
          width: 200,
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (userController.securityPD != 0 && userController.askPD) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const PasscodeDialog();
                      });
                } else {
                  context.go(MyRoute.mainMenuDrawer);
                }
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
              height: MediaQuery.of(context).size.height +
                  _keyboardHeight -
                  (AppBar().preferredSize.height + 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        styleSheet.appConfig.addHeight(10),
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryTextFormField(
                                controller: barcodeController,
                                readonly: true,
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
                                  readonly: true,
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
                        Obx(
                          () => product.showQueueRibbon.value
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        styleSheet.DECORATION.RADIUS_5,
                                    color: styleSheet.COLOR.primaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "#SO4433001",
                                        style: styleSheet.TEXT_THEME.fs14Medium
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.whiteColor),
                                      ),
                                      Text(
                                        "Pending",
                                        style: styleSheet.TEXT_THEME.fs14Medium
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.whiteColor),
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        ),
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
                                            DataCell(
                                                onTap: () => showDetails(
                                                    data.productList[index],
                                                    index),
                                                Text("${(index + 1)}."
                                                    .toString())),
                                            DataCell(
                                                onTap: () => showDetails(
                                                    data.productList[index],
                                                    index),
                                                Text(data.productList[index]
                                                    .description)),
                                            DataCell(
                                                onTap: () => showDetails(
                                                    data.productList[index],
                                                    index),
                                                Text(
                                                    "${data.productList[index].price}.0")),
                                            DataCell(
                                                onTap: () => showDetails(
                                                    data.productList[index],
                                                    index),
                                                Text(
                                                    "${data.productList[index].qty}.0")),
                                            DataCell(
                                                onTap: () => showDetails(
                                                    data.productList[index],
                                                    index),
                                                Text(
                                                    "${data.productList[index].price.isNotEmpty ? double.parse(data.productList[index].price.toString()) * double.parse(data.productList[index].qty.toString()) : 0}")),
                                            DataCell(
                                              InkWell(
                                                onTap: () {
                                                  product.updateProductQTY(
                                                      data.productList[index]);
                                                  product.removeProduct(data
                                                      .productList[index].id);
                                                  product.setQueueRibon(false);
                                                  setState(() {});
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
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        isShowAssignedCustomer
                            ? Container(
                                padding: styleSheet.DECORATION.PADDING_10,
                                decoration: BoxDecoration(
                                  borderRadius: styleSheet.DECORATION.RADIUS_5,
                                  color: styleSheet.COLOR.ribbonColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: styleSheet
                                                  .COLOR.productCardGreyColor),
                                          child: Icon(
                                            Icons.person,
                                            color: styleSheet.COLOR.greyColor,
                                          ),
                                        ),
                                        styleSheet.appConfig.addWidth(10),
                                        Text(
                                          customer!.firstName,
                                          style: styleSheet.TEXT_THEME.fs12Bold,
                                        ),
                                        styleSheet.appConfig.addWidth(10),
                                        const Icon(Icons.mobile_friendly),
                                        styleSheet.appConfig.addWidth(10),
                                        Text(
                                          customer!.number,
                                          style: styleSheet.TEXT_THEME.fs12Bold,
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isShowAssignedCustomer = false;
                                          });
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        styleSheet.appConfig.addHeight(10),
                        GridView.builder(
                            shrinkWrap: true,
                            itemCount: btnList.length,
                            gridDelegate: CustomSliverGridDelegate(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: width <= 1140
                                    ? 3
                                    : width > 1140 && width <= 1480
                                        ? 4
                                        : 6,
                                itemHeight: 50),
                            itemBuilder: (context, i) => SecondaryButtonView(
                                  btnColor: styleSheet.COLOR.primarybuttonColor,
                                  btnName: btnList[i].title.toUpperCase(),
                                  onPressed: () =>
                                      getButtonRoute(btnList[i].title, context),
                                )),
                      ],
                    ),
                  )
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
                  GetBuilder<ProductController>(builder: (data) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() {
                          return CustomRow(
                              title: userController.setVatValue.value
                                  ? "Subtotal Exc. VAT"
                                  : "Sub Total",
                              trailing:
                                  getSubTotal(data.productList).toString());
                        }),
                        styleSheet.appConfig.addHeight(6),
                        CustomRow(
                            title: "Discount",
                            trailing:
                                getTotalDiscount(data.productList).toString()),
                        styleSheet.appConfig.addHeight(6),
                        Obx(() {
                          return CustomRow(
                              title: userController.setVatValue.value
                                  ? "Total Taxable"
                                  : "Net Total",
                              trailing: (getSubTotal(data.productList) -
                                      getTotalDiscount(data.productList))
                                  .toString());
                        }),
                        styleSheet.appConfig.addHeight(6),
                        Obx(() {
                          return userController.setVatValue.value
                              ? CustomRow(
                                  title: "VAT",
                                  trailing:
                                      getTotalVAT(data.productList).toString())
                              : const SizedBox();
                        }),
                        styleSheet.appConfig.addHeight(6),
                        GetBuilder<ProductController>(
                          builder: (data) {
                            int qty = 0;
                            for (var element in data.productList) {
                              qty += int.parse(element.qty.toString());
                            }
                            return CustomRow(
                                txtColor: styleSheet.COLOR.primaryColor,
                                title: "Grand Total",
                                trailing:
                                    "AED ${getSubTotal(data.productList) - getTotalDiscount(data.productList) + (userController.setVatValue.value ? getTotalVAT(data.productList) : 0)}");
                          },
                        ),
                      ],
                    );
                  }),
                  styleSheet.appConfig.addHeight(6),
                  GetBuilder<ProductController>(
                    builder: (data) {
                      double price = getSubTotal(data.productList) -
                          getTotalDiscount(data.productList) +
                          (userController.setVatValue.value
                              ? getTotalVAT(data.productList)
                              : 0);

                      var newPrice = amountController.text.isNotEmpty
                          ? (double.parse(amountController.text) - price)
                          : price == 0
                              ? price
                              : -price;
                      return CustomRow(
                          txtColor: newPrice.isNegative
                              ? styleSheet.COLOR.redColor
                              : styleSheet.COLOR.greenColor,
                          title: "Balance",
                          trailing: "AED $newPrice");
                    },
                  ),

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
                  GetBuilder<ProductController>(builder: (data) {
                    return Row(
                      children: [
                        OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    isPaymentCash != null && isPaymentCash
                                        ? styleSheet.COLOR.primaryColor
                                        : null)),
                            onPressed: () {
                              isPaymentCash = true;
                              amountController.text =
                                  "${getSubTotal(data.productList) - getTotalDiscount(data.productList) + getTotalVAT(data.productList)}";
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
                              amountController.text =
                                  "${getSubTotal(data.productList) - getTotalDiscount(data.productList) + getTotalVAT(data.productList)}";
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
                    );
                  }),
                  styleSheet.appConfig.addHeight(8),
                  Row(
                    children: [
                      Expanded(
                          child: OutlineButtonView(
                        btnColor: styleSheet.COLOR.whiteColor,
                        txtColor: styleSheet.COLOR.blackColor,
                        btnName: "Split Pay",
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => SplitPayDialog(
                              amount: amountController.text.isEmpty
                                  ? "0"
                                  : amountController.text,
                              method: isPaymentCash != null
                                  ? isPaymentCash
                                      ? "CASH"
                                      : 'CARD'
                                  : "CASH"),
                        ),
                      ))
                    ],
                  ),
                  styleSheet.appConfig.addHeight(8),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButtonView(
                          btnName: "Checkout".toUpperCase(),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) {
                              return CustomHeaderDialog(
                                title: "Open New Drawer",
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "OPENING AMOUNT",
                                        style: styleSheet.TEXT_THEME.fs12Bold
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.blackColor
                                                    .withOpacity(0.7)),
                                      ),
                                      SecondaryTextFormField(
                                        onTap: () => openVirtualKeyboard(),
                                        fillColor: true,
                                        allowNumbers: true,
                                        hinttext: "0.0",
                                      ),
                                      styleSheet.appConfig.addHeight(20),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: PrimaryBtnView(
                                                btnName: "Open New Drawer",
                                                onPressed: () {}),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(10),

                  // Widget to show Keypad Buttons

                  KeyboardComponentView(
                    onInput: (value) {
                      setState(() => amountController.text += value);
                    },
                    onValueRemove: () {
                      if (amountController.text.isNotEmpty) {
                        amountController.text = amountController.text
                            .substring(0, amountController.text.length - 1);
                      }
                      setState(() {});
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

  getButtonRoute(String route, context) async {
    switch (route.toLowerCase()) {
      case "discount":
        return showDialog(
            context: context,
            builder: (context) => const ApplyDiscountDialog());
      case "assign customer":
        return await showDialog(
            context: context,
            builder: (context) => const AssignCustomerDialog()).then((val) {
          if (val != null) {
            isShowAssignedCustomer = true;
            customer = val;
            setState(() {});
          }
        });
      case "custom item":
        return showDialog(
            context: context, builder: (context) => CustomItemDialog());
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
      case "add to queue":
        return addItemsInQueue();

      default:
        return null;
    }
  }

  addItemsInQueue() {
    if (product.productList.isNotEmpty) {
      product.updateQueueList(product.productList);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const EmptyQueueDialog();
        },
      );
    }
  }
}
