import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/add_customer_controller.dart';
import 'package:spreadx_web/Components/Controller/drawer_controller.dart';
import 'package:spreadx_web/Components/Controller/navigation_controller.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';
import 'package:spreadx_web/Components/Controller/supplier_controller.dart';
import 'package:spreadx_web/Components/Controller/users_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(UsersController());
    Get.put(SupplierController());
    Get.put(CustomerController());
    Get.put(DrawersController());
    Get.put(NavigationController());
  }
}
