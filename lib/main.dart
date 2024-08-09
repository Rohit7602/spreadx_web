import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spreadx_web/Components/Controller/initial_binding.dart';
import 'package:spreadx_web/Responsive/responsive_abstract.dart';
import 'package:spreadx_web/Utils/Routes/route_config.dart';
import 'package:spreadx_web/Utils/constant_sheet.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:window_manager/window_manager.dart';

late ConstantSheet styleSheet;
late ResponsiveValues responsive;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  styleSheet = ConstantSheet.instance;
  tz.initializeTimeZones();

  WindowManager.instance.setMinimumSize(const Size(1024, 810));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      initialBinding: InitialBinding(),
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(backgroundColor: styleSheet.COLOR.primaryColor),
        fontFamily: GoogleFonts.inter().fontFamily,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
