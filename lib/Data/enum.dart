// ignore_for_file: constant_identifier_names

enum AuthState {
  isLOGIN,
  isSignUp,
  isOTPViewFromSignUp,
  isOTPViewFromForgotPassword,
  isForgot,
  createPD
}

enum ScreenView { Tablet, Web, Desktop }

enum DrawerState {
  Dashboard,
  Products,
  Inventory,
  Transactions,
  Suppliers,
  Customers,
  Reports,
  DataCenter,
  MainSetup,
  Support
}

enum MainSetUpState { Default, Business, Printer, Users, Security, Store }

enum EditProductDetailStates { Default, Brand, Category, Packing }

enum AddProductState {
  Default,
  Scan,
  Import_Export,
  Single_Product,
  Multiple_Product
}

enum EditSupplierViewState {
  Default,
  Purchase_History,
  Purchase_Products,
  Assign_Products,View_Product
}

enum InventoryState { Default, Stock, Purchase_Product, Purchase_History }

enum ReportState { Default, Sales, Sales_Summary, Drawers, VAT_Report }

enum InventoryInvoiceState { Default, DiscountState, Without_Discount }
