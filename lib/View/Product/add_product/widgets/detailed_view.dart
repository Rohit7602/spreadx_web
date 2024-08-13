part of '../enter_manually_single.dart';

class _DetailedView extends StatelessWidget {
  _DetailedView({super.key});

  final Rx<EditProductDetailStates> selected =
      Rx<EditProductDetailStates>(EditProductDetailStates.Default);

  @override
  Widget build(BuildContext context) {
    final defaultView = Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ************************************ Section 1 ************************************
          /// ***********************************************************************************
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: DashedRect(
                    padding: styleSheet.DECORATION.PADDING_5.copyWith(top: 10),
                    child: SizedBox(
                      width: styleSheet.appConfig.getScreenWidth(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file_outlined,
                              size: 50, color: styleSheet.COLOR.greyColor),
                          styleSheet.appConfig.addHeight(20),
                          Text("Add image or a label to your product",
                              style: styleSheet.TEXT_THEME.fs16Bold.copyWith(
                                  color: styleSheet.COLOR.primaryColor)),
                          Text("PNG, JPG, GIF up to 20MB",
                              style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                                  color: styleSheet.COLOR.greyColor
                                      .withOpacity(0.8))),
                          styleSheet.appConfig.addHeight(40),
                          TextButtonView(
                              btnName: "Browse to upload",
                              txtColor: styleSheet.COLOR.primaryColor,
                              onPressed: () {})
                        ],
                      ),
                    )),
              ),
              styleSheet.appConfig.addHeight(20),
              /** ************************** [Save Product] Button ******************* */
              PrimaryBtnView(
                  btnName: "Add New Product",
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
                readOnly: true,
                suffixicon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("default",
                        style: styleSheet.TEXT_THEME.fs12Bold
                            .copyWith(color: styleSheet.COLOR.primaryColor)),
                    styleSheet.appConfig.addWidth(5),
                    Icon(Icons.navigate_next, color: styleSheet.COLOR.greyColor)
                  ],
                ),
                hinttext: "Brand",
                onTap: () => {selected(EditProductDetailStates.Brand)},
              ),
              styleSheet.appConfig.addHeight(20),
              SecondaryTextFormField(
                readOnly: true,
                suffixicon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("default",
                        style: styleSheet.TEXT_THEME.fs12Bold
                            .copyWith(color: styleSheet.COLOR.primaryColor)),
                    styleSheet.appConfig.addWidth(5),
                    Icon(Icons.navigate_next, color: styleSheet.COLOR.greyColor)
                  ],
                ),
                hinttext: "Category",
                onTap: () => {selected(EditProductDetailStates.Category)},
              ),
              styleSheet.appConfig.addHeight(20),
              SecondaryTextFormField(
                readOnly: true,
                suffixicon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("1 Packing",
                        style: styleSheet.TEXT_THEME.fs12Bold
                            .copyWith(color: styleSheet.COLOR.primaryColor)),
                    styleSheet.appConfig.addWidth(5),
                    Icon(Icons.navigate_next, color: styleSheet.COLOR.greyColor)
                  ],
                ),
                hinttext: "Packing",
                onTap: () => {selected(EditProductDetailStates.Packing)},
              ),
              Container(
                decoration: BoxDecoration(color: styleSheet.COLOR.whiteColor),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 30,
                      decoration:
                          BoxDecoration(color: styleSheet.COLOR.redColor),
                    ),
                    styleSheet.appConfig.addWidth(20),
                    Expanded(
                        child:
                            Text("PCS", style: styleSheet.TEXT_THEME.fs14Bold)),
                    Expanded(
                        flex: 2,
                        child: Row(children: [
                          Expanded(
                              child: Text("x1",
                                  style: styleSheet.TEXT_THEME.fs12Bold
                                      .copyWith(
                                          color: styleSheet.COLOR.greyColor))),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: styleSheet.COLOR.blueColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "1.0",
                              style: styleSheet.TEXT_THEME.fs12Bold
                                  .copyWith(color: styleSheet.COLOR.whiteColor),
                            ),
                          )
                        ]))
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );

    return Obx(() {
      switch (selected.value) {
        case EditProductDetailStates.Brand:
          return Expanded(
            child: EditProductAddBrandView(
                product: ProductModel("456789", "Default", "", "", "", "", ""),
                onPressedBack: onPressedBack),
          );
        case EditProductDetailStates.Category:
          return Expanded(
            child: EditProductAddCategoryView(
                product: ProductModel("456789", "Default", "", "", "", "", ""),
                onPressedBack: onPressedBack),
          );
        case EditProductDetailStates.Packing:
          return Expanded(
            child: EditProductAddPackingView(
                product: ProductModel("456789", "Default", "", "", "", "", ""),
                onPressedBack: onPressedBack),
          );
        default:
          return defaultView;
      }
    });
  }

  void onPressedBack() {
    selected(EditProductDetailStates.Default);
  }
}
