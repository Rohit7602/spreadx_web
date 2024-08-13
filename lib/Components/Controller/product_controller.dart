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

  clearProducts() {
    _productList.clear();
    update();
  }

  updateProductPrice(ProductModel product, String price) {
    if (_productList.any((val) => val.id == product.id)) {
      final i = _productList.indexOf(product);

      _productList[i].price = "";

      _productList[i].price = price;
      _productList[i].totalPrice = price;
    }

    update();
  }

  calculateProductPrice(int i) {
    _productList[i].totalPrice =
        (double.parse(_productList[i].price.toString()) *
                double.parse(_productList[i].qty.toString()))
            .toString();

    update();
  }

  // Queue List Controller

  final List<ProductModel> _queueList = [];
  List<ProductModel> get queueList => _queueList;

  updateQueueList(List<ProductModel> pr) {
    _queueList.addAll(pr);
    clearProducts();
    update();
  }
}
