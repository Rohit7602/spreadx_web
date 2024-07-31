import 'package:get/get.dart';
import 'package:spreadx_web/Components/Controller/product_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
