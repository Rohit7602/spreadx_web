import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Product/edit_product_details_view.dart';
import 'package:spreadx_web/main.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductModel product;
  final void Function()? onPressedBack;
  const ProductDetailsView(
      {super.key, required this.product, required this.onPressedBack});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  var productController = Get.find<ProductController>();

  final RxString selectedTransactionTab = RxString("All");

  final RxBool expandEditButton = RxBool(false);

  final RxString selected = "default".obs;

  final List<String> transactionType = [
    "Sales",
    "Return",
    "Sales",
    "Purchase",
    "Sales",
    "Return",
    "Purchase",
    "Sales",
    "Purchase",
    "Return",
    "Sales",
    "Return",
    "Purchase"
  ];

  bool showHistory = false;

  @override
  Widget build(BuildContext context) {
    final defaultValue = Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: styleSheet.appConfig.getScreenWidth(context),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: widget.onPressedBack,
                    icon: const Icon(Icons.arrow_back_outlined)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.product.description,
                                  style: styleSheet.TEXT_THEME.fs20Bold),
                              styleSheet.appConfig.addHeight(5),
                              Text(widget.product.description,
                                  style: styleSheet.TEXT_THEME.fs14Medium
                                      .copyWith(
                                          color: styleSheet.COLOR.greyColor)),
                              styleSheet.appConfig.addHeight(10),
                              Container(
                                padding: styleSheet.DECORATION.PADDING_10,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        styleSheet.DECORATION.RADIUS_10,
                                    color: styleSheet
                                        .COLOR.discountCardGrenColor
                                        .withOpacity(0.5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(showHistory ? "Purchases" : "Sales",
                                        style: styleSheet.TEXT_THEME.fs16Bold
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.greyColor)),
                                    styleSheet.appConfig.addHeight(5),
                                    Row(
                                      children: [
                                        Text("AED",
                                            style:
                                                styleSheet.TEXT_THEME.fs12Bold),
                                        styleSheet.appConfig.addWidth(15),
                                        Text("0.00",
                                            style: styleSheet
                                                .TEXT_THEME.fs14Bold
                                                .copyWith(
                                                    color: styleSheet
                                                        .COLOR.greenColor)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              styleSheet.appConfig.addHeight(5),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    padding: styleSheet.DECORATION.PADDING_10,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            styleSheet.DECORATION.RADIUS_10,
                                        color: styleSheet.COLOR.redColor
                                            .withOpacity(0.1)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Returns",
                                            style: styleSheet
                                                .TEXT_THEME.fs16Bold
                                                .copyWith(
                                                    color: styleSheet
                                                        .COLOR.greyColor)),
                                        styleSheet.appConfig.addHeight(5),
                                        Row(
                                          children: [
                                            Text("AED",
                                                style: styleSheet
                                                    .TEXT_THEME.fs12Bold
                                                    .copyWith(
                                                        color: styleSheet
                                                            .COLOR.greyColor)),
                                            styleSheet.appConfig.addWidth(15),
                                            Text("0.00",
                                                style: styleSheet
                                                    .TEXT_THEME.fs14Bold),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                                  styleSheet.appConfig.addWidth(5),
                                  Expanded(
                                      child: Container(
                                    padding: styleSheet.DECORATION.PADDING_10,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            styleSheet.DECORATION.RADIUS_10,
                                        color: styleSheet.COLOR.blueColor
                                            .withOpacity(0.1)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            showHistory
                                                ? "Purchase Quantity"
                                                : "Sold Quantity",
                                            style: styleSheet
                                                .TEXT_THEME.fs16Bold
                                                .copyWith(
                                                    color: styleSheet
                                                        .COLOR.greyColor)),
                                        styleSheet.appConfig.addHeight(5),
                                        Text("0.00",
                                            style: styleSheet
                                                .TEXT_THEME.fs12Bold
                                                .copyWith(
                                                    color: styleSheet
                                                        .COLOR.primaryColor))
                                      ],
                                    ),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),

                        // *********************************** Expansion Floating Button ***********************************
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 20, right: 5),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: styleSheet.COLOR.whiteColor,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    color: styleSheet.COLOR.greyColor
                                        .withOpacity(0.5),
                                    offset: const Offset(1, 0))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: styleSheet
                                          .COLOR.productCardGreyColor),
                                  child: Text(
                                    "64 x 36",
                                    style: styleSheet.TEXT_THEME.fs10Medium
                                        .copyWith(
                                            color: styleSheet.COLOR.greyColor),
                                  ),
                                ),
                                styleSheet.appConfig.addHeight(5),
                                Obx(() => expandEditButton.value
                                    ? Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: styleSheet
                                                    .COLOR.greenColor
                                                    .withOpacity(0.2)),
                                            child: IconButton.filled(
                                                color: styleSheet
                                                    .COLOR.darkGreenColor,
                                                onPressed: () {
                                                  expandEditButton(false);
                                                  selected("edit");
                                                },
                                                padding:
                                                    const EdgeInsets.all(10),
                                                icon: const Icon(
                                                    Icons.edit_outlined)),
                                          ),
                                          styleSheet.appConfig.addHeight(5),
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: styleSheet.COLOR.orange
                                                    .withOpacity(0.2)),
                                            child: IconButton.filled(
                                                color: styleSheet.COLOR.orange,
                                                onPressed: () {
                                                  expandEditButton(false);
                                                  // selected("transactions");
                                                  setState(() {
                                                    showHistory = !showHistory;
                                                  });
                                                },
                                                padding:
                                                    const EdgeInsets.all(10),
                                                icon:
                                                    const Icon(Icons.restore)),
                                          ),
                                          styleSheet.appConfig.addHeight(5),
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: styleSheet.COLOR.redColor
                                                    .withOpacity(0.2)),
                                            child: IconButton.filled(
                                                color:
                                                    styleSheet.COLOR.redColor,
                                                onPressed: () {
                                                  expandEditButton(false);

                                                  productController
                                                      .removeProduct(
                                                          widget.product.id);
                                                  widget.onPressedBack!();
                                                },
                                                padding:
                                                    const EdgeInsets.all(10),
                                                icon: const Icon(Icons.delete)),
                                          ),
                                        ],
                                      )
                                    : InkWell(
                                        onTap: () {
                                          expandEditButton(true);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              const Icon(Icons.add, size: 25),
                                        ),
                                      ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    styleSheet.appConfig.addHeight(20),
                    Text("Transactions",
                        style: styleSheet.TEXT_THEME.fs20Bold
                            .copyWith(color: styleSheet.COLOR.greyColor)),
                    styleSheet.appConfig.addHeight(20),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: styleSheet.COLOR.whiteColor,
                            borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    LocalData.productDetailsTransactionsTabList
                                        .length, (i) {
                                  final tab = LocalData
                                      .productDetailsTransactionsTabList[i];
                                  return InkWell(onTap: () {
                                    selectedTransactionTab(tab);
                                  }, child: Obx(() {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        decoration: BoxDecoration(
                                            border:
                                                selectedTransactionTab.value ==
                                                        tab
                                                    ? Border(
                                                        bottom: BorderSide(
                                                            width: 2,
                                                            color: styleSheet
                                                                .COLOR
                                                                .primaryColor))
                                                    : null),
                                        child: Text(tab,
                                            style: styleSheet
                                                .TEXT_THEME.fs12Bold
                                                .copyWith(
                                                    color:
                                                        selectedTransactionTab
                                                                    .value ==
                                                                tab
                                                            ? styleSheet.COLOR
                                                                .primaryColor
                                                            : null)),
                                      ),
                                    );
                                  }));
                                }),
                              ),
                            ),

                            // ************************ Transactions List ************************
                            Expanded(
                              child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  separatorBuilder: (context, i) =>
                                      styleSheet.appConfig.addHeight(10),
                                  itemCount: transactionType.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      color: styleSheet.COLOR.lightGreyColor,
                                      child: ListTile(
                                        leading: Image.asset(
                                            styleSheet.icons.saleIcon,
                                            color: styleSheet.COLOR.greyColor,
                                            width: 24),
                                        title: Text(
                                            showHistory ? "Purchases" : "Sales",
                                            style:
                                                styleSheet.TEXT_THEME.fs14Bold),
                                        subtitle: Text(
                                            showHistory
                                                ? "PIN4290003"
                                                : "IN4290003",
                                            style: styleSheet
                                                .TEXT_THEME.fs12Bold
                                                .copyWith(
                                                    color: styleSheet
                                                        .COLOR.greyColor)),
                                        trailing: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text("+1.00",
                                                style: styleSheet
                                                    .TEXT_THEME.fs14Bold
                                                    .copyWith(
                                                        color: styleSheet
                                                            .COLOR.greenColor)),
                                            Text(
                                                DateFormat(
                                                        "yyyy-MM-dd hh:mm:ss")
                                                    .format(DateTime.now()),
                                                style: styleSheet
                                                    .TEXT_THEME.fs12Bold),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );

    return Obx(() {
      if (selected.value == "default") {
        return defaultValue;
      } else {
        return EditProductDetailsView(
            product: widget.product,
            onPressedBack: () {
              selected("default");
            });
      }
    });
  }

  setDefaultView() => selected("default");
}
