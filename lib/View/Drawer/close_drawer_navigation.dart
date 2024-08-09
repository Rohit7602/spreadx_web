import 'package:flutter/material.dart';
import 'package:spreadx_web/main.dart';

class CloseDrawerNavigationView extends StatelessWidget {
  const CloseDrawerNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: styleSheet.DECORATION.PADDING_20,
      decoration: BoxDecoration(
        borderRadius: styleSheet.DECORATION.RADIUS_10,
        color: styleSheet.COLOR.whiteColor,
      ),
      child: Column(
        children: [
          Text("ACTUAL IN DRAWER"),
        ],
      ),
    );
  }
}
