import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/main.dart';

class LocalData {
// *************** Onboarding Data List ********************

  static List<OnboardingListClass> listOfOnbaord = [
    OnboardingListClass(styleSheet.images.onboarding1Img,
        "Easily track and manage Customers, suppliers, inventory, finance and Reports."),
    OnboardingListClass(styleSheet.images.onboarding2Img,
        "Access SPREADX App Anytime, Anywhere on Desktop, Mobile and Tablets via Android."),
    OnboardingListClass(styleSheet.images.onboarding3Img,
        "SPREADX App is Free of use, You can thank us later!"),
  ];

// *************** Reports Data List ********************

  static List<ReportDataListClass> reportList = [
    ReportDataListClass(styleSheet.icons.salesIcon, "Sales",
        "Show SALES reports for today, last week/month/year, or choose a custom periosd of time to report."),
    ReportDataListClass(styleSheet.icons.salesIcon, "Drawers",
        "Show DRAWERS history and entries, or open/close current drawer."),
    ReportDataListClass(styleSheet.icons.salesIcon, "Sales Summary",
        "Show Sales summary and statistics of the current day and more date ranges."),
    ReportDataListClass(styleSheet.icons.salesIcon, "Vat report",
        "Show VAT reports history including VAT IN/OUT summary."),
  ];

// *************** Sales Reports Data List ********************

  static List<ReportDataListClass> salesReportList = [
    ReportDataListClass(
        styleSheet.icons.salesIcon, "Today's Sale", "AED 1,447.70"),
    ReportDataListClass(
        styleSheet.icons.salesIcon, "Week's Sale", "AED 1,447.70"),
    ReportDataListClass(
        styleSheet.icons.salesIcon, "Month's Sale", "AED 1,447.70"),
    ReportDataListClass(
        styleSheet.icons.salesIcon, "Year's Sale", "AED 1,447.70"),
    ReportDataListClass(styleSheet.icons.salesIcon, "Custom", "AED 1,447.70"),
  ];

// *************** Dashboard Btn List ********************

  static List<DashboardBtn> buttonList = [
    DashboardBtn("Update QTY"),
    DashboardBtn("Product Check"),
    DashboardBtn("Update Price"),
    DashboardBtn("Custom Item"),
    DashboardBtn("Print Last"),
    DashboardBtn("Assign Customer"),
    DashboardBtn("Discount"),
    DashboardBtn("Clear"),
    DashboardBtn("ADD TO Queue"),
    DashboardBtn("Queue List"),
    DashboardBtn("Products"),
  ];

  // *************** Keyboard Btn List ********************

  static List<KeyboardButtonClass> keyboardBtnList = [
    KeyboardButtonClass("1"),
    KeyboardButtonClass("2"),
    KeyboardButtonClass("3"),
    KeyboardButtonClass("4"),
    KeyboardButtonClass("5"),
    KeyboardButtonClass("6"),
    KeyboardButtonClass("7"),
    KeyboardButtonClass("8"),
    KeyboardButtonClass("9"),
    KeyboardButtonClass("."),
    KeyboardButtonClass("0"),
    KeyboardButtonClass("X"),
  ];

  // *************** Menu Drawer List ********************
  static List<MenuDrawerList> menuDrawerList = [
    MenuDrawerList(styleSheet.icons.dashboardIcon, "Dashboard"),
    MenuDrawerList(styleSheet.icons.saleIcon, "Sales"),
    MenuDrawerList(styleSheet.icons.productIcon, "Products"),
    MenuDrawerList(styleSheet.icons.inventoryIcon, "Inventory"),
    MenuDrawerList(styleSheet.icons.transactionIcon, "Transactions"),
    MenuDrawerList(styleSheet.icons.supplierIcon, "Suppliers"),
    MenuDrawerList(styleSheet.icons.customerIcon, "Customers"),
    MenuDrawerList(styleSheet.icons.reportIcon, "Reports"),
    MenuDrawerList(styleSheet.icons.dataCenterIcon, "Data Center"),
    MenuDrawerList(styleSheet.icons.mainSetupIcon, "Main Setup"),
    MenuDrawerList(styleSheet.icons.supportIcon, "Support & Legal"),
  ];

  // *************** Money Amount ********************
  static List<MoneyList> moneyAmountList = [
    MoneyList("5"),
    MoneyList("10"),
    MoneyList("20"),
    MoneyList("50"),
    MoneyList("100"),
    MoneyList("200"),
    MoneyList("500"),
    MoneyList("1000"),
  ];

// *************** Product List ********************

  static List<ProductModel> productList = [
    ProductModel("default - PCS", "1", "1", "10"),
    ProductModel("default - PCS", "1", "1", "0"),
    ProductModel("default - PCS", "1", "1", ""),
  ];
}

// ******** Class Start From Here ******************

// class For Onboarding List

class OnboardingListClass {
  String image, title;

  OnboardingListClass(this.image, this.title);
}

// class For ReportData List

class ReportDataListClass {
  String icon, title, description;

  ReportDataListClass(this.icon, this.title, this.description);
}

// class For Dashboard Button List

class DashboardBtn {
  String title;

  DashboardBtn(this.title);
}

// class For Keyboard Button List
class KeyboardButtonClass {
  String btnName;

  KeyboardButtonClass(this.btnName);
}

// class For Menu Drawer List
class MenuDrawerList {
  String btnName, icon;

  MenuDrawerList(this.icon, this.btnName);
}

// class For Money List
class MoneyList {
  String amount;

  MoneyList(this.amount);
}
