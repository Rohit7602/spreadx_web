import 'package:flutter/material.dart';

class AddNewSupplierView extends StatelessWidget {
  final void Function()? onPressedBack;
  const AddNewSupplierView({super.key, this.onPressedBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: DrawerAppBarView(showLeading: true, title: "Add New Supplier"),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: onPressedBack,
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
        ],
      ),
    );
  }
}
