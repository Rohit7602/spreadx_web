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
