import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Data/local_data.dart';

class DrawersController extends GetxController {
  final RxList<DrawerModel> _drawer = RxList<DrawerModel>([]);
  List<DrawerModel> get drawer => _drawer;

  addDrawer(DrawerModel data) {
    _drawer.add(data);
  }

  clearDrawer() {
    _drawer.clear();
  }

  final RxList<DrawerModel> _closedrawer = RxList<DrawerModel>([]);
  List<DrawerModel> get closedrawer => _closedrawer;

  addCloseDrawer() {
    _closedrawer.add(drawer.first);
    _amountController.clear();
  }

  final TextEditingController _amountController = TextEditingController();
  TextEditingController get amount => _amountController;

  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get description => _descriptionController;

  onSave(BuildContext context) {
    final data = DrawerModel(
        "0", DateTime.now().toString(), DateTime.now().toString(), "");

    addDrawer(data);
    amount.clear();
  }
}
