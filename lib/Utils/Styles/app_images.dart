// ignore_for_file: non_constant_identifier_names

class AppImage {
  AppImage._private();

  static final AppImage _instance = AppImage._private();

  factory AppImage() {
    return _instance;
  }
  String appLogo = "assets/Logo/logo.png";
  String appLogoWhite = "assets/Logo/logo_white.png";
  String appLogoLarge = "assets/Logo/large_logo.png";

  // *************** Drawer Images ***********
  String inventoryImage = "assets/Image/inventoryImage.png";
  String main_setup_img = "assets/Image/main_setup_img.png";

  // ***************  Images ***********

  String onboardingImg = "assets/Image/onboarding.png";
  String onboarding1Img = "assets/Image/onboarding_1.png";
  String onboarding2Img = "assets/Image/onboarding_2.png";
  String onboarding3Img = "assets/Image/onboarding_3.png";
  String empty_cart = "assets/Image/empty_cart.png";
  String salesReport = "assets/Image/sales_report.png";
  String add_product = "assets/Image/add_product.png";
}

// SVG Images
class AppIcons {
  AppIcons._private();

  static final AppIcons _instance = AppIcons._private();

  factory AppIcons() {
    return _instance;
  }

  // ***************  Icons For Drawer ***********

  String dashboardIcon = "assets/Icons/dashboard_icon.png";
  String saleIcon = "assets/Icons/sale_icon.png";
  String productIcon = "assets/Icons/product_icon.png";
  String inventoryIcon = "assets/Icons/inventory_icon.png";
  String transactionIcon = "assets/Icons/transaction_icon.png";
  String supplierIcon = "assets/Icons/supplier_icon.png";
  String customerIcon = "assets/Icons/customer_icon.png";
  String reportIcon = "assets/Icons/reports_icon.png";
  String dataCenterIcon = "assets/Icons/data_center_icon.png";
  String mainSetupIcon = "assets/Icons/main_setup_icon.png";
  String supportIcon = "assets/Icons/support_icon.png";
  String screenIcon = "assets/Icons/screen_icon.png";
  String moneyIcon = "assets/Icons/money_icon.png";
  String moneyIconWithoutAmount = "assets/Icons/money_without_amount.png";

  String salesIcon = "assets/Icons/sales_icon.png";
  String printIcon = "assets/Icons/print_icon.png";
  String shareIcon = "assets/Icons/share_icon.png";
  String refundIcon = "assets/Icons/refund_icon.png";
  String receiptIcon = "assets/Icons/receipt_icon.png";

  // Printer Settings Icon
  String bluetooth = "assets/Icons/bluetooth.png";
  String m2 = "assets/Icons/m2.png";
  String phone = "assets/Icons/phone.png";
  String pos = "assets/Icons/pos.png";
  String printer = "assets/Icons/printer.png";

  String user = "assets/Icons/user.png";

  String arrowIcon = "assets/Icons/arrow_icon.png";
  //
}
