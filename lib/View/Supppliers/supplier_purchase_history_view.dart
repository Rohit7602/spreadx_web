import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/main.dart';

class EditSupplierPurchaseHistoryView extends StatefulWidget {
  final void Function()? onPressedBack;
  const EditSupplierPurchaseHistoryView(
      {super.key, required this.onPressedBack});

  @override
  State<EditSupplierPurchaseHistoryView> createState() =>
      _EditSupplierPurchaseHistoryViewState();
}

class _EditSupplierPurchaseHistoryViewState
    extends State<EditSupplierPurchaseHistoryView> {
  List<String> btnList = ["All", "Today", "Week", "Month"];

  int btnIndex = 0;

  RxString selected = RxString("default");

  List<String> tabs = ["Paid", "Not Paid"];

  RxInt selectedTab = RxInt(0);

  @override
  Widget build(BuildContext context) {
    final defaultView = Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: widget.onPressedBack,
              icon: const Icon(Icons.arrow_back_outlined)),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(btnList.length, (index) {
                      return DrawerButtonView(
                          elevation: 0,
                          btnColor: btnIndex == index
                              ? styleSheet.COLOR.primaryColor
                              : styleSheet.COLOR.whiteColor,
                          txtColor: btnIndex == index
                              ? styleSheet.COLOR.whiteColor
                              : styleSheet.COLOR.blackColor,
                          btnName: btnList[index],
                          onPressed: () {
                            btnIndex = index;
                            setState(() {});
                          }).paddingOnly(bottom: 15);
                    })
                  ],
                ),
              ),
              styleSheet.appConfig.addWidth(10),
              Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(tabs.length, (i) {
                            return Obx(() => InkWell(
                                  onTap: () {
                                    selectedTab(i);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                          border: selectedTab.value == i
                                              ? Border(
                                                  bottom: BorderSide(
                                                      color: styleSheet
                                                          .COLOR.primaryColor,
                                                      width: 2))
                                              : null),
                                      child: Text(tabs[i],
                                          style: styleSheet.TEXT_THEME.fs14Bold
                                              .copyWith(
                                                  color: selectedTab.value == i
                                                      ? styleSheet
                                                          .COLOR.primaryColor
                                                      : styleSheet
                                                          .COLOR.blackColor
                                                          .withOpacity(0.6))),
                                    ),
                                  ),
                                ));
                          })
                        ],
                      ),
                      Divider(
                        height: 1,
                        color: styleSheet.COLOR.greyColor.withOpacity(0.5),
                      ),
                      styleSheet.appConfig.addHeight(20),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, i) =>
                              styleSheet.appConfig.addHeight(10),
                          itemCount: 3,
                          itemBuilder: (context, i) {
                            return ListTile(
                              onTap: () {
                                selected("details");
                              },
                              minLeadingWidth: 20,
                              visualDensity: const VisualDensity(vertical: -4),
                              tileColor: styleSheet.COLOR.fieldGreyColor,
                              leading: const Icon(Icons.contact_page_sharp),
                              title: Text(
                                "#IN234934",
                                style: styleSheet.TEXT_THEME.fs14Bold,
                              ),
                              subtitle: Text("31 Jul12:04 PM",
                                  style: styleSheet.TEXT_THEME.fs12Bold),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "AED 0.00",
                                    style: styleSheet.TEXT_THEME.fs12Bold,
                                  ),
                                  Text(
                                    "Pending: AED 0.00",
                                    style: styleSheet.TEXT_THEME.fs12Bold,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ))
            ],
          ).paddingSymmetric(horizontal: 15, vertical: 10),
        ),
      ],
    );

    return Obx(() {
      if (selected.value == "default") {
        return defaultView;
      }
      return defaultView;
    });
  }
}
