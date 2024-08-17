import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class EditProductDialog extends StatefulWidget {
  const EditProductDialog({super.key});

  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  final TextEditingController barcode = TextEditingController();
  final TextEditingController productName = TextEditingController();
  final TextEditingController productShortName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController sellingPrice = TextEditingController();
  final TextEditingController vat = TextEditingController();
  final TextEditingController initialStock = TextEditingController();

  final RxString brand = RxString("");
  final RxString category = RxString("");
  final RxString unit = RxString("");
  final RxString sellingPricePerUnit = RxString("");
  final RxString shouldVatIncluded = RxString("");

  final RxList<String> brandList = RxList<String>(["Default"]);
  final RxList<String> categoryList = RxList<String>(["Default"]);
  final RxList<String> unitList = RxList<String>(["PCS"]);
  final RxBool enableCheckStockAvailability = RxBool(false);
  final RxBool allowFraction = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "Edit Product",
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                children: [
                  SecondaryTextFormField(
                    label: true,
                    hinttext: "Barcode",
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
                    hinttext: "Product Short Name",
                    onTap: () => openVirtualKeyboard(),
                  ),
                  styleSheet.appConfig.addHeight(20),
                  SecondaryTextFormField(
                    label: true,
                    hinttext: "Product Description",
                    onTap: () => openVirtualKeyboard(),
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => PrimaryDropDown(
                            isExpanded: true,
                            border: true,
                            hint: "Brand",
                            dropdownValue: brand.value,
                            items: const ["Default", "Puma"],
                            value: (v) {
                              brand(v!);
                            })),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomHeaderDialog(
                                    title: "",
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        styleSheet.appConfig.addHeight(10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add New Brand",
                                              style: styleSheet
                                                  .TEXT_THEME.fs16Bold,
                                            ),
                                          ],
                                        ),
                                        styleSheet.appConfig.addHeight(10),
                                        SecondaryTextFormField(
                                          label: true,
                                          hinttext: "Brand Name",
                                          onTap: () => openVirtualKeyboard(),
                                        ),
                                        styleSheet.appConfig.addHeight(30),
                                        PrimaryBtnView(
                                            isExpanded: true,
                                            btnName: "Add Brand",
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                        styleSheet.appConfig.addHeight(20),
                                      ],
                                    ));
                              });
                        },
                        icon: const Icon(Icons.add),
                      )
                    ],
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => PrimaryDropDown(
                            isExpanded: true,
                            border: true,
                            hint: "Category",
                            dropdownValue: category.value,
                            items: const ["Default", "Sub"],
                            value: (v) {
                              brand(v!);
                            })),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomHeaderDialog(
                                    title: "",
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        styleSheet.appConfig.addHeight(10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add New Category",
                                              style: styleSheet
                                                  .TEXT_THEME.fs16Bold,
                                            ),
                                          ],
                                        ),
                                        styleSheet.appConfig.addHeight(10),
                                        SecondaryTextFormField(
                                          label: true,
                                          hinttext: "Category Name",
                                          onTap: () => openVirtualKeyboard(),
                                        ),
                                        styleSheet.appConfig.addHeight(30),
                                        PrimaryBtnView(
                                            isExpanded: true,
                                            btnName: "Add Category",
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                        styleSheet.appConfig.addHeight(20),
                                      ],
                                    ));
                              });
                        },
                        icon: const Icon(Icons.add),
                      )
                    ],
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => PrimaryDropDown(
                            isExpanded: true,
                            border: true,
                            hint: "Unit",
                            dropdownValue: category.value,
                            items: const ["PCS", "MyUnit"],
                            value: (v) {
                              brand(v!);
                            })),
                      ),
                      styleSheet.appConfig.addWidth(20),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomHeaderDialog(
                                    title: "",
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        styleSheet.appConfig.addHeight(10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add New Unit",
                                              style: styleSheet
                                                  .TEXT_THEME.fs16Bold,
                                            ),
                                          ],
                                        ),
                                        styleSheet.appConfig.addHeight(10),
                                        SecondaryTextFormField(
                                          label: true,
                                          hinttext: "Unit Code",
                                          onTap: () => openVirtualKeyboard(),
                                        ),
                                        styleSheet.appConfig.addHeight(30),
                                        SecondaryTextFormField(
                                          label: true,
                                          hinttext: "Unit Name",
                                          onTap: () => openVirtualKeyboard(),
                                        ),
                                        styleSheet.appConfig.addHeight(30),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Obx(() {
                                                    return Checkbox(
                                                        value:
                                                            allowFraction.value,
                                                        onChanged: (v) {
                                                          allowFraction(v);
                                                        });
                                                  }),
                                                  const Text("Allow Fraction")
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: SecondaryTextFormField(
                                                label: true,
                                                hinttext: "Unit Equivalence",
                                                onTap: () =>
                                                    openVirtualKeyboard(),
                                              ),
                                            )
                                          ],
                                        ),
                                        styleSheet.appConfig.addHeight(30),
                                        PrimaryBtnView(
                                            isExpanded: true,
                                            btnName: "Add Unit",
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                        styleSheet.appConfig.addHeight(20),
                                      ],
                                    ));
                              });
                        },
                        icon: const Icon(Icons.add),
                      )
                    ],
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryTextFormField(
                          label: true,
                          hinttext: "0.0",
                          onTap: () => openVirtualKeyboard(),
                        ),
                      ),
                      styleSheet.appConfig.addWidth(10),
                      Expanded(
                        child: Obx(() => PrimaryDropDown(
                            isExpanded: true,
                            border: true,
                            hint: "Selete Item",
                            dropdownValue: category.value,
                            items: const ["Per Item", "Per Weight", "Mixed"],
                            value: (v) {
                              brand(v!);
                            })),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryTextFormField(
                          label: true,
                          hinttext: "Vat",
                          onTap: () => openVirtualKeyboard(),
                        ),
                      ),
                    ],
                  ),
                  styleSheet.appConfig.addHeight(20),
                  SecondaryTextFormField(
                    label: true,
                    hinttext: "Initial Stock",
                    onTap: () => openVirtualKeyboard(),
                  ),
                  styleSheet.appConfig.addHeight(20),
                  Obx(
                    () => ListTile(
                        onTap: () {
                          enableCheckStockAvailability.value =
                              !enableCheckStockAvailability.value;
                        },
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        title: Text("Check Stock Availability",
                            style: styleSheet.TEXT_THEME.fs14Bold.copyWith(
                                color: styleSheet.COLOR.blackColor
                                    .withOpacity(0.6))),
                        trailing: Switch.adaptive(
                            value: enableCheckStockAvailability.value,
                            onChanged: (v) {
                              enableCheckStockAvailability(v);
                            })),
                  ),
                  styleSheet.appConfig.addHeight(50),
                ],
              ),
              Container(
                color: styleSheet.COLOR.whiteColor,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryBtnView(
                        btnName: "Update",
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
