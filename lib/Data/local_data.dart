// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:spreadx_web/Components/Models/product_model.dart';
import 'package:spreadx_web/Data/enum.dart';
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
    ReportDataListClass("Sales",
        "Show SALES reports for today, last week/month/year, or choose a custom periosd of time to report."),
    ReportDataListClass("Drawers",
        "Show DRAWERS history and entries, or open/close current drawer."),
    ReportDataListClass("Sales Summary",
        "Show Sales summary and statistics of the current day and more date ranges."),
    ReportDataListClass(
        "VAT REPORT", "Show VAT reports history including VAT IN/OUT summary."),
  ];

// *************** Sales Reports Data List ********************

  static List<ReportDataListClass> salesReportList = [
    ReportDataListClass("Today", "AED 1,447.70"),
    ReportDataListClass("This Week", "AED 1,447.70"),
    ReportDataListClass("This Month", "AED 1,447.70"),
    ReportDataListClass("This Year", "AED 1,447.70"),
    ReportDataListClass("Custom", "AED 1,447.70"),
  ];

// *************** Sales Reports Data List ********************

  static List<ReportDataListClass> salesReportViewList = [
    ReportDataListClass("Today", "Duration"),
    ReportDataListClass("AED 0.00", "Total"),
    ReportDataListClass("AED 0.00", "Total Excluding VAT:"),
    ReportDataListClass("AED 0.00", "Total VAT amount"),
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
    // MenuDrawerList(styleSheet.icons.dashboardIcon, "Dashboard"),
    // MenuDrawerList(styleSheet.icons.saleIcon, "Sales"),
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
    ProductModel("1", "default - PCS", "default - PCS", "2", "0", "0", ""),
    ProductModel("1", "default - PCS", "default - PCS", "0", "0", "4", ""),
    ProductModel("2", "default - PCS", "default - PCS", "10", "0", "2", ""),
  ];

// *************** Existing Customer List ********************
  static List<ExistingCustomer> existingCustomerList = [
    ExistingCustomer("Dogw", "KD Makwana", "Cash Customer", "790889079"),
    ExistingCustomer("123000", "KDMC Mac", "Cash Customer", "23423423"),
    ExistingCustomer("355", "KDM Mac", "Cash Customer", "0789780"),
    ExistingCustomer("pXM5", "TEST MASTER2", "Credit Customer", "676889"),
    ExistingCustomer("nsIR", "KDM Cash", "Cash Customer", "45657567856")
  ];

// *************** Business Type List ********************
  static List<String> businessTypeList = [
    "FMCG",
    "Health",
    "Villa",
    "Dtyuu",
    "Ggh",
    "Restaurant",
    "Saloon",
    "Delivery Patner",
    "New"
  ];

  // ************* Product Details > Transactions Tab Bar List *****************
  static List<String> productDetailsTransactionsTabList = [
    "All",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

// *************** Business Type List ********************
  static List<String> salesSummaryDayWise = [
    "Today",
    "Week",
    "Month",
    "6 Months",
    "Year",
    "Custom",
  ];

  // ****************** Packing Data List ******************
  static List<PackingDataModel> packingData = [
    PackingDataModel(
        id: "3456098",
        unitCode: "Pieces",
        unitName: "PCS",
        unitEquivalent: "data")
  ];

  /// *********************** Issue Refund Data List *****************
  static List<IssueRefundModel> issueRefundData = [
    IssueRefundModel(
        quantity: 1.00,
        amount: 2.00,
        item: const IssueRefundItemModel(
            title: "default - PCS", description: "default")),
    // const IssueRefundModel(
    //     quantity: 2.00,
    //     amount: 4.00,
    //     item: IssueRefundItemModel(
    //         title: "default - PCS - 2", description: "default-2")),
    // const IssueRefundModel(
    //     quantity: 1.00,
    //     amount: 1.00,
    //     item: IssueRefundItemModel(
    //         title: "default - PCS - 3", description: "default-3")),
  ];

  /// *********************** List of Transaction Data *****************

  static List<TransactionModel> transactionList = [
    TransactionModel("1", "PIN34243", "0.00", "31 Jul12:04 PM"),
    TransactionModel("2", "PIN342432", "0.00", "31 Jul12:04 PM"),
    TransactionModel("3", "PIN34221", "0.00", "31 Jul12:04 PM"),
  ];

  /// *********************** List of Enteries Transaction Data *****************

  static List<EnteriesModel> entryTrList = [
    EnteriesModel(
        "PIN70879",
        "Purchases",
        "09 Aug 2024 05:04 PM",
        "Rohit",
        "[default - pcs]",
        "2.0",
        "0.00",
        "0.00",
        "0.00",
        "0.00",
        "V2",
        "0.00",
        "0.00"),
    EnteriesModel(
        "PIN70879",
        "Purchases",
        "09 Aug 2024 05:04 PM",
        "Rohit",
        "[default - pcs]",
        "2.0",
        "0.00",
        "0.00",
        "0.00",
        "0.00",
        "V2",
        "0.00",
        "0.00"),
    EnteriesModel(
        "PIN70879",
        "Purchases",
        "09 Aug 2024 05:04 PM",
        "Rohit",
        "[default - pcs]",
        "2.0",
        "0.00",
        "0.00",
        "0.00",
        "0.00",
        "V2",
        "0.00",
        "0.00"),
    EnteriesModel(
        "PIN70879",
        "Purchases",
        "09 Aug 2024 05:04 PM",
        "Rohit",
        "[default - pcs]",
        "2.0",
        "0.00",
        "0.00",
        "0.00",
        "0.00",
        "V2",
        "0.00",
        "0.00"),
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
  String title, description;

  ReportDataListClass(this.title, this.description);
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

// class For Assign Customer
class ExistingCustomer {
  String id, name, customerType, number;

  ExistingCustomer(this.id, this.name, this.customerType, this.number);
}

// class for Users
class UserModel {
  final String name;
  final String phone;
  final String email;
  final String role;
  final String status;
  const UserModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.status,
  });
}

