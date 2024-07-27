// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/main.dart';

class CustomAppbarView extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool showLeading;
  Widget? actions;

  CustomAppbarView({required this.title, this.showLeading = true, super.key});

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);
    return AppBar(
      backgroundColor: styleSheet.COLOR.primaryColor,
      elevation: 0,
      leadingWidth: showLeading ? 50 : 0,
      leading: showLeading
          ? IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: styleSheet.COLOR.whiteColor,
                size: view.iconSize,
              ),
            )
          : const SizedBox(),
      title: Text(
        title,
        style: styleSheet.TEXT_THEME.fs16Medium
            .copyWith(color: styleSheet.COLOR.whiteColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
