// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Dialog/queue_remove_dialog.dart';
import 'package:spreadx_web/main.dart';

class QueueListView extends StatefulWidget {
  Function(String) backBtn;
  QueueListView({required this.backBtn, super.key});

  @override
  State<QueueListView> createState() => _QueueListViewState();
}

class _QueueListViewState extends State<QueueListView> {
  var queueList = Get.find<ProductController>();

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
                widget.backBtn("");
              },
              icon: const Icon(Icons.arrow_back)),
          queueList.queueList.isEmpty
              ? const Center(child: Text("Queue List is Empty"))
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: queueList.queueList.length,
                  separatorBuilder: (context, i) =>
                      styleSheet.appConfig.addHeight(10),
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        queueList.addProducts(queueList.queueList[i]);
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "#SO4433001",
                                          style: styleSheet.TEXT_THEME.fs14Bold,
                                        ),
                                        styleSheet.appConfig.addHeight(2),
                                        Text(
                                          "Items: ${queueList.queueList[i].qty}",
                                          style:
                                              styleSheet.TEXT_THEME.fs12Medium,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "${queueList.queueList[i].price}.0",
                                  style: styleSheet.TEXT_THEME.fs14Bold,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return QueueRemoveDialog(
                                      onTap: () {
                                        queueList.queueList.removeAt(i);
                                        Navigator.of(context).pop();
                                        setState(() {});
                                      },
                                    );
                                  });
                            },
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
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
