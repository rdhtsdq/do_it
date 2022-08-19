import 'package:flutter/material.dart';

class CheckWidget extends StatefulWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = !isChecked;
        });
      },
    );
  }
}
