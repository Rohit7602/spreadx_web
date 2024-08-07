import 'package:flutter/material.dart';

class SecurityView extends StatelessWidget {
  final void Function()? onPressedBack;
  const SecurityView({super.key, this.onPressedBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: onPressedBack,
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
        ],
      )),
    );
  }
}
