// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/style.dart';

class StandardProcedureTab extends StatefulWidget {
  const StandardProcedureTab({super.key});

  @override
  State<StandardProcedureTab> createState() => _StandardProcedureTabState();
}

class _StandardProcedureTabState extends State<StandardProcedureTab> {
  TextEditingController ProcedureName = TextEditingController();
  TextEditingController ProcedureDetails = TextEditingController();

  List<String> AddedProcedureName = [];
  List<String> AddedProcedureDetails = [];
  void editRow(int index) {
    setState(() {
      // Update controllers and selected values with the values of the selected row
      ProcedureName.text = AddedProcedureName[index];
      ProcedureDetails.text = AddedProcedureDetails[index];
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
                'Add Standard Procedures',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Procedure Name*'),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: ProcedureName,
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
              const Text('Procedure Code*'),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: ProcedureDetails,
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
                      AddedProcedureName.add(ProcedureName.text);
                      AddedProcedureDetails.add(ProcedureDetails.text);
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
                                  'Procedure Name',
                                  softWrap: true,
                                ))),
                        DataColumn(
                            label: SizedBox(
                                width: 75,
                                child: Text(
                                  'Procedure Details',
                                  softWrap: true,
                                ))),
                        DataColumn(label: Text('action')),
                      ],
                      rows: List.generate(AddedProcedureName.length, (index) {
                        return DataRow(cells: [
                          // DataCell(Text(name ?? "")),
                          DataCell(Text(AddedProcedureName[index])),
                          DataCell(Center(
                              child: Text(AddedProcedureDetails[index]))),

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
