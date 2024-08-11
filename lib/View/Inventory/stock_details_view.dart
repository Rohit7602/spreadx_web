import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/main.dart';

class StockDetailsView extends StatelessWidget {
  const StockDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "default",
          style: styleSheet.TEXT_THEME.fs16Bold
              .copyWith(color: styleSheet.COLOR.blackColor),
        ),
        styleSheet.appConfig.addHeight(4),
        Text(
          ": 29.0",
          style: styleSheet.TEXT_THEME.fs16Bold
              .copyWith(color: styleSheet.COLOR.blackColor),
        ),
        styleSheet.appConfig.addHeight(15),
        Row(
          children: [
            Text(
              "As Of:",
              style: styleSheet.TEXT_THEME.fs16Bold
                  .copyWith(color: styleSheet.COLOR.blackColor),
            ),
            styleSheet.appConfig.addWidth(10),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(const Size(130, 37)),
                    backgroundColor:
                        WidgetStateProperty.all(styleSheet.COLOR.primaryColor),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: styleSheet.DECORATION.RADIUS_50))),
                onPressed: () {},
                child: const Text("Select Date"))
          ],
        ),
        styleSheet.appConfig.addHeight(30),
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, i) => styleSheet.appConfig.addHeight(10),
          itemCount: 3,
          itemBuilder: (context, i) {
            return Container(
              padding: styleSheet.DECORATION.PADDING_10,
              decoration: BoxDecoration(
                  color: styleSheet.COLOR.bgLightBlueColor2,
                  borderRadius: styleSheet.DECORATION.RADIUS_5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        styleSheet.icons.arrowIcon,
                      ),
                      styleSheet.appConfig.addWidth(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Purchase",
                            style: styleSheet.TEXT_THEME.fs16Bold,
                          ),
                          Text(
                            "#PIN7698",
                            style: styleSheet.TEXT_THEME.fs14Bold
                                .copyWith(color: styleSheet.COLOR.blackColor),
                          ),
                          Text(
                            "Stock: 27.0",
                            style: styleSheet.TEXT_THEME.fs14Bold
                                .copyWith(color: styleSheet.COLOR.blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "AED 0.00",
                        style: styleSheet.TEXT_THEME.fs16Bold,
                      ),
                      Text(
                        DateTime.now().toString(),
                        style: styleSheet.TEXT_THEME.fs14Bold
                            .copyWith(color: styleSheet.COLOR.blackColor),
                      ),
                      Text(
                        "PCS: 12.0+",
                        style: styleSheet.TEXT_THEME.fs14Bold
                            .copyWith(color: styleSheet.COLOR.darkGreenColor2),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    ).paddingSymmetric(horizontal: 20, vertical: 30);
  }
}
