import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Data/local_data.dart';

class SupplierController extends GetxController {
  final RxList<SuppliersModel> _suppliers = RxList<SuppliersModel>([]);
  List<SuppliersModel> get suppliers => _suppliers;

  setSuppliers(List<SuppliersModel> data) {
    _suppliers(data);
    update();
  }

  addSuppliers(SuppliersModel data) {
    _suppliers.add(data);
    update();
  }

  final TextEditingController _supplierName = TextEditingController();
  TextEditingController get supplierName => _supplierName;

  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;

  final TextEditingController _creditLimit = TextEditingController();
  TextEditingController get creditLimit => _creditLimit;

  final TextEditingController _daysLimit = TextEditingController();
  TextEditingController get daysLimit => _daysLimit;

  final RxString _type = RxString("");
  String get type => _type.value;

  setType(String v) {
    _type(v);
  }

  onSave(BuildContext context) {
    final data = SuppliersModel(
      name: supplierName.text,
      number: phoneNumber.text,
      type: type,
    );

    addSuppliers(data);
    supplierName.clear();
    phoneNumber.clear();
    creditLimit.clear();
    daysLimit.clear();
    phoneNumber.clear();
  }
}
