import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class StandardProcedure extends StatefulWidget {
  VoidCallback onNext;
  VoidCallback onBack;
  StandardProcedure({super.key, required this.onNext, required this.onBack});

  @override
  State<StandardProcedure> createState() => _StandardProcedureState();
}

class _StandardProcedureState extends State<StandardProcedure> {
  TextEditingController _firstDate = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _lastDate = TextEditingController();
  DateTime? _selectedDateTime;
  String ProcedureType = 'CLEAN_SENSOR';
  List<String> ProcedureTypes = [
    'CLEAN_SENSOR',
    'CHECK_DATA_REMOTLY',
    'CHECK_CONNECTION'
  ];

  List<String> type = [];
  List<String> SDate = [];
  List<String> EDate = [];
  List<String> Desc = [];
  Future<void> PIckDate(BuildContext context, String val) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDateTime =
            DateTime(pickedDate.year, pickedDate.month, pickedDate.day);
        if (val == 'one') {
          _firstDate.text =
              "${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}";
        } else {
          _lastDate.text =
              "${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}";
        }
        // Format the selected date as a string with only the date part
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            Text(
              'Standard Procedure',
              style: GoogleFonts.ubuntu(color: Colors.blue, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            Drop('Procedure Type*', ProcedureType, ProcedureTypes, (p0) {
              setState(() {
                ProcedureType = p0!;
              });
            }),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: _Text('Start Date*', _firstDate, true,
                      () => PIckDate(context, 'one')),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: _Text('End Date*', _lastDate, true,
                      () => PIckDate(context, 'two')),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _Text('Procedure Description', _desc, false, () {}),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  type.add(ProcedureType);
                  EDate.add(_lastDate.text);
                  SDate.add(_firstDate.text);
                  Desc.add(_desc.text);
                });
              },
              child: Container(
                height: 30,
                width: 80,
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
            ),
            SizedBox(
              height: 10,
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
                                'Procedure Type*',
                                softWrap: true,
                              ))),
                      DataColumn(
                          label: SizedBox(
                              width: 70,
                              child: Text(
                                'Start Date*',
                                softWrap: true,
                              ))),
                      DataColumn(
                          label: SizedBox(
                              width: 50,
                              child: Text(
                                'End Date*',
                                softWrap: true,
                              ))),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('action')),
                    ],
                    rows: List.generate(type.length, (index) {
                      return DataRow(cells: [
                        // DataCell(Text(name ?? "")),
                        DataCell(Text(type[index])),
                        DataCell(Center(child: Text(SDate[index]))),
                        DataCell(Center(child: Text(EDate[index]))),

                        DataCell(Center(child: Text(Desc[index]))),
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
          height: 50,
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

  Widget Drop(
    String title,
    String? selectedValue,
    List<String> list,
    void Function(String?)? onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        DropdownButtonFormField<String>(
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
              // borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
            ),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ],
    );
  }
}
