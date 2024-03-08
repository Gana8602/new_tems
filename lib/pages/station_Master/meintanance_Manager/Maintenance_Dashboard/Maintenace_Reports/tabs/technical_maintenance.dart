import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class TechnicalMaintenance extends StatefulWidget {
  VoidCallback onNext;
  VoidCallback onBack;
  TechnicalMaintenance({super.key, required this.onNext, required this.onBack});

  @override
  State<TechnicalMaintenance> createState() => _TechnicalMaintenanceState();
}

class _TechnicalMaintenanceState extends State<TechnicalMaintenance> {
  File? _image;
  String? name;
  List<String> images = [];
  List<File> files = [];
  String DeviceName = 'Water Quality Sensor';
  List<String> DeviceNames = ['Water Quality Sensor'];
  String Ptype = 'Before Maintenance';
  List<String> Ptypes = [
    'Before Maintenance',
    'After Maintenance',
    'Onsite Verification',
    'Online Verification'
  ];

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        name = _image!.path.split('/').last; // Get only the file name
      } else {
        // User canceled the picker
      }
    });
  }

  List<String> names = [];
  List<String> TYpes = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              'Technical Maintenance',
              style: GoogleFonts.ubuntu(color: Colors.blue, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: _getImage,
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
                        child: Text(_image != null
                            ? name.toString()
                            : 'No file chosen'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      images.add(name.toString());
                      files.add(_image!);
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columnSpacing: 5,
                    columns: const [
                      DataColumn(
                          label: SizedBox(
                              width: 70,
                              child: Text(
                                'Device Name*',
                                softWrap: true,
                              ))),
                      DataColumn(
                          label: SizedBox(
                              width: 70,
                              child: Text(
                                'Picture Type*',
                                softWrap: true,
                              ))),
                      // DataColumn(
                      //     label: SizedBox(
                      //         width: 50,
                      //         child: Text(
                      //           'Description*',
                      //           softWrap: true,
                      //         ))),
                      DataColumn(
                          label: SizedBox(
                              width: 90,
                              child: Text(
                                'Maintenance Picture',
                                softWrap: true,
                              ))),
                      DataColumn(label: Text('action')),
                    ],
                    rows: List.generate(images.length, (index) {
                      return DataRow(cells: [
                        // DataCell(Text(name ?? "")),
                        DataCell(Drop(DeviceName, DeviceNames, (p0) {
                          setState(() {
                            DeviceName = p0!;
                            // names.add(DeviceName[index]);
                          });
                        })),
                        DataCell(Drop(Ptype, Ptypes, (p0) {
                          setState(() {
                            Ptype = p0!;
                            // TYpes.add(Ptype[index]);
                          });
                        })),
                        // DataCell(Center(child: Text(EDate[index]))),

                        DataCell(Center(
                          child: SizedBox(
                            width: 140,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 90,
                                    child: Text(
                                      images[index],
                                      softWrap: true,
                                    )),
                                _image != null
                                    ? SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image.file(
                                          files[index],
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Container(), // Display the image
                              ],
                            ),
                          ),
                        )),
                        DataCell(IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))),
                      ]);
                    })),
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
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.onNext();
                  },
                  child: Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Drop(
    String? selectedValue,
    List<String> list,
    void Function(String?)? onChanged,
  ) {
    return SizedBox(
      width: 80,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded: true,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
          ),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
