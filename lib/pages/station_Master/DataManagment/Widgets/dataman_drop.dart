import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DatamanageDrop extends StatefulWidget {
  String val;
  List<String> items;
  DatamanageDrop({super.key, required this.val, required this.items});

  @override
  State<DatamanageDrop> createState() => _DatamanageDrop();
}

class _DatamanageDrop extends State<DatamanageDrop> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 41,
      child: DropdownButtonFormField<String>(
        value: widget.val,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.lightBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.lightBlue),
          ),
        ),
      ),
    );
  }
}
