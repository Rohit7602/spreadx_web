import 'package:get/get.dart';

class NavigationController extends GetxController {
  // bool to show Search Icon
  final RxBool _showSearch = false.obs;
  RxBool get showSearch => _showSearch;

  setShowSearch(bool status) {
    _showSearch(status);
  }

  // bool to show Export Icon
  final RxBool _showExportBtn = false.obs;
  RxBool get showExportBtn => _showExportBtn;

  setExportBtn(bool status) {
    _showExportBtn(status);
  }
}
