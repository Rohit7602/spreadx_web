import 'package:get/get.dart';
import 'package:spreadx_web/Components/Models/product_model.dart';

class ProductController extends GetxController {
  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  addProducts(ProductModel product) {
    if (_productList.any((value) => value.id == product.id)) {
      final i = _productList.indexOf(product);
      _productList[i].qty = (int.parse(_productList[i].qty) + 1).toString();
    } else {
      product.qty = "1";
      _productList.add(product);
    }
    update();
  }

  removeProduct(String id) {
    _productList.removeWhere((v) => v.id == id);
    update();
  }
}
