import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Button/text_btn.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
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

  RxInt selected = RxInt(0);

  List<Widget> views = [_QuickAddView(), _DetailedView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(tabs.length, (i) {
                                return Obx(() => InkWell(
                                      onTap: () {
                                        selected(i);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                              border: selected.value == i
                                                  ? Border(
                                                      bottom: BorderSide(
                                                          color: styleSheet
                                                              .COLOR
                                                              .primaryColor,
                                                          width: 2))
                                                  : null),
                                          child: Text(
                                              tabs[i],
                                              style: styleSheet
                                                  .TEXT_THEME.fs14Bold
                                                  .copyWith(
                                                      color:
                                                          selected.value == i
                                                              ? styleSheet.COLOR
                                                                  .primaryColor
                                                              : styleSheet.COLOR
                                                                  .blackColor
                                                                  .withOpacity(
                                                                      0.6))),
                                        ),
                                      ),
                                    ));
                              })
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: styleSheet.COLOR.greyColor.withOpacity(0.5),
                          ),
                          styleSheet.appConfig.addHeight(20),

                          // ******************************** Tabs View ********************************
                          // ***************************************************************************
                          Obx(() => views[selected.value])
                        ],
                      ))
                    ],
                  )))),
    );
  }
}
