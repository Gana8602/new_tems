import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class IconPopup extends StatefulWidget {
  SvgPicture icon;
  String text1;
  String text2;
  String text3;

  IconPopup(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2,
      required this.text3});

  @override
  State<IconPopup> createState() => _IconPopupState();
}

class _IconPopupState extends State<IconPopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.lightBlue)),
      child: PopupMenuButton(
        surfaceTintColor: Colors.white,
        icon: widget.icon,
        itemBuilder: (context) => [
          PopupMenuItem(
            child: ListTile(
              title: Center(child: Text(widget.text1)),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Center(child: Text(widget.text2)),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Center(child: Text(widget.text3)),
            ),
          ),
        ],
      ),
    );
  }
}
