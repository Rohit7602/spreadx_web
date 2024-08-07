import 'package:go_router/go_router.dart';
import 'package:spreadx_web/View/Home/home_screen.dart';
import 'package:spreadx_web/View/Drawer/menu_drawer.dart';
import 'package:spreadx_web/View/Drawer/drawer_report.dart';
import 'package:spreadx_web/View/Onboarding/onboarding.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';
import 'package:spreadx_web/View/Auth/login_view.dart';
import 'package:spreadx_web/View/Drawer/add_drawer.dart';
import 'package:spreadx_web/View/Drawer/drawer_view.dart';
import 'package:spreadx_web/View/Reports/reports_view.dart';
import 'package:spreadx_web/View/Sales/product_wise_report.dart';
import 'package:spreadx_web/View/Sales/sales_report.dart';
import 'package:spreadx_web/View/Supppliers/add_new_supplier.dart';
import 'package:spreadx_web/View/Transactions/transaction_list.dart';
import 'package:spreadx_web/View/Transactions/transactions_invoice.dart';

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
      builder: (context, state) => SalesReportView(),
    ),
    GoRoute(
      path: MyRoute.transactionInvoice,
      builder: (context, state) => const TransactionsInvoiceView(),
    ),
    GoRoute(
      path: MyRoute.transactionList,
      builder: (context, state) => const TransactionListView(),
    ),
    GoRoute(
      path: MyRoute.drawerView,
      builder: (context, state) => const DrawerView(),
    ),
    GoRoute(
      path: MyRoute.producWiseReport,
      builder: (context, state) => const ProductWiseReportView(),
    ),
    GoRoute(
      path: MyRoute.addDrawer,
      builder: (context, state) => const AddDrawerView(),
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
      path: MyRoute.drawerReportView,
      builder: (context, state) => const DrawerReportView(),
    ),
    GoRoute(
      path: MyRoute.mainMenuDrawer,
      builder: (context, state) => const MainMenuDrawerView(),
    ),
    GoRoute(
      path: MyRoute.addNewSupplier,
      builder: (context, state) => const AddNewSupplierView(),
    ),
  ],
);
