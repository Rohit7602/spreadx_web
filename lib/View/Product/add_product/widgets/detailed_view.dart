part of '../enter_manually_single.dart';

class _DetailedView extends StatefulWidget {
  void Function(EditProductDetailStates) onPressedBack;
  _DetailedView({required this.onPressedBack, super.key});

  @override
  State<_DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<_DetailedView> {
  final Rx<EditProductDetailStates> selected =
      Rx<EditProductDetailStates>(EditProductDetailStates.Default);

  File? pickedFile;

  final RxString _vatInclude = RxString("");

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ************************************ Section 1 ************************************
        /// ***********************************************************************************
        Flexible(
          flex: 1,
          child: Column(
            children: [
              pickedFile != null
                  ? Image.file(
                      File(
                        pickedFile!.path,
                      ),
                      fit: BoxFit.cover,
                    )
                  : DashedRect(
                      padding:
                          styleSheet.DECORATION.PADDING_5.copyWith(top: 10),
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
                                onPressed: () async {
                                  pickedFile = await ImageController
                                      .pickImageByGallery();
                                  setState(() {});
                                })
                          ],
                        ),
                      )),
              styleSheet.appConfig.addHeight(20),
              /** ************************** [Save Product] Button ******************* */
              PrimaryBtnView(
                  btnName: "Add New Product",
                  onPressed: () {},
                  isExpanded: true)
            ],
          ),
        ),
        styleSheet.appConfig.addWidth(15),

        /// ************************************ Section 2 ************************************
        /// ***********************************************************************************
        Flexible(
          flex: 1,
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
          ),
        ),
        styleSheet.appConfig.addWidth(10),

        /// ************************************ Section 3 ************************************
        /// ***********************************************************************************
        Flexible(
            flex: 1,
            child: Column(
              children: [
                Obx(() => PrimaryDropDown(
                    hint: "VAT Included ",
                    isExpanded: true,
                    dropdownValue: _vatInclude.value,
                    border: true,
                    items: const ["VAT Include", "VAT Exclude"],
                    value: (v) => _vatInclude(v))),
                styleSheet.appConfig.addHeight(20),
                SecondaryTextFormField(
                  label: true,
                  hinttext: "0.00",
                  onTap: () => openVirtualKeyboard(),
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
                      Icon(Icons.navigate_next,
                          color: styleSheet.COLOR.greyColor)
                    ],
                  ),
                  hinttext: "Brand",
                  onTap: () =>
                      {widget.onPressedBack(EditProductDetailStates.Brand)},
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
                      Icon(Icons.navigate_next,
                          color: styleSheet.COLOR.greyColor)
                    ],
                  ),
                  hinttext: "Category",
                  onTap: () =>
                      {widget.onPressedBack(EditProductDetailStates.Category)},
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
                      Icon(Icons.navigate_next,
                          color: styleSheet.COLOR.greyColor)
                    ],
                  ),
                  hinttext: "Packing",
                  onTap: () =>
                      {widget.onPressedBack(EditProductDetailStates.Packing)},
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
                          child: Text("PCS",
                              style: styleSheet.TEXT_THEME.fs14Bold)),
                      Expanded(
                          flex: 2,
                          child: Row(children: [
                            Expanded(
                                child: Text("x1",
                                    style: styleSheet.TEXT_THEME.fs12Bold
                                        .copyWith(
                                            color:
                                                styleSheet.COLOR.greyColor))),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  color: styleSheet.COLOR.blueColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "1.0",
                                style: styleSheet.TEXT_THEME.fs12Bold.copyWith(
                                    color: styleSheet.COLOR.whiteColor),
                              ),
                            )
                          ]))
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
