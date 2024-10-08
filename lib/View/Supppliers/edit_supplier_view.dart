import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/navigation_controller.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/phone_text_field.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/enum.dart';
import 'package:spreadx_web/View/Inventory/purchase_products_view.dart';
import 'package:spreadx_web/View/Supppliers/assign_product_supplier.dart';
import 'package:spreadx_web/View/Supppliers/supplier_purchase_history_view.dart';
import 'package:spreadx_web/View/Supppliers/view_product_supplier.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class EditSupplierView extends StatefulWidget {
  final void Function()? onPressedBack;
  String supplierName;
  EditSupplierView(
      {super.key, required this.onPressedBack, required this.supplierName});

  @override
  State<EditSupplierView> createState() => _EditSupplierViewState();
}

class _EditSupplierViewState extends State<EditSupplierView> {
  final TextEditingController _phoneController = TextEditingController();

  final navController = Get.find<NavigationController>();

  final RxString selectedSupplierType = RxString("Cash");

  final Rx<EditSupplierViewState> selected =
      Rx<EditSupplierViewState>(EditSupplierViewState.Default);
  @override
  Widget build(BuildContext context) {
    final defaultView = Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
              styleSheet.appConfig.addHeight(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SecondaryTextFormField(
                      hinttext: "Supplier Name",
                      label: true,
                      onTap: () => openVirtualKeyboard()),
                  styleSheet.appConfig.addHeight(20),
                  PhoneTextField(
                      controller: _phoneController, onValuePick: (v) {}),
                  styleSheet.appConfig.addHeight(15),
                  Text("Supplier Type",
                      style: styleSheet.TEXT_THEME.fs14Bold
                          .copyWith(color: styleSheet.COLOR.primaryColor)),
                  styleSheet.appConfig.addHeight(15),
                  Obx(() => PrimaryDropDown(
                      isExpanded: true,
                      border: true,
                      dropdownValue: selectedSupplierType.value,
                      items: const ['Cash', 'Credit'],
                      value: (v) {
                        selectedSupplierType(v);
                      })),
                  Obx(() => selectedSupplierType.value == "Credit"
                      ? Column(
                          children: [
                            styleSheet.appConfig.addHeight(20),
                            SecondaryTextFormField(
                                hinttext: "Credit Limit",
                                label: true,
                                onTap: () => openVirtualKeyboard()),
                            styleSheet.appConfig.addHeight(20),
                            SecondaryTextFormField(
                                hinttext: "Days Limit",
                                label: true,
                                onTap: () => openVirtualKeyboard()),
                          ],
                        )
                      : const SizedBox()),
                  styleSheet.appConfig.addHeight(40),
                  Align(
                      alignment: Alignment.center,
                      child: PrimaryBtnView(
                          btnName: "Save", onPressed: widget.onPressedBack!)),
                  styleSheet.appConfig.addHeight(20),
                  PrimaryBtnView(
                      btnName: "View Products",
                      onPressed: () {
                        selected(EditSupplierViewState.View_Product);
                      },
                      isExpanded: true),
                  styleSheet.appConfig.addHeight(20),
                  PrimaryBtnView(
                      btnName: "Assign Products",
                      onPressed: () {
                        selected(EditSupplierViewState.Assign_Products);
                      },
                      isExpanded: true),
                  styleSheet.appConfig.addHeight(20),
                  PrimaryBtnView(
                      btnName: "Purchase Products",
                      onPressed: () {
                        selected(EditSupplierViewState.Purchase_Products);
                      },
                      isExpanded: true),
                  styleSheet.appConfig.addHeight(20),
                  PrimaryBtnView(
                      btnName: "Purchase History",
                      onPressed: () {
                        navController.setExportBtn(true);
                        selected(EditSupplierViewState.Purchase_History);
                      },
                      isExpanded: true),
                ],
              )
            ],
          ),
        ),
      )),
    );

    return Obx(() {
      switch (selected.value) {
        case EditSupplierViewState.Purchase_History:
          return EditSupplierPurchaseHistoryView(onPressedBack: onPressedBack);
        case EditSupplierViewState.Purchase_Products:
          return PurchaseProductsView(
            supplierName: widget.supplierName,
            isSupplier: false,
            onPressedBack: (val) {
              if (val) {
                widget.onPressedBack!();
              } else {
                selected(EditSupplierViewState.Default);
              }
            },
          );
        case EditSupplierViewState.Assign_Products:
          return AssignProductSupplier(
            onPressedBack: () {
              selected(EditSupplierViewState.Default);
            },
          );
        case EditSupplierViewState.View_Product:
          return ViewProductSupplier(
            onPressedBack: () {
              selected(EditSupplierViewState.Default);
            },
          );
        default:
          return defaultView;
      }
    });
  }

  void onPressedBack() {
    navController.setExportBtn(false);
    selected(EditSupplierViewState.Default);
  }
}
