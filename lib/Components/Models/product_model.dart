class ProductModel {
  String id, productName, description, price, qty, stock, totalPrice;
  final String barCode;
  final String productShortName;
  final String brand;
  final String category;
  final String vat;
  final String unit;
  ProductModel(this.id, this.productName, this.description, this.price,
      this.qty, this.stock, this.totalPrice,
      {this.barCode = "",
      this.productShortName = "",
      this.brand = "default",
      this.category = "default",
      this.vat = "",
      this.unit = "0.00"});
}
