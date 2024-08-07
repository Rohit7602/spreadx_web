import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class MainSetupButton extends StatelessWidget {
  final Function ontap;
  final String title;
  const MainSetupButton({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
            color: styleSheet.COLOR.primaryColor),
        child: Text(
          title,
          style: styleSheet.TEXT_THEME.fs16Medium
              .copyWith(color: styleSheet.COLOR.whiteColor),
        ),
      ),
    );
  }
}
