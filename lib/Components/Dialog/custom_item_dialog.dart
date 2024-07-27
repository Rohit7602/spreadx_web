import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class CustomItemDialog extends StatelessWidget {
  const CustomItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
      title: "Custom Item",
      child: Column(
        children: [
          const PrimaryTextFormField(
            hinttext: "AED 0.000",
          ),
          styleSheet.appConfig.addHeight(30),
          TextButton.icon(
              icon: const Icon(Icons.movie_edit),
              onPressed: () {},
              label: const Text("Custom Item")),
          GridView.builder(
            padding: styleSheet.DECORATION.PADDING_20,
            itemCount: LocalData.keyboardBtnList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 16 / 4),
            itemBuilder: (context, i) {
              var btn = LocalData.keyboardBtnList[i];
              return SecondaryButtonView(
                  btnColor: styleSheet.COLOR.secondaryColor,
                  btnName: btn.btnName,
                  onPressed: () {});
            },
          ),
          styleSheet.appConfig.addHeight(10),
          PrimaryBtnView(btnName: "Add To Cart", onPressed: () {}),
          styleSheet.appConfig.addHeight(10),
        ],
      ),
    );
  }
}
