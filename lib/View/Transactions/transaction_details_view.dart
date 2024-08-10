import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class TransactionDetailsView extends StatefulWidget {
  final void Function()? onPressedBack;
  const TransactionDetailsView({super.key, required this.onPressedBack});

  @override
  State<TransactionDetailsView> createState() => _TransactionDetailsViewState();
}

class _TransactionDetailsViewState extends State<TransactionDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SizedBox(
         width: styleSheet.appConfig.getScreenWidth(context),
         height: styleSheet.appConfig.getScreenHeight(context),
         child: Padding(padding: styleSheet.DECORATION.PADDING_20),
      )),
    );
  }
}