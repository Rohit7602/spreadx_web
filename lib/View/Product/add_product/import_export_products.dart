import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Image_Picker/image_picker.dart';
import 'package:spreadx_web/main.dart';

class ImportExportProducts extends StatefulWidget {
  final void Function()? onPressedBack;
  const ImportExportProducts({super.key, required this.onPressedBack});

  @override
  State<ImportExportProducts> createState() => _ImportExportProductsState();
}

class _ImportExportProductsState extends State<ImportExportProducts> {
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
                          child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 300,
                                padding: styleSheet.DECORATION.PADDING_15,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        styleSheet.DECORATION.RADIUS_5,
                                    border: Border.all(
                                        color: styleSheet.COLOR.greyColor
                                            .withOpacity(0.5))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.download,
                                        size: 80,
                                        color: styleSheet.COLOR.greyColor),
                                    styleSheet.appConfig.addHeight(20),
                                    Text(
                                        "Download products template excel file (.xlsx) to be filled with products records and uploaded.",
                                        textAlign: TextAlign.center,
                                        style: styleSheet.TEXT_THEME.fs12Bold
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.greyColor)),
                                    const Spacer(),
                                    PrimaryBtnView(
                                        btnName: "Download Template",
                                        isExpanded: true,
                                        onPressed: () {})
                                  ],
                                ),
                              )
                            ],
                          )),
                          styleSheet.appConfig.addWidth(15),

                          /// *********************************************** Section Two **************************
                          /// **************************************************************************************
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 300,
                                padding: styleSheet.DECORATION.PADDING_15,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        styleSheet.DECORATION.RADIUS_5,
                                    border: Border.all(
                                        color: styleSheet.COLOR.greyColor
                                            .withOpacity(0.5))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.upload,
                                        size: 80,
                                        color: styleSheet.COLOR.greyColor),
                                    styleSheet.appConfig.addHeight(20),
                                    Text(
                                        "Upload already filled excel file (.xlsx). (Note that the uploaded file should be as the same template as the downloaded file.)",
                                        textAlign: TextAlign.center,
                                        style: styleSheet.TEXT_THEME.fs12Bold
                                            .copyWith(
                                                color: styleSheet
                                                    .COLOR.greyColor)),
                                    styleSheet.appConfig.addHeight(20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text("Products file (.xlsx)",
                                                  style: styleSheet
                                                      .TEXT_THEME.fs10Bold
                                                      .copyWith(
                                                          color: styleSheet
                                                              .COLOR
                                                              .greyColor)),
                                              styleSheet.appConfig.addHeight(2),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextButton(
                                                        onPressed: () async {
                                                          await ImageController
                                                              .pickImageByGallery();
                                                          setState(() {});
                                                        },
                                                        style: TextButton.styleFrom(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 15),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                side: BorderSide(
                                                                    color: styleSheet
                                                                        .COLOR
                                                                        .greyColor
                                                                        .withOpacity(
                                                                            0.5)))),
                                                        child: const Text(
                                                            "Choose Products File")),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        styleSheet.appConfig.addWidth(5),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text("Images file (.zip)",
                                                  style: styleSheet
                                                      .TEXT_THEME.fs10Bold
                                                      .copyWith(
                                                          color: styleSheet
                                                              .COLOR
                                                              .greyColor)),
                                              styleSheet.appConfig.addHeight(2),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextButton(
                                                        onPressed: () async {
                                                          await ImageController
                                                              .pickImageByGallery();
                                                          setState(() {});
                                                        },
                                                        style: TextButton.styleFrom(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 15),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                side: BorderSide(
                                                                    color: styleSheet
                                                                        .COLOR
                                                                        .greyColor
                                                                        .withOpacity(
                                                                            0.5)))),
                                                        child: const Text(
                                                            "Choose Images File")),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    styleSheet.appConfig.addHeight(10),
                                    PrimaryBtnView(
                                        btnName: "Upload Files",
                                        isExpanded: true,
                                        onPressed: () async {})
                                  ],
                                ),
                              )
                            ],
                          )),
                        ],
                      ))
                    ],
                  )))),
    );
  }
}
