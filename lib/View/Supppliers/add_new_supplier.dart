import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Appbar/custom_appbar.dart';

class AddNewSupplierView extends StatelessWidget {
  const AddNewSupplierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrawerAppBarView(showLeading: true, title: "Add New Supplier"),
      body: const Column(
        children: [],
      ),
    );
  }
}
