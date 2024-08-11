import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/supplier_controller.dart';
import 'package:spreadx_web/View/Supppliers/add_new_supplier.dart';
import 'package:spreadx_web/View/Supppliers/suppliers_detail_view.dart';
import 'package:spreadx_web/main.dart';

class SuppliersView extends StatefulWidget {
  const SuppliersView({super.key});

  @override
  State<SuppliersView> createState() => _SuppliersViewState();
}

class _SuppliersViewState extends State<SuppliersView> {
  RxString selected = RxString("default");
  var controller = Get.find<SupplierController>();
  @override
  Widget build(BuildContext context) {
    final defaultView = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            controller.suppliers.isEmpty
                ? const Center(child: Text("Supplier list is empty"))
                    .paddingOnly(top: 50)
                : ListView.separated(
                    itemCount: controller.suppliers.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, i) =>
                        styleSheet.appConfig.addHeight(10),
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selected("details");
                          });
                        },
                        child: Container(
                          padding: styleSheet.DECORATION.PADDING_10,
                          decoration: BoxDecoration(
                              borderRadius: styleSheet.DECORATION.RADIUS_5,
                              color: styleSheet.COLOR.bgColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    styleSheet.icons.supplierIcon,
                                    color: styleSheet.COLOR.primaryColor,
                                  ),
                                  styleSheet.appConfig.addWidth(20),
                                  Text(
                                    controller.suppliers[i].name,
                                    style: styleSheet.TEXT_THEME.fs14Bold,
                                  ),
                                ],
                              ),
                              Container(
                                padding: styleSheet.DECORATION.PADDING_10,
                                decoration: BoxDecoration(
                                  color: styleSheet.COLOR.bgLightBlueColor2,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: styleSheet.COLOR.blackColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).paddingAll(20),
          ],
        ),
        DrawerButtonView(
            btnName: "Add New Supplier",
            onPressed: () {
              selected("add");
            }).paddingAll(15)
      ],
    );

    return Obx(() {
      if (selected.value == "default") {
        return defaultView;
      } else if (selected.value == "add") {
        return AddNewSupplierView(
          onPressedBack: () => selected("default"),
        );
      } else {
        return SupplierDetailsView(onPressedBack: () => selected("default"));
      }
    });
  }
}
