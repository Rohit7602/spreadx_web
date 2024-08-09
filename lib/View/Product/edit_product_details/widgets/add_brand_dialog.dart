import 'package:flutter/material.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';

class AddBrandDialog extends StatefulWidget {
  final String title;
  final Function(String) ontap;
  const AddBrandDialog({super.key, required this.title, required this.ontap});

  @override
  State<AddBrandDialog> createState() => _AddBrandDialogState();
}

class _AddBrandDialogState extends State<AddBrandDialog> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 450),
      child: Dialog(
        child: Padding(
          padding: styleSheet.DECORATION.PADDING_20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add New ${widget.title}",
                  style: styleSheet.TEXT_THEME.fs14Bold),
              styleSheet.appConfig.addHeight(40),
              SecondaryTextFormField(
                  controller: _controller,
                  onTap: () => openVirtualKeyboard(),
                  hinttext: "${widget.title} Name",
                  fillColor: false),
              styleSheet.appConfig.addHeight(30),
              PrimaryBtnView(
                  btnName: "Add ${widget.title}",
                  onPressed: () {
                    if (_controller.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Please enter the value of ${widget.title}")));
                    } else {
                      widget.ontap(_controller.text);
                      Navigator.of(context).pop();
                    }
                  },
                  isExpanded: true)
            ],
          ),
        ),
      ),
    );
  }
}
