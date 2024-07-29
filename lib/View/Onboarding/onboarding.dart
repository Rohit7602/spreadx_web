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
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxHeight: view.carousolMaxHeight),
          width: view.carousolMaxWidth,
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: styleSheet.DECORATION.RADIUS_20,
              boxShadow: styleSheet.DECORATION.primaryShadow,
              color: styleSheet.COLOR.whiteColor),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (val, i) {
                      setState(() {
                        currentIndex = val;
                      });
                    },
                    aspectRatio: 1,
                    viewportFraction: 1),
                items: onboardList.map((e) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        styleSheet.images.appLogo,
                      ),
                      styleSheet.appConfig.addHeight(10),
                      Image.asset(
                        e.image,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      styleSheet.appConfig.addHeight(40),
                      Text(
                        e.title,
                        textAlign: TextAlign.center,
                        style: styleSheet.TEXT_THEME.fs16Medium.copyWith(
                            letterSpacing: 1,
                            color: styleSheet.COLOR.greyColor),
                      ).paddingSymmetric(horizontal: 40),
                    ],
                  );
                }).toList(),
              ),
              (currentIndex + 1) == onboardList.length
                  ? PrimaryBtnView(
                      btnName: "Get Started",
                      onPressed: () {
                        context.go(MyRoute.login);
                      })
                  : Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              onboardList.length,
                              (i) => Container(
                                margin: const EdgeInsets.only(right: 8),
                                height: 10,
                                width: currentIndex == i ? 35 : 12,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: styleSheet.COLOR.primaryColor,
                                        width: 2),
                                    color: currentIndex == i
                                        ? styleSheet.COLOR.primaryColor
                                        : styleSheet.COLOR.whiteColor,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ],
                        ),
                        styleSheet.appConfig.addHeight(20),
                        TextButton(
                            onPressed: () {
                              context.go(MyRoute.login);
                            },
                            child: Text(
                              "Skip",
                              style: styleSheet.TEXT_THEME.fs14Bold.copyWith(
                                  color: styleSheet.COLOR.primaryColor),
                            ))
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