// class for suppliers

class SuppliersModel {
  String name;
  String number;
  String type;

  SuppliersModel(
      {required this.name, required this.number, required this.type});
}

// class for customer

class CustomerModel {
  String barcode,
      code,
      firstName,
      lastName,
      number,
      email,
      address,
      accountType,
      accountCategory;

  CustomerModel(
      {required this.barcode,
      required this.code,
      required this.firstName,
      required this.lastName,
      required this.number,
      required this.email,
      required this.accountType,
      required this.address,
      required this.accountCategory});
}
// class for drawer

class DrawerModel {
  String amount;
  String openTime;
  String closeTime;
  String type;
  VatModelStatus status;
  DrawerModel(
      this.amount, this.openTime, this.closeTime, this.type, this.status);
}

// class for Product Details > Packing data
class PackingDataModel {
  // final String factor;
  // final String barcode;
  // final String sellingPrice;
  final String id;
  final String unitCode;
  final String unitName;
  final String unitEquivalent;
  bool isBase;

  PackingDataModel({
    // required this.factor,
    // required this.barcode,
    // required this.sellingPrice,
    required this.id,
    required this.unitCode,
    required this.unitName,
    required this.unitEquivalent,
    this.isBase = false,
  });
}

/// Class for Transactions > Transaction Details > Issue Refund
class IssueRefundModel {
  double quantity;
  double amount;
  IssueRefundItemModel item;

  IssueRefundModel({
    required this.quantity,
    required this.amount,
    required this.item,
  });

  @override
  bool operator ==(covariant IssueRefundModel other) {
    if (identical(this, other)) return true;

    return other.quantity == quantity &&
        other.amount == amount &&
        other.item == item;
  }

  @override
  int get hashCode => quantity.hashCode ^ amount.hashCode ^ item.hashCode;

  @override
  String toString() =>
      'IssueRefundModel(quantity: $quantity, amount: $amount, item: $item)';
}

class IssueRefundItemModel {
  final String title;
  final String description;

  const IssueRefundItemModel({
    required this.title,
    required this.description,
  });

  @override
  bool operator ==(covariant IssueRefundItemModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;

  @override
  String toString() =>
      'IssueRefundItemModel(title: $title, description: $description)';
}

// class for Transaction Model

class TransactionModel {
  String id;
  String trNumber;
  String price;
  String dateTime;

  TransactionModel(this.id, this.trNumber, this.price, this.dateTime);
}

// class for Enteries Model
class EnteriesModel {
  String trNumber,
      type,
      date,
      customerName,
      productName,
      qty,
      price,
      lineTotal,
      discount,
      netTotal,
      vatType,
      vatAmount,
      total;

  EnteriesModel(
      this.trNumber,
      this.type,
      this.date,
      this.customerName,
      this.productName,
      this.qty,
      this.price,
      this.lineTotal,
      this.discount,
      this.netTotal,
      this.vatType,
      this.vatAmount,
      this.total);
}
