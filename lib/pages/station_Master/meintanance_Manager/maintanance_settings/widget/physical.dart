// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/style.dart';

class Physical_inspectionTab extends StatefulWidget {
  const Physical_inspectionTab({super.key});

  @override
  State<Physical_inspectionTab> createState() => _Physical_inspectionTabState();
}

class _Physical_inspectionTabState extends State<Physical_inspectionTab> {
  TextEditingController ItemName = TextEditingController();
  TextEditingController ItemCode = TextEditingController();

  List<String> IName = [];
  List<String> Icode = [];
  void editRow(int index) {
    setState(() {
      // Update controllers and selected values with the values of the selected row
      ItemName.text = IName[index];
      ItemCode.text = Icode[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                'Add Inspection Item',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Item Name*'),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: ItemName,
                  decoration: const InputDecoration(
                    // labelText: 'Select Date and Time',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Item Code*'),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: ItemCode,
                  decoration: const InputDecoration(
                    // labelText: 'Select Date and Time',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      IName.add(ItemName.text);
                      Icode.add(ItemCode.text);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColor.Blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        'Add',
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columnSpacing: 30,
                      columns: const [
                        DataColumn(
                            label: SizedBox(
                                width: 75,
                                child: Text(
                                  'Inspection Item Name',
                                  softWrap: true,
                                ))),
                        DataColumn(
                            label: SizedBox(
                                width: 75,
                                child: Text(
                                  'Inspection Item Code',
                                  softWrap: true,
                                ))),
                        DataColumn(label: Text('action')),
                      ],
                      rows: List.generate(IName.length, (index) {
                        return DataRow(cells: [
                          // DataCell(Text(name ?? "")),
                          DataCell(Text(IName[index])),
                          DataCell(Center(child: Text(Icode[index]))),

                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  editRow(index);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              // const SizedBox(
                              //   width: 5,
                              // ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          )),
                        ]);
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget Drop(
    String? selectedValue,
    List<String> list,
    void Function(String?)? onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: list.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }
}
