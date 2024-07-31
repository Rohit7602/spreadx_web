import 'package:get/get.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';

class ProductController extends GetxController {
  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  addProducts(ProductModel product) {
    _productList.add(product);
    update();
  }

  removeProduct() {
    _productList.removeLast();

    update();
  }
}
