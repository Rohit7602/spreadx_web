import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/apply_discount.dart';
import 'package:spreadx_web/Components/Dialog/assign_customer_dialog.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class CheckoutView extends StatefulWidget {
  final void Function()? onPressedBack;
  const CheckoutView({required this.onPressedBack, super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var product = Get.find<ProductController>();

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            styleSheet.appConfig.addHeight(20),
            TextButtonView(
                btnName: "Add Supplier",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AssignCustomerDialog();
                      });
                }),
            styleSheet.appConfig.addHeight(10),
            ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, i) =>
                    styleSheet.appConfig.addHeight(10),
                itemCount: product.productList.length,
                itemBuilder: (context, i) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: styleSheet.DECORATION.PADDING_5
                            .copyWith(bottom: 8, top: 8),
                        decoration: BoxDecoration(
                          borderRadius: styleSheet.DECORATION.RADIUS_5,
                          color: styleSheet.COLOR.greenColor.withOpacity(0.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: styleSheet.COLOR.productCardGreyColor),
                              child: Text(
                                "60 x 10",
                                style: styleSheet.TEXT_THEME.fs12Medium,
                              ),
                            ),
                            styleSheet.appConfig.addWidth(10),
                            Column(
                              children: [
                                Text(
                                  product.productList[i].description,
                                  style: styleSheet.TEXT_THEME.fs12Medium,
                                ),
                                styleSheet.appConfig.addHeight(5),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  color: styleSheet.COLOR.whiteColor,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (itemCount != 1) {
                                            itemCount--;
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          padding:
                                              styleSheet.DECORATION.PADDING_2,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: styleSheet
                                                  .COLOR.primaryColor),
                                          child: Icon(Icons.remove,
                                              color:
                                                  styleSheet.COLOR.whiteColor,
                                              size: 10),
                                        ),
                                      ),
                                      Text(itemCount.toString())
                                          .paddingSymmetric(horizontal: 10),
                                      InkWell(
                                        onTap: () {
                                          if (itemCount > 0) {
                                            itemCount++;
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          padding:
                                              styleSheet.DECORATION.PADDING_2,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: styleSheet
                                                  .COLOR.primaryColor),
                                          child: Icon(Icons.add,
                                              color:
                                                  styleSheet.COLOR.whiteColor,
                                              size: 10),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
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
                          ))
                    ],
                  );
                })
          ],
        ).paddingAll(10),
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
                Container(
                    margin: styleSheet.DECORATION.PADDING_5.copyWith(right: 3),
                    padding: styleSheet.DECORATION.PADDING_5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: styleSheet.COLOR.redColor,
                    ),
                    child: Icon(
                      Icons.delete,
                      color: styleSheet.COLOR.whiteColor,
                    )),
                styleSheet.appConfig.addWidth(50),
                Expanded(
                    child: PrimaryBtnView(
                        btnName: "Continue",
                        onPressed: () {
                          widget.onPressedBack!();
                        }))
              ],
            ).paddingAll(10),
          ],
        )
      ],
    );
  }
}
