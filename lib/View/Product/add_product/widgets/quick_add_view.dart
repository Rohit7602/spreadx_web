// ignore_for_file: must_be_immutable, unused_element

part of '../enter_manually_single.dart';

class _QuickAddView extends StatelessWidget {
  _QuickAddView({super.key});

  RxString selectedPacking = RxString("PCS");

  RxList<PackingDataModel> packingDataList = RxList([
    PackingDataModel(
        id: "3456098",
        unitCode: "Pieces",
        unitName: "PCS",
        unitEquivalent: "data")
  ]);

  var productController = Get.find<ProductController>();

  final productNameController = TextEditingController();
  final productCodeController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final productShortNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SecondaryTextFormField(
          hinttext: "Barcode / Product Code",
          label: true,
          onTap: () => openVirtualKeyboard(),
        ),
        styleSheet.appConfig.addHeight(20),
        Row(
          children: [
            Expanded(
              child: SecondaryTextFormField(
                controller: productNameController,
                hinttext: "Product Name",
                label: true,
                onTap: () => openVirtualKeyboard(),
              ),
            ),
            styleSheet.appConfig.addWidth(20),
            Expanded(
              child: SecondaryTextFormField(
                controller: productShortNameController,
                hinttext: "Product Short Name",
                label: true,
                onTap: () => openVirtualKeyboard(),
              ),
            ),
          ],
        ),
        styleSheet.appConfig.addHeight(20),
        Row(
          children: [
            Expanded(
              child: SecondaryTextFormField(
                controller: sellingPriceController,
                hinttext: "Selling Price",
                label: true,
                onTap: () => openVirtualKeyboard(),
              ),
            ),
            styleSheet.appConfig.addWidth(20),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Obx(() => PrimaryDropDown(
                      dropdownValue: selectedPacking.value,
                      border: true,
                      items: packingDataList.map((e) => e.unitName).toList(),
                      value: (v) {
                        selectedPacking(v);
                      })),
                ),
                styleSheet.appConfig.addWidth(20),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AddPackingDialog(ontap: (v) {
                              packingDataList.add(v);
                            });
                          });
                    },
                    icon: Icon(Icons.add_circle_outline,
                        color: styleSheet.COLOR.primaryColor, size: 30)),
                styleSheet.appConfig.addWidth(20),
              ],
            ))
          ],
        ),
        styleSheet.appConfig.addHeight(20),
        CheckStockAvailabilityTile(),
        styleSheet.appConfig.addHeight(40),
        PrimaryBtnView(
            btnName: "Add New Product",
            onPressed: () {
              productController.addProducts(
                ProductModel("1", productNameController.text, "", "", "", ""),
              );
            },
            isExpanded: true),
      ],
    );
  }
}
