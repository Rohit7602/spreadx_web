import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/users_controller.dart';
import 'package:spreadx_web/Components/Dialog/barcode_dialog.dart';
import 'package:spreadx_web/main.dart';

class SecurityView extends StatelessWidget {
  final void Function()? onPressedBack;
  SecurityView({super.key, this.onPressedBack});

  final RxBool requirePassword = RxBool(false);

  RxString passcode = RxString("1234");

  var userController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: onPressedBack,
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Icon(Icons.security,
                    size: 500, color: styleSheet.COLOR.primaryColor),
              ),
              Expanded(
                  child: Column(
                children: [
                  SecurityListTile(
                      title: "Require Passcode",
                      subtitle:
                          "Ask for passcode in more sensitive places like settings management.",
                      onTap: () {
                        requirePassword(!(requirePassword.value));
                      },
                      trailing: Obx(() => Switch.adaptive(
                          value: requirePassword.value,
                          onChanged: (v) {
                            requirePassword(v);
                            userController.updateSecurityPD(v);
                          }))),
                  SecurityListTile(
                      title: "Passcode",
                      divider: false,
                      subtitle: "Maximum 4 digits.",
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return BarcodeDialog(hintText: "Passcode");
                            }).then((val) {
                          if (val != null) {
                            passcode(val);
                            userController.updatePassword(int.parse(val));
                          }
                        });
                      },
                      trailing: Obx(() => Text(passcode.value,
                          style: styleSheet.TEXT_THEME.fs16Bold.copyWith(
                              color: requirePassword.value
                                  ? styleSheet.COLOR.primaryColor
                                  : styleSheet.COLOR.greyColor))))
                ],
              ))
            ],
          )),
        ],
      )),
    );
  }
}

class SecurityListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailing;
  final Function? onTap;
  final bool divider;
  const SecurityListTile(
      {super.key,
      required this.title,
      this.subtitle = "",
      this.divider = true,
      required this.trailing,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap == null ? null : () => onTap!(),
          title: Text(title, style: styleSheet.TEXT_THEME.fs16Bold),
          subtitle: subtitle.isEmpty
              ? null
              : Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child:
                      Text(subtitle, style: styleSheet.TEXT_THEME.fs12Normal),
                ),
          trailing: trailing,
        ),
        divider
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                    color: styleSheet.COLOR.blackColor.withOpacity(0.4)),
              )
            : const SizedBox(),
      ],
    );
  }
}
