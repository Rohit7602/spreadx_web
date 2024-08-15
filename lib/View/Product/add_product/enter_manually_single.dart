import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/Image_Picker/image_picker.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/check_stock_availability_tile.dart';
import 'package:spreadx_web/Components/dashed_rect.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Product/edit_product_details/edit_product_add_brand_view.dart';
import 'package:spreadx_web/View/Product/edit_product_details/edit_product_details_add_category.dart';
import 'package:spreadx_web/View/Product/edit_product_details/edit_product_details_add_packing_view.dart';
import 'package:spreadx_web/View/Product/edit_product_details/widgets/add_packing_dialog.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

part 'widgets/detailed_view.dart';
part 'widgets/quick_add_view.dart';

class EnterManuallySingleProductView extends StatefulWidget {
  final void Function()? onPressedBack;
  const EnterManuallySingleProductView(
      {super.key, required this.onPressedBack});

  @override
  State<EnterManuallySingleProductView> createState() =>
      _EnterManuallySingleProductViewState();
}

class _EnterManuallySingleProductViewState
    extends State<EnterManuallySingleProductView> {
  List<String> tabs = ["Quick Add", "Detailed"];

  RxBool isQuickAdd = RxBool(true);

  Rx<EditProductDetailStates> selectedView =
      Rx<EditProductDetailStates>(EditProductDetailStates.Default);

  @override
  Widget build(BuildContext context) {
    var defaultView = SafeArea(
      child: SizedBox(
        width: styleSheet.appConfig.getScreenWidth(context),
        height: styleSheet.appConfig.getScreenHeight(context),
        child: Padding(
          padding: styleSheet.DECORATION.PADDING_20,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: widget.onPressedBack,
                    icon: const Icon(Icons.arrow_back_outlined)),
              ),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    color: styleSheet.COLOR.bgLightBlueColor2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Container(
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: styleSheet.DECORATION.RADIUS_5,
                              color: styleSheet.COLOR.bgLightBlueColor2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    isQuickAdd.value = !isQuickAdd.value;
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(),
                                      Text(
                                        "Quick Add",
                                        style: styleSheet.TEXT_THEME.fs12Bold
                                            .copyWith(
                                                color: isQuickAdd.value
                                                    ? styleSheet
                                                        .COLOR.primaryColor
                                                    : styleSheet
                                                        .COLOR.blackColor),
                                      ),
                                      isQuickAdd.value
                                          ? Container(
                                              height: 2,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: styleSheet
                                                      .DECORATION.RADIUS_10,
                                                  color: styleSheet
                                                      .COLOR.primaryColor),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                ),
                                styleSheet.appConfig.addWidth(30),
                                InkWell(
                                  onTap: () {
                                    isQuickAdd.value = !isQuickAdd.value;
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(),
                                      Text(
                                        "Detailed",
                                        style: styleSheet.TEXT_THEME.fs12Bold
                                            .copyWith(
                                                color: isQuickAdd.value
                                                    ? styleSheet
                                                        .COLOR.blackColor
                                                    : styleSheet
                                                        .COLOR.primaryColor),
                                      ),
                                      isQuickAdd.value
                                          ? const SizedBox()
                                          : Container(
                                              height: 2,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: styleSheet
                                                      .DECORATION.RADIUS_10,
                                                  color: styleSheet
                                                      .COLOR.primaryColor),
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).paddingOnly(bottom: 10),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: styleSheet.COLOR.greyColor.withOpacity(0.5),
                  ),
                  styleSheet.appConfig.addHeight(20),

                  // ******************************** Tabs View ********************************
                  // ***************************************************************************
                  LayoutBuilder(builder: (context, constr) {
                    if (isQuickAdd.value) {
                      return _QuickAddView();
                    } else {
                      return _DetailedView(
                        onPressedBack: setScreenState,
                      );
                    }
                  })
                ],
              ))
            ],
          ),
        ),
      ),
    );

    return Obx(() {
      switch (selectedView.value) {
        case EditProductDetailStates.Brand:
          return Expanded(
            child: EditProductAddBrandView(
                product: ProductModel("456789", "Default", "", "", "", "", ""),
                onPressedBack: setDefaultView),
          );
        case EditProductDetailStates.Category:
          return Expanded(
            child: EditProductAddCategoryView(
                product: ProductModel("456789", "Default", "", "", "", "", ""),
                onPressedBack: setDefaultView),
          );
        case EditProductDetailStates.Packing:
          return Expanded(
            child: EditProductAddPackingView(
                product: ProductModel("456789", "Default", "", "", "", "", ""),
                onPressedBack: setDefaultView),
          );
        default:
          return defaultView;
      }
    });
  }

  setDefaultView() {
    selectedView(EditProductDetailStates.Default);
  }

  setScreenState(EditProductDetailStates state) {
    selectedView(state);
  }
}
