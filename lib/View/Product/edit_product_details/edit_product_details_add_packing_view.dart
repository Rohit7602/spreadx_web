import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/Product/edit_product_details/widgets/add_packing_dialog.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class EditProductAddPackingView extends StatefulWidget {
  final ProductModel product;
  final void Function()? onPressedBack;
  const EditProductAddPackingView(
      {super.key, required this.product, required this.onPressedBack});

  @override
  State<EditProductAddPackingView> createState() =>
      _EditProductAddPackingViewState();
}

class _EditProductAddPackingViewState extends State<EditProductAddPackingView> {
  RxList<String> selectedList = RxList<String>([]);
  Rx<Map<String, dynamic>> perPiece = Rx<Map<String, dynamic>>({});

  RxList<PackingDataModel> packingList = RxList<PackingDataModel>([
    PackingDataModel(
        id: "3456098",
        unitCode: "Pieces",
        unitName: "PCS",
        unitEquivalent: "data")
  ]);

  @override
  Widget build(BuildContext context) {
    final width = styleSheet.appConfig.getScreenWidth(context);

    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
              onPressed: widget.onPressedBack,
              backgroundColor: styleSheet.COLOR.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.check)),
          styleSheet.appConfig.addHeight(5),
          FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddPackingDialog(ontap: (v) {
                        packingList.add(v);
                      });
                    });
              },
              backgroundColor: styleSheet.COLOR.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        height: styleSheet.appConfig.getScreenHeight(context),
        width: styleSheet.appConfig.getScreenWidth(context),
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
                  PrimaryTextFormField(
                      prefixIcon: const Icon(Icons.search),
                      onTap: () => openVirtualKeyboard(),
                      hinttext: "Search..."),
                  styleSheet.appConfig.addHeight(10),
                  Expanded(
                      child: Obx(() => GridView.builder(
                          itemCount: packingList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: width < 1096
                                      ? 1
                                      : width < 1437
                                          ? 2
                                          : 3,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, i) {
                            final data = packingList[i];

                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      if (selectedList.contains(data.id)) {
                                        selectedList.remove(data.id);
                                        perPiece
                                            .update((v) => v!.remove(data.id));
                                      } else {
                                        selectedList.add(data.id);
                                        perPiece.update((v) =>
                                            v!.addAll({data.id: "Per Item"}));
                                      }
                                    },
                                    child: Obx(
                                      () => Icon(
                                          selectedList.contains(data.id)
                                              ? Icons.check_circle
                                              : Icons.circle_outlined,
                                          size: 30,
                                          color: selectedList.contains(data.id)
                                              ? styleSheet.COLOR.greenColor
                                              : styleSheet.COLOR.greyColor),
                                    )),
                                styleSheet.appConfig.addWidth(5),
                                Expanded(
                                  child: Card(
                                    child: Padding(
                                        padding:
                                            styleSheet.DECORATION.PADDING_10,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      "${data.unitName} (${data.unitCode})",
                                                      style: styleSheet
                                                          .TEXT_THEME.fs16Bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Checkbox.adaptive(
                                                        value: data.isBase,
                                                        onChanged: (v) {
                                                          data.isBase = v!;
                                                          setState(() {});
                                                        }),
                                                    Text("Is Base",
                                                        style: styleSheet
                                                            .TEXT_THEME.fs14Bold
                                                            .copyWith(
                                                                color: styleSheet
                                                                    .COLOR
                                                                    .greyColor))
                                                  ],
                                                )
                                              ],
                                            ),
                                            Obx(
                                                () =>
                                                    selectedList
                                                            .contains(data.id)
                                                        ? Column(
                                                            children: [
                                                              styleSheet
                                                                  .appConfig
                                                                  .addHeight(
                                                                      10),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        SecondaryTextFormField(
                                                                      hinttext:
                                                                          "Factor",
                                                                      label:
                                                                          true,
                                                                      onTap: () =>
                                                                          openVirtualKeyboard(),
                                                                    ),
                                                                  ),
                                                                  styleSheet
                                                                      .appConfig
                                                                      .addWidth(
                                                                          10),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        SecondaryTextFormField(
                                                                      hinttext:
                                                                          "Barcode",
                                                                      label:
                                                                          true,
                                                                      onTap: () =>
                                                                          openVirtualKeyboard(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              styleSheet
                                                                  .appConfig
                                                                  .addHeight(
                                                                      20),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        SecondaryTextFormField(
                                                                      hinttext:
                                                                          "Selling Price",
                                                                      label:
                                                                          true,
                                                                      onTap: () =>
                                                                          openVirtualKeyboard(),
                                                                    ),
                                                                  ),
                                                                  styleSheet
                                                                      .appConfig
                                                                      .addWidth(
                                                                          10),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              5),
                                                                          border:
                                                                              Border.all()),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child:
                                                                            DropdownButton(
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 5),
                                                                          isDense:
                                                                              true,
                                                                          value:
                                                                              perPiece.value[data.id],
                                                                          items:
                                                                              [
                                                                            "Per Item",
                                                                            "Per Weight",
                                                                            "Mixed"
                                                                          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                                                          onChanged:
                                                                              (v) {
                                                                            if (perPiece.value.containsKey(data.id)) {
                                                                              perPiece.update((val) => val![data.id] = v);
                                                                            } else {
                                                                              perPiece.update(
                                                                                (val) => val!.addAll(
                                                                                  {
                                                                                    data.id: v
                                                                                  },
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              perPiece.value[data
                                                                              .id]
                                                                          .toString()
                                                                          .toLowerCase() !=
                                                                      "per item"
                                                                  ? Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              SecondaryTextFormField(
                                                                            hinttext:
                                                                                "Net Weight",
                                                                            label:
                                                                                true,
                                                                            onTap: () =>
                                                                                openVirtualKeyboard(),
                                                                          ),
                                                                        ),
                                                                        styleSheet
                                                                            .appConfig
                                                                            .addWidth(10),
                                                                        Expanded(
                                                                          child:
                                                                              SecondaryTextFormField(
                                                                            hinttext:
                                                                                "Gross Weight",
                                                                            label:
                                                                                true,
                                                                            onTap: () =>
                                                                                openVirtualKeyboard(),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ).paddingOnly(
                                                                      top: 10)
                                                                  : const SizedBox(),
                                                            ],
                                                          )
                                                        : const SizedBox())
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            );
                          })))
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
