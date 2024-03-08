import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class StationVoltage extends StatefulWidget {
  VoidCallback onNext;
  VoidCallback onBack;
  StationVoltage({super.key, required this.onNext, required this.onBack});

  @override
  State<StationVoltage> createState() => _StationVoltageState();
}

class _StationVoltageState extends State<StationVoltage> {
  TextEditingController _solar = TextEditingController();
  TextEditingController _battery = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            Text(
              'Station Voltage',
              style: GoogleFonts.ubuntu(color: Colors.blue, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            _Text('Solar Volt', _solar),
            SizedBox(
              height: 15,
            ),
            _Text('Battery Volt', _battery),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.blue, strokeAlign: 1)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (bool? val) {
                          setState(() {
                            isChecked = val ?? false;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Water Quality Sensor'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onBack();
                  },
                  child: Text('back'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onNext();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget _Text(String title, TextEditingController _controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // readOnly: isDate,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  // labelText: 'From Date*',
                  border: InputBorder.none),
              controller: _controller,
              // onTap: isDate ? datePick : null,
            ),
          ),
        ),
      ],
    );
  }
}
