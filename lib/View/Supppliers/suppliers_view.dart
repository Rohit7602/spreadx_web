import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/supplier_controller.dart';
import 'package:spreadx_web/Data/local_data.dart';
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

  SuppliersModel? supplierModel;

  @override
  Widget build(BuildContext context) {
    final defaultView = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: styleSheet.DECORATION.PADDING_20,
          height: styleSheet.appConfig.getScreenHeight(context),
          width: styleSheet.appConfig.getScreenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Supplier List",
                  style: styleSheet.TEXT_THEME.fs14Bold
                      .copyWith(color: styleSheet.COLOR.primaryColor)),
              styleSheet.appConfig.addHeight(10),
              controller.suppliers.isEmpty
                  ? const Center(child: Text("Supplier list is empty"))
                      .paddingOnly(top: 50)
                  : Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      alignment: WrapAlignment.start,
                      children: [
                        ...List.generate(controller.suppliers.length, (i) {
                          return GestureDetector(
                            onTap: () {
                              supplierModel = controller.suppliers[i];
                              setState(() {
                                selected("details");
                              });
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: styleSheet.DECORATION.RADIUS_10,
                              ),
                              child: Container(
                                padding: styleSheet.DECORATION.PADDING_10,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: styleSheet.COLOR.cardColor,
                                  borderRadius: styleSheet.DECORATION.RADIUS_10,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: styleSheet
                                            .COLOR.productCardGreyColor,
                                      ),
                                      child: Image.asset(
                                        styleSheet.icons.supplierIcon,
                                        color: styleSheet.COLOR.primaryColor,
                                      ),
                                      // Text(
                                      //   "6 X 6",
                                      //   style: styleSheet.TEXT_THEME.fs12Medium
                                      //       .copyWith(
                                      //           color:
                                      //               styleSheet.COLOR.greyColor),
                                      // ),
                                    ),
                                    styleSheet.appConfig.addWidth(15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.suppliers[i].name,
                                          style: styleSheet.TEXT_THEME.fs12Bold,
                                        ),
                                        styleSheet.appConfig.addHeight(6),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                  color: styleSheet
                                                      .COLOR.blueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Text(
                                                controller.suppliers[i].type
                                                        .isNotEmpty
                                                    ? controller
                                                        .suppliers[i].type
                                                    : "default",
                                                style: styleSheet
                                                    .TEXT_THEME.fs10Medium
                                                    .copyWith(
                                                        color: styleSheet
                                                            .COLOR.whiteColor),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    )
              // ListView.separated(
              //     itemCount: controller.suppliers.length,
              //     shrinkWrap: true,
              //     separatorBuilder: (context, i) =>
              //         styleSheet.appConfig.addHeight(10),
              //     itemBuilder: (context, i) {
              //       return InkWell(
              //         onTap: () {
              //           setState(() {
              //             selected("details");
              //           });
              //         },
              //         child: Container(
              //           padding: styleSheet.DECORATION.PADDING_10,
              //           decoration: BoxDecoration(
              //               borderRadius: styleSheet.DECORATION.RADIUS_5,
              //               color: styleSheet.COLOR.bgColor),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Row(
              //                 children: [
              //                   Image.asset(
              //                     styleSheet.icons.supplierIcon,
              //                     color: styleSheet.COLOR.primaryColor,
              //                   ),
              //                   styleSheet.appConfig.addWidth(20),
              //                   Text(
              //                     controller.suppliers[i].name,
              //                     style: styleSheet.TEXT_THEME.fs14Bold,
              //                   ),
              //                 ],
              //               ),
              //               Container(
              //                 padding: styleSheet.DECORATION.PADDING_10,
              //                 decoration: BoxDecoration(
              //                   color: styleSheet.COLOR.bgLightBlueColor2,
              //                   shape: BoxShape.circle,
              //                 ),
              //                 child: Icon(
              //                   Icons.edit,
              //                   color: styleSheet.COLOR.blackColor,
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     }).paddingAll(20),
            ],
          ),
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
          onPressedBack: () {
            selected("default");
            setState(() {});
          },
        );
      } else {
        return SupplierDetailsView(
          onPressedBack: () => selected("default"),
          supplierModel: supplierModel!,
        );
      }
    });
  }
}
