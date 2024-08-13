import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/Widget/alert_dialog.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/main.dart';

class AssignProductSupplier extends StatefulWidget {
  void Function() onPressedBack;
  AssignProductSupplier({required this.onPressedBack, super.key});

  @override
  State<AssignProductSupplier> createState() => _AssignProductSupplierState();
}

class _AssignProductSupplierState extends State<AssignProductSupplier> {
  var product = Get.find<ProductController>();

  List<ProductModel> selectedProductList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: widget.onPressedBack,
                icon: const Icon(Icons.arrow_back)),
            Wrap(
              children: [
                ...List.generate(
                  product.productList.length,
                  (index) => InkWell(
                    onTap: () {
                      if (selectedProductList.any(
                          (val) => val.id == product.productList[index].id)) {
                        selectedProductList.remove(product.productList[index]);
                      } else {
                        selectedProductList.add(product.productList[index]);
                      }

                      setState(() {});
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                            width: 330,
                            decoration: BoxDecoration(
                              borderRadius: styleSheet.DECORATION.RADIUS_5,
                              color: styleSheet.COLOR.productCardGreyColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                styleSheet.appConfig.addHeight(30),
                                Text(
                                  "640 x 360",
                                  style: styleSheet.TEXT_THEME.fs16Medium
                                      .copyWith(
                                          color: styleSheet.COLOR.greyColor),
                                ),
                                styleSheet.appConfig.addHeight(8),
                                Container(
                                  padding: styleSheet.DECORATION.PADDING_5,
                                  width: styleSheet.appConfig
                                      .getScreenWidth(context),
                                  decoration: BoxDecoration(
                                      color: styleSheet.COLOR.greyColor,
                                      borderRadius:
                                          styleSheet.DECORATION.RADIUS_5),
                                  child: Text(
                                    product.productList[index].productName,
                                    style: styleSheet.TEXT_THEME.fs12Medium
                                        .copyWith(
                                            color: styleSheet.COLOR.whiteColor),
                                  ),
                                ),
                              ],
                            )),
                        selectedProductList.any(
                                (e) => e.id == product.productList[index].id)
                            ? Icon(
                                Icons.check_circle_outline,
                                color: styleSheet.COLOR.blackColor,
                              ).paddingAll(10)
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ],
            ).paddingAll(20),
          ],
        ),
        PrimaryBtnView(
          isExpanded: true,
          btnName: "Assign Products",
          onPressed: () {
            product.addAssignedProduct(selectedProductList);

            showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                      title: "Success",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          styleSheet.appConfig.addHeight(10),
                          const Text("Supplier added success"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButtonView(
                                  btnName: "OK",
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    widget.onPressedBack();
                                  }),
                            ],
                          )
                        ],
                      ));
                });
          },
        ).paddingAll(20)
      ],
    );
  }
}
