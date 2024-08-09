import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class AddProductBtn extends StatelessWidget {
  final void Function() ontap;
  final String title;
  final IconData icon;
  final bool disable;
  const AddProductBtn(
      {super.key,
      required this.ontap,
      required this.title,
      required this.icon,
      this.disable = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disable
          ? null
          : () {
              ontap();
            },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        width: styleSheet.appConfig.getScreenWidth(context),
        height: 55,
        decoration: BoxDecoration(
            borderRadius: styleSheet.DECORATION.RADIUS_5,
            border: Border.all(color: styleSheet.COLOR.lightGreyColor),
            color: disable
                ? styleSheet.COLOR.fieldGreyColor
                : styleSheet.COLOR.primaryColor),
        child: Row(
          children: [
            styleSheet.appConfig.addWidth(10),
            Icon(icon,
                color: disable
                    ? styleSheet.COLOR.greyColor
                    : styleSheet.COLOR.whiteColor),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: styleSheet.TEXT_THEME.fs16Medium.copyWith(
                    color: disable
                        ? styleSheet.COLOR.greyColor
                        : styleSheet.COLOR.whiteColor),
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
