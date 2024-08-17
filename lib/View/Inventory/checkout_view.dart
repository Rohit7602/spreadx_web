import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/apply_discount.dart';
import 'package:spreadx_web/Components/Dialog/assign_supplier_dialog.dart';
import 'package:spreadx_web/Components/Dialog/item_details_dialog.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/Inventory/invent_payment_view.dart';
import 'package:spreadx_web/View/Inventory/invt_discount.dart';
import 'package:spreadx_web/main.dart';

class CheckoutView extends StatefulWidget {
  final void Function()? onPressedBack;
  bool showISSupplier;
  CheckoutView(
      {required this.onPressedBack, this.showISSupplier = false, super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var product = Get.find<ProductController>();

  int itemCount = 1;
  String addSupplier = "";
  bool isDiscountAdded = false;

  Rx<InventoryInvoiceState> selectedView =
      Rx<InventoryInvoiceState>(InventoryInvoiceState.Default);

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    var defaultView = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    widget.onPressedBack!();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            styleSheet.appConfig.addHeight(20),
            if (widget.showISSupplier)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButtonView(
                      btnName: "Add Supplier",
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return const AssignSupplierDialog();
                            }).then((val) {
                          if (val != null) {
                            setState(() {
                              addSupplier = val;
                            });
                          }
                        });
                      }),
                ],
              ),
            styleSheet.appConfig.addHeight(10),
            addSupplier.isNotEmpty
                ? Container(
                    width: styleSheet.appConfig.getScreenWidth(context),
                    padding: styleSheet.DECORATION.PADDING_10,
                    decoration: BoxDecoration(
                        color: styleSheet.COLOR.primaryColor,
                        borderRadius: styleSheet.DECORATION.RADIUS_5),
                    child: Text(
                      addSupplier,
                      style: styleSheet.TEXT_THEME.fs12Medium
                          .copyWith(color: styleSheet.COLOR.whiteColor),
                    ),
                  )
                : const SizedBox(),
            product.productList.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, i) =>
                        styleSheet.appConfig.addHeight(10),
                    itemCount: product.productList.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return ItemDetailsDialog(
                                  productModel: product.productList[i],
                                );
                              }).then((val) {
                            setState(() {});
                          });
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width:
                                  styleSheet.appConfig.getScreenWidth(context),
                              margin: const EdgeInsets.only(top: 15),
                              padding: styleSheet.DECORATION.PADDING_10
                                  .copyWith(bottom: 10, top: 10),
                              decoration: BoxDecoration(
                                borderRadius: styleSheet.DECORATION.RADIUS_5,
                                color: styleSheet.COLOR.bgLightBlueColor2,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 45,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: styleSheet
                                                .COLOR.productCardGreyColor),
                                        child: Text(
                                          "60 x 10",
                                          style:
                                              styleSheet.TEXT_THEME.fs12Medium,
                                        ),
                                      ),
                                      styleSheet.appConfig.addWidth(10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.productList[i].description,
                                            style:
                                                styleSheet.TEXT_THEME.fs14Bold,
                                          ),
                                          styleSheet.appConfig.addHeight(5),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            color: styleSheet.COLOR.whiteColor,
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () =>
                                                      incrementCounter(i),
                                                  child: Container(
                                                    padding: styleSheet
                                                        .DECORATION.PADDING_2,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: styleSheet.COLOR
                                                            .primaryColor),
                                                    child: Icon(Icons.remove,
                                                        color: styleSheet
                                                            .COLOR.whiteColor,
                                                        size: 10),
                                                  ),
                                                ),
                                                Text(product.productList[i].qty
                                                        .toString())
                                                    .paddingSymmetric(
                                                        horizontal: 10),
                                                InkWell(
                                                  onTap: () =>
                                                      decrementCounter(i),
                                                  child: Container(
                                                    padding: styleSheet
                                                        .DECORATION.PADDING_2,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: styleSheet.COLOR
                                                            .primaryColor),
                                                    child: Icon(Icons.add,
                                                        color: styleSheet
                                                            .COLOR.whiteColor,
                                                        size: 10),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "AED ${product.productList[i].totalPrice.isNotEmpty ? product.productList[i].totalPrice : product.productList[i].price}",
                                    style: styleSheet.TEXT_THEME.fs14Bold
                                        .copyWith(
                                            color: styleSheet.COLOR.blackColor),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                product
                                    .removeProduct(product.productList[i].id);
                                addSupplier = "";
                                setState(() {});
                              },
                              child: Container(
                                  margin: styleSheet.DECORATION.PADDING_5
                                      .copyWith(right: 3),
                                  padding: styleSheet.DECORATION.PADDING_2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: styleSheet.COLOR.redColor,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: styleSheet.COLOR.whiteColor,
                                    size: 15,
                                  )),
                            )
                          ],
                        ),
                      );
                    })
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      styleSheet.appConfig.addHeight(20),
                      Image.asset(styleSheet.images.empty_cart),
                      Text(
                        "Cart is Empty",
                        style: styleSheet.TEXT_THEME.fs14Medium
                            .copyWith(color: styleSheet.COLOR.greyColor),
                      )
                    ],
                  )
          ],
        ).paddingAll(10),
        if (product.productList.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ApplyDiscountDialog();
                      }).then((val) {
                    if (val != null) {
                      isDiscountAdded = true;
                    }
                  });
                },
                label: Text(
                  "Add Discount",
                  style: view.textFontMedium,
                ),
                icon: const Icon(
                  Icons.add_circle_outline_sharp,
                  size: 16,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      product.clearProducts();
                      setState(() {});
                    },
                    child: Container(
                        margin:
                            styleSheet.DECORATION.PADDING_5.copyWith(right: 3),
                        padding: styleSheet.DECORATION.PADDING_5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: styleSheet.COLOR.redColor,
                        ),
                        child: Icon(
                          Icons.delete,
                          color: styleSheet.COLOR.whiteColor,
                        )),
                  ),
                  styleSheet.appConfig.addWidth(50),
                  Expanded(
                    child: PrimaryBtnView(
                      btnName: "Continue",
                      onPressed: () {
                        if (product.productList
                                .any((e) => e.totalPrice.isNotEmpty) ==
                            true) {
                          selectedView(InventoryInvoiceState.Without_Discount);
                        } else {
                          selectedView(InventoryInvoiceState.DiscountState);
                          // widget.onPressedBack!();
                        }
                      },
                    ),
                  ),
                ],
              ).paddingAll(10),
            ],
          )
      ],
    );

    return Obx(() => getView(selectedView.value, defaultView));
  }

  getView(state, defaultView) {
    switch (state) {
      case InventoryInvoiceState.DiscountState:
        return InventoryDiscountView(
          onPressedBack: (val) {
            if (val) {
              selectedView(InventoryInvoiceState.Default);
            } else {
              widget.onPressedBack!();
            }
          },
        );
      case InventoryInvoiceState.Without_Discount:
        return InventoryPaymentView(
          onPressedBack: (val) {
            if (val) {
              selectedView(InventoryInvoiceState.Default);
            } else {
              widget.onPressedBack!();
            }
          },
        );

      default:
        return defaultView;
    }
  }

  incrementCounter(int i) {
    if (int.parse(product.productList[i].qty) != 1) {
      product.productList[i].qty =
          (int.parse(product.productList[i].qty) - 1).toString();
      product.calculateProductPrice(i);
      setState(() {});
    }
  }

  decrementCounter(i) {
    if (int.parse(product.productList[i].qty) > 0) {
      product.productList[i].qty =
          (int.parse(product.productList[i].qty) + 1).toString();

      product.calculateProductPrice(i);
      setState(() {});
    }
  }
}
