import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyProgressReport extends StatefulWidget {
  VoidCallback onBack;
  DailyProgressReport({super.key, required this.onBack});

  @override
  State<DailyProgressReport> createState() => _DailyProgressReportState();
}

class _DailyProgressReportState extends State<DailyProgressReport> {
  TextEditingController _conclusion = TextEditingController();
  String? fileName;
  Future<void> GetFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        fileName = file.path.split('/').last;
        print(fileName);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            Text(
              'Daily Progress Report',
              style: GoogleFonts.ubuntu(color: Colors.blue, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  InkWell(
                    onTap: GetFile,
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: const Center(
                        child: Text('Choose file'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(fileName != null
                        ? fileName.toString()
                        : 'No file chosen'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _Text('Conclusion', _conclusion, false, () {}),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onBack();
                  },
                  child: Text('back'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _Text(String title, TextEditingController _controller, bool isDate,
      void Function() datePick) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              readOnly: isDate,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  // labelText: 'From Date*',
                  border: InputBorder.none),
              controller: _controller,
              onTap: isDate ? datePick : null,
            ),
          ),
        ),
      ],
    );
  }
}
