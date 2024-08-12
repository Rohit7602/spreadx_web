import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Auth/login_view.dart';
import 'package:spreadx_web/View/Drawer/menu_drawer.dart';
import 'package:spreadx_web/View/Home/home_screen.dart';
import 'package:spreadx_web/View/Onboarding/onboarding.dart';
import 'package:spreadx_web/View/Reports/reports_view.dart';
import 'package:spreadx_web/View/Supppliers/suppliers_view.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/business_profile_setup_view.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/business_setup_view.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/profile_setup_view.dart';
import 'package:spreadx_web/View/main_setup/Printer_Settings/printer_settings.dart';
import 'package:spreadx_web/View/main_setup/User_Management/user_management.dart';
import 'package:spreadx_web/View/main_setup/security/security_view.dart';
import 'package:spreadx_web/View/main_setup/store_settings/store_settings_view.dart';

final GoRouter router = GoRouter(
  initialLocation: MyRoute.onboarding,
  routes: [
    GoRoute(
      path: MyRoute.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: MyRoute.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: MyRoute.homeScreen,
      builder: (context, state) => const HomeScreenView(),
    ),
    GoRoute(
      path: MyRoute.reportView,
      builder: (context, state) => const ReportsView(),
    ),
    GoRoute(
      path: MyRoute.mainMenuDrawer,
      builder: (context, state) => const MainMenuDrawerView(),
    ),
    GoRoute(
      path: MyRoute.businessSetup,
      builder: (context, state) => const BusinessSetupView(),
    ),
    GoRoute(
      path: MyRoute.profileSetupView,
      builder: (context, state) => const ProfileSetupView(),
    ),
    GoRoute(
      path: MyRoute.businessProfileSetupview,
      builder: (context, state) => const BusinessProfileSetupView(),
    ),
    GoRoute(
      path: MyRoute.printerSetting,
      builder: (context, state) => PrinterSettings(),
    ),
    GoRoute(
      path: MyRoute.usersManagement,
      builder: (context, state) => const UserManagementView(),
    ),
    GoRoute(
      path: MyRoute.security,
      builder: (context, state) => SecurityView(),
    ),
    GoRoute(
      path: MyRoute.storeSettings,
      builder: (context, state) => StoreSettingsView(),
    ),
    GoRoute(
      path: MyRoute.supplier,
      builder: (context, state) => const SuppliersView(),
    ),
  ],
);
