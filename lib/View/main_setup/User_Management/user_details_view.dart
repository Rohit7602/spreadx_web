import 'dart:io';

import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Image_Picker/image_picker.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/View/main_setup/User_Management/user_profile.dart';
import 'package:spreadx_web/main.dart';

class UserDetailsView extends StatefulWidget {
  UserModel user;
  void Function() onPressedBack;

  UserDetailsView({required this.user, required this.onPressedBack, super.key});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  File? pickedFile;

  RxString selectedView = RxString("defaultView");

  @override
  Widget build(BuildContext context) {
    var defaultView = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: widget.onPressedBack,
                  icon: const Icon(Icons.arrow_back)),
            ],
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: styleSheet.COLOR.productCardGreyColor,
                ),
                child: pickedFile != null
                    ? Image.file(
                        File(pickedFile!.path),
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.person,
                        size: 100,
                        color: styleSheet.COLOR.greyColor,
                      ),
              ),
              GestureDetector(
                onTap: () async {
                  pickedFile = await ImageController.pickImageByGallery();
                  setState(() {});
                },
                child: Container(
                  padding: styleSheet.DECORATION.PADDING_5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: styleSheet.COLOR.primaryColor),
                  child: Icon(
                    Icons.edit,
                    color: styleSheet.COLOR.whiteColor,
                  ),
                ),
              ),
            ],
          ),
          styleSheet.appConfig.addHeight(20),
          Container(
            padding: styleSheet.DECORATION.PADDING_10,
            decoration: BoxDecoration(
                color: styleSheet.COLOR.bgLightBlueColor2,
                borderRadius: styleSheet.DECORATION.RADIUS_5),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(styleSheet.icons.user,
                        height: 24,
                        width: 24,
                        color: styleSheet.COLOR.primaryColor),
                    styleSheet.appConfig.addWidth(20),
                    Expanded(
                        child: Text(
                            widget.user.name.isEmpty ? "NA" : widget.user.name,
                            style: styleSheet.TEXT_THEME.fs14Bold)),
                    Container(
                      padding: styleSheet.DECORATION.PADDING_8,
                      decoration: BoxDecoration(
                          color: styleSheet.COLOR.productCardGreyColor,
                          borderRadius: styleSheet.DECORATION.RADIUS_10),
                      child: Text(
                          widget.user.role.isEmpty ? "NA" : widget.user.role,
                          style: styleSheet.TEXT_THEME.fs12Bold
                              .copyWith(color: styleSheet.COLOR.primaryColor)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(children: [
                        SizedBox(
                            width: 50,
                            child: Text("Phone",
                                style: styleSheet.TEXT_THEME.fs14Bold)),
                        styleSheet.appConfig.addWidth(10),
                        Expanded(
                            flex: 2,
                            child: Text(
                                widget.user.phone.isEmpty
                                    ? "NA"
                                    : widget.user.phone,
                                style: styleSheet.TEXT_THEME.fs12Medium)),
                      ]),
                      styleSheet.appConfig.addHeight(2),
                      Row(children: [
                        SizedBox(
                            width: 50,
                            child: Text("Email",
                                style: styleSheet.TEXT_THEME.fs14Bold)),
                        styleSheet.appConfig.addWidth(10),
                        Expanded(
                            flex: 2,
                            child: Text(
                                widget.user.email.isEmpty
                                    ? "NA"
                                    : widget.user.email,
                                style: styleSheet.TEXT_THEME.fs12Medium)),
                      ]),
                      styleSheet.appConfig.addHeight(2),
                      Row(children: [
                        SizedBox(
                            width: 50,
                            child: Text("Status",
                                style: styleSheet.TEXT_THEME.fs14Bold)),
                        styleSheet.appConfig.addWidth(10),
                        Expanded(
                            flex: 2,
                            child: Text(
                                widget.user.status.isEmpty
                                    ? "NA"
                                    : widget.user.status,
                                style: styleSheet.TEXT_THEME.fs12Medium)),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          styleSheet.appConfig.addHeight(40),
          InkWell(
              onTap: () {
                selectedView("userProfile");
              },
              child: _CustomTileForMenus(icon: Icons.person, title: "Profile")),
          styleSheet.appConfig.addHeight(8),
          _CustomTileForMenus(icon: Icons.credit_card_sharp, title: "Cards"),
          styleSheet.appConfig.addHeight(8),
          _CustomTileForMenus(icon: Icons.lock, title: "PINS"),
          styleSheet.appConfig.addHeight(8),
          _CustomTileForMenus(icon: Icons.restore, title: "Activity"),
        ],
      ).paddingAll(20),
    );

    return Obx(() {
      if (selectedView.value == "userProfile") {
        return UserProfileView(
          onPressedBack: () {
            selectedView.value = "defaultView";
            setState(() {});
          },
        );
      } else {
        return defaultView;
      }
    });
  }
}

class _CustomTileForMenus extends StatelessWidget {
  IconData icon;
  String title;
  _CustomTileForMenus({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: styleSheet.DECORATION.RADIUS_5,
          color: styleSheet.COLOR.bgLightBlueColor2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: styleSheet.COLOR.primaryColor,
              ),
              styleSheet.appConfig.addWidth(50),
              Text(title),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: styleSheet.COLOR.primaryColor,
          )
        ],
      ),
    );
  }
}
