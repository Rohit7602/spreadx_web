import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';
import 'package:spreadx_web/web_config.dart';

class ProductWiseReportView extends StatelessWidget {
  const ProductWiseReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return

        // Scaffold(
        //   appBar: CustomAppbarView(
        //     title: "Product Sales Report",
        //   ),
        //   body:

        Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
            itemBuilder: (context, i) {
              return Container(
                decoration: BoxDecoration(
                  color: styleSheet.COLOR.blueColor.withOpacity(0.06),
                  borderRadius: styleSheet.DECORATION.RADIUS_10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Today",
                      style: styleSheet.TEXT_THEME.fs14Bold,
                    ),
                    Text(
                      "Duration",
                      style: styleSheet.TEXT_THEME.fs14Normal,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        styleSheet.appConfig.addWidth(20),
        Flexible(
          flex: 2,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, i) =>
                styleSheet.appConfig.addHeight(12),
            itemCount: 4,
            itemBuilder: (context, i) {
              return Container(
                padding: styleSheet.DECORATION.PADDING_10,
                decoration: BoxDecoration(
                  color: styleSheet.COLOR.lightGreyColor,
                  borderRadius: styleSheet.DECORATION.RADIUS_5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          WebConfig.demoImage,
                          height: 40,
                          width: 40,
                        ),
                        styleSheet.appConfig.addWidth(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fine Tisshue box2",
                              style: styleSheet.TEXT_THEME.fs14Bold,
                            ),
                            styleSheet.appConfig.addHeight(3),
                            Text(
                              "Quantity 5.0",
                              style: styleSheet.TEXT_THEME.fs14Medium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "AED 190.90",
                      style: styleSheet.TEXT_THEME.fs14Bold,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ).paddingAll(20);
    // );
  }
}
