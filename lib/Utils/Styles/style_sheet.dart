import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._private();

  static final AppColors _instance = AppColors._private();

  factory AppColors() {
    return _instance;
  }
  Color primaryColor = const Color(0xff2C5E9E);
  Color primarybuttonColor = const Color(0xff00658D);
  Color secondaryColor = const Color(0xff2C5E9E).withOpacity(0.3);
  Color primaryDarkBGColor = const Color(0xff1E3D6B);
  Color keyboardBtnColor = const Color(0xffE6ECEC);

  Color blackColor = Colors.black;
  Color whiteColor = Colors.white;
  Color greyColor = Colors.grey;
  Color greenColor = Colors.green;
  Color darkGreenColor = const Color(0xff37913A);
  Color discountCardGrenColor = const Color(0xffC8E6CA);
  Color productCardGreyColor = const Color(0xffCCCCCC);
  Color lightGreyColor = Colors.black.withOpacity(0.04);
  Color fieldGreyColor = const Color(0xffEEEEEE);
  Color transparent = Colors.transparent;
  Color redColor = const Color(0xffb71c1c);
  Color blueColor = Colors.blue;
  Color lightBlueColor = const Color.fromARGB(255, 226, 247, 255);
  Color bgColor = const Color(0xffF5F5F5);
  Color bgLightBlueColor = const Color(0xffF6FEFF);
  Color bgLightBlueColor2 = const Color(0xffDFEEF5);
  Color cardColor = const Color(0xffEFEFEF);
}

class AppTextTheme {
  AppTextTheme._private();

  static final AppTextTheme _instance = AppTextTheme._private();

  factory AppTextTheme() {
    return _instance;
  }
  TextStyle fs14NormalPacifico =
      GoogleFonts.pacifico(fontSize: 14, fontWeight: FontWeight.w400);

  // NORMAL
  TextStyle fs10Normal =
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w400);
  TextStyle fs12Normal =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle fs14Normal =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle fs16Normal =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle fs18Normal =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  TextStyle fs20Normal =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle fs24Normal =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  TextStyle fs26Normal =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.w400);
  TextStyle fs28Normal =
      const TextStyle(fontSize: 28, fontWeight: FontWeight.w400);
  TextStyle fs34Normal =
      const TextStyle(fontSize: 34, fontWeight: FontWeight.w400);

  // MEDIUM
  TextStyle fs10Medium =
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w400);
  TextStyle fs12Medium =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  TextStyle fs14Medium =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle fs16Medium =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle fs18Medium =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  TextStyle fs20Medium =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  TextStyle fs24Medium =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
  TextStyle fs28Medium =
      const TextStyle(fontSize: 28, fontWeight: FontWeight.w500);
  TextStyle fs29Medium =
      const TextStyle(fontSize: 29, fontWeight: FontWeight.w500);

  //bold
  TextStyle fs10Bold =
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w700);
  TextStyle fs12Bold =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);
  // BOLD
  TextStyle fs14Bold =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
  TextStyle fs16Bold =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
  TextStyle fs18Bold =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  TextStyle fs20Bold =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  TextStyle fs22Bold =
      const TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  TextStyle fs24Bold =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  TextStyle fs26Bold =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.w700);
  TextStyle fs28Bold =
      const TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
}
