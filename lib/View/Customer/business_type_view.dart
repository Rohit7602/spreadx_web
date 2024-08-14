import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/add_customer_controller.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class BusinessTypeView extends StatelessWidget {
  void Function(String) onTap;
  BusinessTypeView({required this.onTap, super.key});

  var controller = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          children: [
            PrimaryTextFormField(
              prefixIcon: const Icon(Icons.search),
              onTap: () async {},
              hinttext: "Search",
            ),
            styleSheet.appConfig.addHeight(20),
            GridView.builder(
                shrinkWrap: true,
                itemCount: LocalData.businessTypeList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 6,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      onTap(LocalData.businessTypeList[i]);
                    },
                    borderRadius: styleSheet.DECORATION.RADIUS_10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: styleSheet.DECORATION.RADIUS_10,
                          border: Border.all(
                              color: styleSheet.COLOR.lightGreyColor)),
                      child: Text(
                        LocalData.businessTypeList[i],
                        style: styleSheet.TEXT_THEME.fs16Bold,
                      ),
                    ),
                  );
                })
          ],
        ).paddingAll(20),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: styleSheet.DECORATION.RADIUS_20),
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: 300,
                          maxHeight:
                              styleSheet.appConfig.getScreenHeight(context) *
                                  0.9),
                      width: styleSheet.appConfig.getScreenWidth(context) * 0.5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          styleSheet.appConfig.addHeight(20),
                          Text(
                            "Add New Business Type",
                            style: styleSheet.TEXT_THEME.fs16Bold,
                          ),
                          styleSheet.appConfig.addHeight(40),
                          SecondaryTextFormField(
                            onTap: () => openVirtualKeyboard(),
                            hinttext: "Business Type",
                          ),
                          styleSheet.appConfig.addHeight(30),
                          DrawerButtonView(
                            btnName: "Add Business Type",
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ).paddingAll(20),
                    ),
                  );
                });
          },
          child: Container(
            height: 50,
            width: 50,
            margin: styleSheet.DECORATION.PADDING_20,
            decoration: BoxDecoration(
                borderRadius: styleSheet.DECORATION.RADIUS_10,
                color: styleSheet.COLOR.primaryColor),
            child: Icon(
              Icons.add,
              color: styleSheet.COLOR.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
