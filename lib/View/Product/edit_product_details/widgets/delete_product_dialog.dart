import 'package:flutter/material.dart';

class DeleteProductDialog extends StatelessWidget {
  const DeleteProductDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text("Delete Product"),
      content: const Text("Are you sure you want to delete product?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Delete")),
      ],
    );
  }
}
