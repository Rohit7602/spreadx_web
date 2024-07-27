// ignore_for_file: non_constant_identifier_names

class AppImage {
  AppImage._private();

  static final AppImage _instance = AppImage._private();

  factory AppImage() {
    return _instance;
  }
  String Applogo = "assets/image/Applogo.svg";
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

  String salesIcon = "assets/Icons/sales_icon.png";
  String printIcon = "assets/Icons/print_icon.png";
  String shareIcon = "assets/Icons/share_icon.png";
  String refundIcon = "assets/Icons/refund_icon.png";
  String receiptIcon = "assets/Icons/receipt_icon.png";

  //
}
