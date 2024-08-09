import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/View/Product/edit_product_details/edit_products_details_form.dart';
import 'package:spreadx_web/View/Product/edit_product_details/widgets/delete_product_dialog.dart';
import 'package:spreadx_web/main.dart';

class EditProductDetailsView extends StatefulWidget {
  final ProductModel product;
  final void Function()? onPressedBack;
  const EditProductDetailsView(
      {super.key, required this.product, required this.onPressedBack});

  @override
  State<EditProductDetailsView> createState() => _EditProductDetailsViewState();
}

class _EditProductDetailsViewState extends State<EditProductDetailsView> {
  RxString selected = RxString("default");

  @override
  Widget build(BuildContext context) {
    final defaultView = Scaffold(
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
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration:
                        BoxDecoration(color: styleSheet.COLOR.whiteColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 300,
                          decoration: BoxDecoration(
                              color: styleSheet.COLOR.productCardGreyColor),
                          child: Text("640 x 360",
                              style: styleSheet.TEXT_THEME.fs28Bold
                                  .copyWith(color: styleSheet.COLOR.greyColor)),
                        ),
                      ],
                    ),
                  )),
                  styleSheet.appConfig.addWidth(20),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          styleSheet.appConfig.addHeight(
                              styleSheet.appConfig.getScreenHeight(context) *
                                  0.05),
                          Text("#DEFAULT",
                              style: styleSheet.TEXT_THEME.fs14Bold.copyWith(
                                  color: styleSheet.COLOR.primaryColor)),
                          Text("DEFAULT",
                              style: styleSheet.TEXT_THEME.fs18Bold),
                          styleSheet.appConfig.addHeight(15),
                          Text("Default Product",
                              style: styleSheet.TEXT_THEME.fs12Bold
                                  .copyWith(color: styleSheet.COLOR.greyColor)),
                          styleSheet.appConfig.addHeight(15),
                          Text("DETAILS",
                              style: styleSheet.TEXT_THEME.fs12Bold
                                  .copyWith(color: styleSheet.COLOR.greyColor)),
                          styleSheet.appConfig.addHeight(5),
                          Container(
                            padding: styleSheet.DECORATION.PADDING_10,
                            decoration: BoxDecoration(
                                color: styleSheet.COLOR.whiteColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ar. Name",
                                    style: styleSheet.TEXT_THEME.fs12Bold
                                        .copyWith(
                                            color: styleSheet.COLOR.greyColor)),
                                styleSheet.appConfig.addHeight(5),
                                const _DetailsTile(
                                    title: "Brand", value: "DEFAULT"),
                                styleSheet.appConfig.addHeight(5),
                                const _DetailsTile(
                                    title: "Category", value: "DEFAULT"),
                                styleSheet.appConfig.addHeight(5),
                                Divider(
                                    color: styleSheet.COLOR.greyColor
                                        .withOpacity(0.5)),
                                styleSheet.appConfig.addHeight(5),
                                const _DetailsTile(title: "VAT", value: "0.0%"),
                              ],
                            ),
                          ),
                          styleSheet.appConfig.addHeight(10),
                          Text("PACKING",
                              style: styleSheet.TEXT_THEME.fs12Bold
                                  .copyWith(color: styleSheet.COLOR.greyColor)),
                          styleSheet.appConfig.addHeight(5),
                          Container(
                            padding: styleSheet.DECORATION.PADDING_10,
                            decoration: BoxDecoration(
                                color: styleSheet.COLOR.whiteColor),
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
                                        style:
                                            styleSheet.TEXT_THEME.fs14Medium)),
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
                          ),
                          styleSheet.appConfig.addHeight(40),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextButton.icon(
                                    onPressed: () {
                                      selected("edit");
                                    },
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        backgroundColor:
                                            styleSheet.COLOR.primaryColor,
                                        foregroundColor:
                                            styleSheet.COLOR.whiteColor),
                                    label: const Text("Edit Product"),
                                    icon: const Icon(Icons.edit)),
                              ),
                              styleSheet.appConfig.addWidth(10),
                              Expanded(
                                child: TextButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const DeleteProductDialog();
                                          });
                                    },
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        backgroundColor:
                                            styleSheet.COLOR.redColor,
                                        foregroundColor:
                                            styleSheet.COLOR.whiteColor),
                                    label: const Text("Delete Product"),
                                    icon: const Icon(Icons.close)),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ))
            ],
          ),
        ),
      )),
    );

    return Obx(() {
      if (selected.value == "default") {
        return defaultView;
      } else {
        return EditProductsDetailsFormView(
            product: widget.product,
            onPressedBack: () {
              selected("default");
            });
      }
    });
  }
}

class _DetailsTile extends StatelessWidget {
  final String title;
  final String value;
  const _DetailsTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(title,
                style: styleSheet.TEXT_THEME.fs12Bold
                    .copyWith(color: styleSheet.COLOR.greyColor))),
        Expanded(child: Text(value, style: styleSheet.TEXT_THEME.fs14Bold)),
      ],
    );
  }
}
