import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/main.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  List<String> btnList = ["All", "Today", "Week", "Month"];

  int btnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(btnList.length, (index) {
                return InkWell(
                  onTap: () {
                    btnIndex = index;
                    setState(() {});
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      width: styleSheet.appConfig.getScreenWidth(context),
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: styleSheet.DECORATION.RADIUS_5,
                          border: Border.all(
                              color: styleSheet.COLOR.lightGreyColor),
                          color: btnIndex == index
                              ? styleSheet.COLOR.primaryColor
                              : styleSheet.COLOR.whiteColor),
                      child: Text(
                        btnList[index],
                        style: styleSheet.TEXT_THEME.fs16Medium.copyWith(
                            color: btnIndex == index
                                ? styleSheet.COLOR.whiteColor
                                : styleSheet.COLOR.blackColor),
                      )),
                );
              })
            ],
          ),
        ),
        styleSheet.appConfig.addWidth(10),
        Flexible(
            flex: 2,
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, i) =>
                  styleSheet.appConfig.addHeight(10),
              itemCount: 3,
              itemBuilder: (context, i) {
                return ListTile(
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
            ))
      ],
    ).paddingSymmetric(horizontal: 15, vertical: 10);
  }
}
