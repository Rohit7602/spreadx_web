import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Data/local_data.dart';

class CustomerController extends GetxController {
  final RxList<CustomerModel> _addCustomer = RxList<CustomerModel>([]);
  List<CustomerModel> get customer => _addCustomer;

  setCustomers(List<CustomerModel> data) {
    _addCustomer(data);
  }

  addCustomer(CustomerModel data) {
    _addCustomer.add(data);
  }

  deleteCustomer(CustomerModel customer) {
    _addCustomer.remove(customer);
    update();
  }

  final TextEditingController _barcode = TextEditingController();
  TextEditingController get barcode => _barcode;

  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;

  final TextEditingController _code = TextEditingController();
  TextEditingController get code => _code;

  final TextEditingController _firstName = TextEditingController();
  TextEditingController get firstname => _firstName;

  final TextEditingController _lastName = TextEditingController();
  TextEditingController get lastName => _lastName;

  final TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;

  final TextEditingController _adress = TextEditingController();
  TextEditingController get address => _adress;

  final TextEditingController _creditLimit = TextEditingController();
  TextEditingController get creditLimit => _creditLimit;

  final TextEditingController _daysLimit = TextEditingController();
  TextEditingController get daysLimit => _daysLimit;

  final TextEditingController _businessName = TextEditingController();
  TextEditingController get businessName => _businessName;

  final TextEditingController _businessType = TextEditingController();
  TextEditingController get businessType => _businessType;

  final RxString _accountType = RxString("");
  String get accountType => _accountType.value;

  setAccountType(String v) {
    _accountType(v);
  }

  final RxString _accountCategory = RxString("");
  String get accountCategory => _accountCategory.value;

  setAccountCategory(String v) {
    _accountCategory(v);
  }

  final RxString _status = RxString("");
  String get status => _status.value;

  onSave(BuildContext context) {
    final data = CustomerModel(
        barcode: barcode.text,
        code: code.text,
        firstName: firstname.text,
        lastName: lastName.text,
        number: _phoneNumber.text,
        email: email.text,
        accountType: accountType,
        address: address.text);

    addCustomer(data);
    barcode.clear();
    phoneNumber.clear();
    email.clear();
    setAccountType("");
  }
}
