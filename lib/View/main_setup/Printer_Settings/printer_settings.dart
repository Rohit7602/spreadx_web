import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/main.dart';

class PrinterSettings extends StatelessWidget {
  final void Function()? onPressedBack;
  PrinterSettings({super.key, this.onPressedBack});

  final List<Map<String, dynamic>> data = [
    {"id": "456789i", "icon": styleSheet.icons.pos, "title": "POS"},
    {"id": "98765h", "icon": styleSheet.icons.bluetooth, "title": "Bluetooth"},
    {"id": "23457kj", "icon": styleSheet.icons.phone, "title": "Inbuilt"},
    {"id": "098765hu", "icon": styleSheet.icons.printer, "title": "A5"},
    {"id": "srt096", "icon": styleSheet.icons.m2, "title": "M2"},
  ];

  final Rx<String> active = "456789i".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: CustomAppbarView(title: "Printer Settings"),
        body: ListView(
      padding: styleSheet.DECORATION.PADDING_20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: onPressedBack,
                icon: const Icon(Icons.arrow_back_outlined)),
            Text("Default Printer",
                style: styleSheet.TEXT_THEME.fs16Bold
                    .copyWith(color: styleSheet.COLOR.primaryColor)),
          ],
        ),
        styleSheet.appConfig.addHeight(5),
        GridView.builder(
            padding: styleSheet.DECORATION.PADDING_10,
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20),
            itemBuilder: (context, i) {
              final printer = data[i];
              return GestureDetector(
                onTap: () {
                  active(printer['id']);
                },
                child: Stack(
                  children: [
                    Container(
                      padding: styleSheet.DECORATION.PADDING_10,
                      decoration:
                          BoxDecoration(color: styleSheet.COLOR.lightGreyColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AspectRatio(
                              aspectRatio: 1.4,
                              child: Image.asset(printer['icon'],
                                  fit: BoxFit.fitHeight)),
                          styleSheet.appConfig.addHeight(5),
                          Text(printer['title'],
                              style: styleSheet.TEXT_THEME.fs20Bold),
                          Obx(() => active.value == printer['id']
                              ? styleSheet.appConfig.addHeight(2)
                              : const SizedBox()),
                          Obx(
                            () => active.value == printer['id']
                                ? Text("Active",
                                    style: styleSheet.TEXT_THEME.fs12Bold
                                        .copyWith(
                                            color: styleSheet.COLOR.greenColor))
                                : const SizedBox(),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        child: Obx(
                          () => CircleAvatar(
                            radius: 8,
                            backgroundColor: active.value == printer['id']
                                ? styleSheet.COLOR.greenColor
                                : styleSheet.COLOR.productCardGreyColor,
                          ),
                        ))
                  ],
                ),
              );
            }),
      ],
    ));
  }
}
