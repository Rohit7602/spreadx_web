import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/main.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              padding: styleSheet.DECORATION.PADDING_10,
              decoration: BoxDecoration(
                  borderRadius: styleSheet.DECORATION.RADIUS_5,
                  color: styleSheet.COLOR.bgColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        styleSheet.icons.supplierIcon,
                        color: styleSheet.COLOR.primaryColor,
                      ),
                      styleSheet.appConfig.addWidth(20),
                      Text(
                        "default",
                        style: styleSheet.TEXT_THEME.fs14Bold,
                      ),
                    ],
                  ),
                  Container(
                    padding: styleSheet.DECORATION.PADDING_10,
                    decoration: BoxDecoration(
                      color: styleSheet.COLOR.bgLightBlueColor2,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: styleSheet.COLOR.blackColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ).paddingAll(20),
        DrawerButtonView(
                btnName: "Add New Supplier",
                onPressed: () {
                  // context.go(MyRoute.addNewSupplier);
                })
            .paddingAll(15)
      ],
    );
  }
}
