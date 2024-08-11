import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class ViewStockView extends StatelessWidget {
  void Function() onPressedBack;
  ViewStockView({required this.onPressedBack, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: styleSheet.DECORATION.PADDING_20.copyWith(top: 40),
      shrinkWrap: true,
      itemCount: 1,
      separatorBuilder: (context, i) => styleSheet.appConfig.addHeight(10),
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            onPressedBack();
          },
          child: Card(
            color: styleSheet.COLOR.fieldGreyColor,
            shape: RoundedRectangleBorder(
                borderRadius: styleSheet.DECORATION.RADIUS_10),
            elevation: 2,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                      color: styleSheet.COLOR.productCardGreyColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Text(
                    "64 x 36",
                    style: styleSheet.TEXT_THEME.fs14Medium
                        .copyWith(color: styleSheet.COLOR.greyColor),
                  ),
                ),
                styleSheet.appConfig.addWidth(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "default",
                      style: styleSheet.TEXT_THEME.fs16Bold
                          .copyWith(color: styleSheet.COLOR.blackColor),
                    ),
                    styleSheet.appConfig.addHeight(4),
                    const Text(
                      "default",
                    ),
                    styleSheet.appConfig.addHeight(2),
                    const Text(
                      ": 29.0",
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
