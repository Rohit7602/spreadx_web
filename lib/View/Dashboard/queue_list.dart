// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class QueueListView extends StatelessWidget {
  Function(String) backBtn;
  QueueListView({required this.backBtn, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: styleSheet.DECORATION.PADDING_5,
      color: styleSheet.COLOR.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                backBtn("");
              },
              icon: const Icon(Icons.arrow_back)),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (context, i) =>
                styleSheet.appConfig.addHeight(10),
            itemBuilder: (context, i) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: styleSheet.COLOR.keyboardBtnColor,
                      borderRadius: styleSheet.DECORATION.RADIUS_5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.shopping_cart_outlined),
                            styleSheet.appConfig.addWidth(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "#SO4433001",
                                  style: styleSheet.TEXT_THEME.fs14Bold,
                                ),
                                styleSheet.appConfig.addHeight(2),
                                Text(
                                  "Items 1",
                                  style: styleSheet.TEXT_THEME.fs12Medium,
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "53.0",
                          style: styleSheet.TEXT_THEME.fs14Bold,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: styleSheet.DECORATION.PADDING_2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: styleSheet.COLOR.redColor,
                      ),
                      child: Icon(
                        Icons.close,
                        color: styleSheet.COLOR.whiteColor,
                        size: 15,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
