import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:spreadx_web/Data/local_data.dart';
import 'package:spreadx_web/Utils/Routes/routes.dart';

class UsersController extends GetxController {
  final RxList<UserModel> _users = RxList<UserModel>([]);
  List<UserModel> get users => _users;

  setUsers(List<UserModel> data) {
    _users(data);
  }

  addUser(UserModel data) {
    _users.add(data);
  }

  final TextEditingController _employeeName = TextEditingController();
  TextEditingController get employeeName => _employeeName;

  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;

  final TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;

  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;

  final TextEditingController _confirmPassword = TextEditingController();
  TextEditingController get confirmPassword => _confirmPassword;

  final RxString _role = RxString("");
  String get role => _role.value;

  setRole(String v) {
    _role(v);
  }

  final RxString _status = RxString("");
  String get status => _status.value;

  setStatus(String v) {
    _status(v);
  }

  onSave(BuildContext context) {
    final data = UserModel(
        name: employeeName.text,
        phone: phoneNumber.text,
        email: email.text,
        role: role,
        status: status);

    if (password.text.trim() == confirmPassword.text.trim()) {
      addUser(data);
      employeeName.clear();
      phoneNumber.clear();
      email.clear();
      setRole("");
      setStatus("");
      password.clear();
      confirmPassword.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Password and Confirm Password doesn't match")));
    }
  }
}
