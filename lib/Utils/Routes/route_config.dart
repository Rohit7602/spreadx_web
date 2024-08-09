import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Auth/login_view.dart';
import 'package:spreadx_web/View/Drawer/add_drawer.dart';
import 'package:spreadx_web/View/Drawer/close_drawer_navigation.dart';
import 'package:spreadx_web/View/Drawer/drawer_report.dart';
import 'package:spreadx_web/View/Drawer/drawer_view.dart';
import 'package:spreadx_web/View/Drawer/menu_drawer.dart';
import 'package:spreadx_web/View/Home/home_screen.dart';
import 'package:spreadx_web/View/Onboarding/onboarding.dart';
import 'package:spreadx_web/View/Reports/reports_view.dart';
import 'package:spreadx_web/View/Sales/product_wise_report.dart';
import 'package:spreadx_web/View/Sales/sales_report.dart';
import 'package:spreadx_web/View/Sales/sales_summary.dart';
import 'package:spreadx_web/View/Supppliers/suppliers_view.dart';
import 'package:spreadx_web/View/Transactions/transaction_view.dart';
import 'package:spreadx_web/View/Transactions/transactions_invoice.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/business_profile_setup_view.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/business_setup_view.dart';
import 'package:spreadx_web/View/main_setup/Business_Setup/profile_setup_view.dart';
import 'package:spreadx_web/View/main_setup/Printer_Settings/printer_settings.dart';
import 'package:spreadx_web/View/main_setup/User_Management/user_management.dart';
import 'package:spreadx_web/View/main_setup/User_Management/user_profile.dart';
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
      path: MyRoute.salesReport,
      builder: (context, state) => const SalesReportView(),
    ),
    GoRoute(
      path: MyRoute.salesSummary,
      builder: (context, state) => const SalesSummaryView(),
    ),
    GoRoute(
      path: MyRoute.transactionInvoice,
      builder: (context, state) => const TransactionsInvoiceView(),
    ),
    GoRoute(
      path: MyRoute.drawerView,
      builder: (context, state) => const DrawerView(),
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
      builder: (context, state) => ProfileSetupView(),
    ),
    GoRoute(
      path: MyRoute.businessProfileSetupview,
      builder: (context, state) => BusinessProfileSetupView(),
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
      path: MyRoute.userProfileView,
      builder: (context, state) => const UserProfileView(),
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
    GoRoute(
      path: MyRoute.transactionInvoice,
      builder: (context, state) => const TransactionView(),
    ),
  ],
);
