import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class EnterManuallySingleProductView extends StatefulWidget {
  final void Function()? onPressedBack;
  const EnterManuallySingleProductView(
      {super.key, required this.onPressedBack});

  @override
  State<EnterManuallySingleProductView> createState() =>
      _EnterManuallySingleProductViewState();
}

class _EnterManuallySingleProductViewState
    extends State<EnterManuallySingleProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: styleSheet.appConfig.getScreenWidth(context),
              height: styleSheet.appConfig.getScreenHeight(context),
              child: Padding(
                  padding: styleSheet.DECORATION.PADDING_20,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: widget.onPressedBack,
                            icon: const Icon(Icons.arrow_back_outlined)),
                      ),
                      const Expanded(child: Column())
                    ],
                  )))),
    );
  }
}
