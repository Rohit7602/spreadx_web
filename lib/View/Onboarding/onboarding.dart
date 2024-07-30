// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/main.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var onboardList = LocalData.listOfOnbaord;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final view = ResponsiveHandler().getResponsiveness(context);

    return Scaffold(
      backgroundColor: styleSheet.COLOR.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: styleSheet.COLOR.transparent,
        actions: [
          TextButton(
              onPressed: () {
                context.go(MyRoute.login);
              },
              child: Text(
                "Skip",
                style: styleSheet.TEXT_THEME.fs12Normal
                    .copyWith(color: styleSheet.COLOR.whiteColor),
              ))
        ],
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (val, i) {
              setState(() {
                currentIndex = val;
              });
            },
            // aspectRatio: 1.346,
            aspectRatio: 3,
            viewportFraction: 1,
          ),
          items: onboardList.map((e) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Image.asset(
                  e.image,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                styleSheet.appConfig.addHeight(40),
                Text(
                  e.title,
                  textAlign: TextAlign.center,
                  style: styleSheet.TEXT_THEME.fs16Normal.copyWith(
                      letterSpacing: 1, color: styleSheet.COLOR.whiteColor),
                ).paddingSymmetric(horizontal: 40),
              ],
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: styleSheet.appConfig.getScreenHeight(context) * 0.2,
        width: styleSheet.appConfig.getScreenWidth(context),
        decoration: BoxDecoration(
            color: styleSheet.COLOR.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onboardList.length,
              (i) => Container(
                margin: const EdgeInsets.only(right: 8),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: styleSheet.COLOR.primaryColor, width: 2),
                    color: currentIndex == i
                        ? styleSheet.COLOR.primaryColor
                        : styleSheet.COLOR.whiteColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
