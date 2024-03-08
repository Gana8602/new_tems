import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfigDrop extends StatefulWidget {
  String val;
  List<String> items;
  ConfigDrop({super.key, required this.val, required this.items});

  @override
  State<ConfigDrop> createState() => _ConfigDropState();
}

class _ConfigDropState extends State<ConfigDrop> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.val,
      isExpanded: true,
      items: widget.items.map(
        (String result) {
          return DropdownMenuItem<String>(value: result, child: Text(result));
        },
      ).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.val = newValue!;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
