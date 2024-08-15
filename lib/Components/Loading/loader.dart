import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/main.dart';

class ShowLoading extends StatefulWidget {
  const ShowLoading({super.key});

  @override
  _ShowLoadingState createState() => _ShowLoadingState();
}

class _ShowLoadingState extends State<ShowLoading> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        alignment: Alignment.center,
        height: 8,
        width: styleSheet.appConfig.getScreenWidth(context) * 0.5,
        decoration: BoxDecoration(
            color: styleSheet.COLOR.whiteColor,
            boxShadow: styleSheet.DECORATION.primaryShadow),
        child: SizedBox(
          height: 8,
          child: LinearProgressIndicator(
            backgroundColor: styleSheet.COLOR.whiteColor,
            valueColor:
                AlwaysStoppedAnimation<Color>(styleSheet.COLOR.primaryColor),
          ),
        ),
      ),
    );
  }
}
