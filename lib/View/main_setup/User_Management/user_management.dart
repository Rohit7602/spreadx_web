import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/users_controller.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/main.dart';

class UserManagementView extends StatelessWidget {
  const UserManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UsersController>();

    return Scaffold(
      appBar: CustomAppbarView(title: "Users"),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, i) =>
                    styleSheet.appConfig.addHeight(20),
                shrinkWrap: true,
                padding: styleSheet.DECORATION.PADDING_20,
                itemCount: controller.users.length,
                itemBuilder: (context, i) {
                  final user = controller.users[i];
                  return Container(
                    padding: styleSheet.DECORATION.PADDING_10,
                    decoration: BoxDecoration(
                        color: styleSheet.COLOR.lightGreyColor,
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
                                    user.name.isEmpty ? "NA" : user.name,
                                    style: styleSheet.TEXT_THEME.fs14Bold)),
                            Container(
                              padding: styleSheet.DECORATION.PADDING_8,
                              decoration: BoxDecoration(
                                  color: styleSheet.COLOR.productCardGreyColor,
                                  borderRadius:
                                      styleSheet.DECORATION.RADIUS_10),
                              child: Text(user.role.isEmpty ? "NA" : user.role,
                                  style: styleSheet.TEXT_THEME.fs12Bold
                                      .copyWith(
                                          color:
                                              styleSheet.COLOR.primaryColor)),
                            ),
                          ],
                        ),
                        ExpandChild(
                            indicatorPadding: EdgeInsets.zero,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                children: [
                                  Row(children: [
                                    SizedBox(
                                        width: 50,
                                        child: Text("Phone",
                                            style: styleSheet
                                                .TEXT_THEME.fs14Bold)),
                                    styleSheet.appConfig.addWidth(10),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                            user.phone.isEmpty
                                                ? "NA"
                                                : user.phone,
                                            style: styleSheet
                                                .TEXT_THEME.fs12Medium)),
                                  ]),
                                  styleSheet.appConfig.addHeight(2),
                                  Row(children: [
                                    SizedBox(
                                        width: 50,
                                        child: Text("Email",
                                            style: styleSheet
                                                .TEXT_THEME.fs14Bold)),
                                    styleSheet.appConfig.addWidth(10),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                            user.email.isEmpty
                                                ? "NA"
                                                : user.email,
                                            style: styleSheet
                                                .TEXT_THEME.fs12Medium)),
                                  ]),
                                  styleSheet.appConfig.addHeight(2),
                                  Row(children: [
                                    SizedBox(
                                        width: 50,
                                        child: Text("Status",
                                            style: styleSheet
                                                .TEXT_THEME.fs14Bold)),
                                    styleSheet.appConfig.addWidth(10),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                            user.status.isEmpty
                                                ? "NA"
                                                : user.status,
                                            style: styleSheet
                                                .TEXT_THEME.fs12Medium)),
                                  ]),
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: styleSheet.DECORATION.PADDING_20,
            child: PrimaryBtnView(
                btnName: "Add New User",
                onPressed: () {
                  context.go(MyRoute.userProfileView);
                },
                isExpanded: true),
          )
        ],
      ),
    );
  }
}
