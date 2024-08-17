import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Image_Picker/image_picker.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/check_stock_availability_tile.dart';
import 'package:spreadx_web/Components/dashed_rect.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/View/Product/edit_product_details/edit_product_add_brand_view.dart';
import 'package:spreadx_web/View/Product/edit_product_details/edit_product_details_add_category.dart';
import 'package:spreadx_web/View/Product/edit_product_details/edit_product_details_add_packing_view.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class EditProductsDetailsFormView extends StatefulWidget {
  final ProductModel product;
  final void Function()? onPressedBack;
  const EditProductsDetailsFormView(
      {super.key, required this.product, required this.onPressedBack});

  @override
  State<EditProductsDetailsFormView> createState() =>
      _EditProductsDetailsFormViewState();
}

class _EditProductsDetailsFormViewState
    extends State<EditProductsDetailsFormView> {
  final Rx<EditProductDetailStates> selected =
      Rx<EditProductDetailStates>(EditProductDetailStates.Default);

  File? pickedFile;

  String brand = "default";
  String category = "default";

  @override
  Widget build(BuildContext context) {
    final defaultView = Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: styleSheet.appConfig.getScreenHeight(context),
        width: styleSheet.appConfig.getScreenWidth(context),
        child: Padding(
            padding: styleSheet.DECORATION.PADDING_20.copyWith(bottom: 5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: widget.onPressedBack,
                      icon: const Icon(Icons.arrow_back_outlined)),
                ),
                Expanded(
                    child: Row(
                  children: [
                    /// ************************************ Section 1 ************************************
                    /// ***********************************************************************************
                    Expanded(
                        child: Column(
                      children: [
                        DashedRect(
                            padding: styleSheet.DECORATION.PADDING_5
                                .copyWith(top: 10),
                            child: Column(
                              children: [
                                /******** [Edit] and [Cancel] button for [Image Picker] **/
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: styleSheet
                                                .COLOR.productCardGreyColor),
                                        child: IconButton(
                                            onPressed: () async {
                                              pickedFile = await ImageController
                                                  .pickImageByGallery();
                                              setState(() {});
                                            },
                                            color:
                                                styleSheet.COLOR.primaryColor,
                                            icon: const Icon(Icons.edit)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: styleSheet
                                                .COLOR.productCardGreyColor),
                                        child: IconButton(
                                            onPressed: () {
                                              pickedFile = null;
                                              setState(() {});
                                            },
                                            color: styleSheet.COLOR.redColor,
                                            icon: const Icon(Icons.close)),
                                      ),
                                    ]),
                                styleSheet.appConfig.addHeight(40),
                                /** *********************** [Image Picker] Container *********************** */
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.center,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: styleSheet
                                          .COLOR.productCardGreyColor),
                                  child: pickedFile != null
                                      ? Image.file(
                                          File(pickedFile!.path),
                                          fit: BoxFit.cover,
                                        )
                                      : Text("640 x 360",
                                          style: styleSheet.TEXT_THEME.fs28Bold
                                              .copyWith(
                                                  color: styleSheet
                                                      .COLOR.greyColor)),
                                ),
                              ],
                            )),
                        styleSheet.appConfig.addHeight(20),

                        /** ************************** [Save Product] Button ******************* */
                        PrimaryBtnView(
                            btnName: "Save Product",
                            onPressed: () {},
                            isExpanded: true)
                      ],
                    )),
                    styleSheet.appConfig.addWidth(15),

                    /// ************************************ Section 2 ************************************
                    /// ***********************************************************************************
                    Expanded(
                        child: Column(
                      children: [
                        SecondaryTextFormField(
                          label: true,
                          hinttext: "Product Code",
                          onTap: () => openVirtualKeyboard(),
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          label: true,
                          hinttext: "Product Name",
                          onTap: () => openVirtualKeyboard(),
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          label: true,
                          hinttext: "Product Name (Arabic)",
                          onTap: () => openVirtualKeyboard(),
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          label: true,
                          hinttext: "Product Short Name",
                          onTap: () => openVirtualKeyboard(),
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          label: true,
                          hinttext: "Product Short Name (Arabic)",
                          onTap: () => openVirtualKeyboard(),
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          label: true,
                          hinttext: "Product Description",
                          onTap: () => openVirtualKeyboard(),
                        ),
                        styleSheet.appConfig.addHeight(20),
                        CheckStockAvailabilityTile()
                      ],
                    )),
                    styleSheet.appConfig.addWidth(10),

                    /// ************************************ Section 3 ************************************
                    /// ***********************************************************************************
                    Expanded(
                        child: Column(
                      children: [
                        SecondaryTextFormField(
                          allowNumbers: true,
                          label: true,
                          hinttext: "VAT",
                          onTap: () => openVirtualKeyboard(),
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          readOnly: true,
                          suffixicon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(brand,
                                  style: styleSheet.TEXT_THEME.fs12Bold
                                      .copyWith(
                                          color:
                                              styleSheet.COLOR.primaryColor)),
                              styleSheet.appConfig.addWidth(5),
                              Icon(Icons.navigate_next,
                                  color: styleSheet.COLOR.greyColor)
                            ],
                          ),
                          hinttext: "Brand",
                          onTap: () =>
                              {selected(EditProductDetailStates.Brand)},
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          readOnly: true,
                          suffixicon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(category,
                                  style: styleSheet.TEXT_THEME.fs12Bold
                                      .copyWith(
                                          color:
                                              styleSheet.COLOR.primaryColor)),
                              styleSheet.appConfig.addWidth(5),
                              Icon(Icons.navigate_next,
                                  color: styleSheet.COLOR.greyColor)
                            ],
                          ),
                          hinttext: "Category",
                          onTap: () =>
                              {selected(EditProductDetailStates.Category)},
                        ),
                        styleSheet.appConfig.addHeight(20),
                        SecondaryTextFormField(
                          readOnly: true,
                          suffixicon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("1 Packing",
                                  style: styleSheet.TEXT_THEME.fs12Bold
                                      .copyWith(
                                          color:
                                              styleSheet.COLOR.primaryColor)),
                              styleSheet.appConfig.addWidth(5),
                              Icon(Icons.navigate_next,
                                  color: styleSheet.COLOR.greyColor)
                            ],
                          ),
                          hinttext: "Packing",
                          onTap: () =>
                              {selected(EditProductDetailStates.Packing)},
                        ),
                        Container(
                          decoration:
                              BoxDecoration(color: styleSheet.COLOR.whiteColor),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: styleSheet.COLOR.redColor),
                              ),
                              styleSheet.appConfig.addWidth(20),
                              Expanded(
                                  child: Text("PCS",
                                      style: styleSheet.TEXT_THEME.fs14Bold)),
                              Expanded(
                                  flex: 2,
                                  child: Row(children: [
                                    Expanded(
                                        child: Text("x1",
                                            style: styleSheet
                                                .TEXT_THEME.fs12Bold
                                                .copyWith(
                                                    color: styleSheet
                                                        .COLOR.greyColor))),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                          color: styleSheet.COLOR.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "1.0",
                                        style: styleSheet.TEXT_THEME.fs12Bold
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.whiteColor),
                                      ),
                                    )
                                  ]))
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ))
              ],
            )),
      )),
    );

    return Obx(() {
      switch (selected.value) {
        case EditProductDetailStates.Brand:
          return EditProductAddBrandView(
              product: widget.product,
              onPressedBack: (val) {
                if (val.isNotEmpty) {
                  setState(() {
                    brand = val;
                  });
                }
                onPressedBack();
              });
        case EditProductDetailStates.Category:
          return EditProductAddCategoryView(
              product: widget.product,
              onPressedBack: (val) {
                if (val.isNotEmpty) {
                  setState(() {
                    category = val;
                  });
                }
                onPressedBack();
              });
        case EditProductDetailStates.Packing:
          return EditProductAddPackingView(
              product: widget.product, onPressedBack: onPressedBack);
        default:
          return defaultView;
      }
    });
  }

  void onPressedBack() {
    selected(EditProductDetailStates.Default);
  }
}
