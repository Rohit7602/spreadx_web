// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String id, description, price, qty, stock;

  ProductModel(this.id, this.description, this.price, this.qty, this.stock);
}

class ProductsClass {
  final String id;
  final String barCode;
  final String productName;
  final String productShortName;
  final String description;
  final String brand;
  final String category;
  final String unit;
  final String sellingPrice;
  final String vat;
  final String initialStock;

  const ProductsClass({
    required this.id,
    required this.barCode,
    required this.productName,
    required this.productShortName,
    required this.description,
    required this.brand,
    required this.category,
    required this.unit,
    required this.sellingPrice,
    required this.vat,
    required this.initialStock,
  });
}
