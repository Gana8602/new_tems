import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfigText extends StatefulWidget {
  String val;
  ConfigText({super.key, required this.val});

  @override
  State<ConfigText> createState() => _ConfigTextState();
}

class _ConfigTextState extends State<ConfigText> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: widget.val,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.2),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
