// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/style.dart';

class ConfiguyrationTab extends StatefulWidget {
  const ConfiguyrationTab({super.key});

  @override
  State<ConfiguyrationTab> createState() => _ConfiguyrationTabState();
}

class _ConfiguyrationTabState extends State<ConfiguyrationTab> {
  TextEditingController Dateone = TextEditingController();
  TextEditingController Datetwo = TextEditingController();
  TextEditingController Noc = TextEditingController();
  TextEditingController Non = TextEditingController();
  DateTime? _selectedDateTime;
  bool isChecked = false;
  String _SeletedName = 'wQ 1';

  List<String> StationName = ['wQ 1', 'Bhitarkanika National Park'];

  Future<void> _selectDateTime(BuildContext context, String find) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        );
        if (find == 'one') {
          Dateone.text =
              "${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}";
        } else if (find == 'two') {
          Datetwo.text =
              "${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}";
        }
        // Format the selected date as a string with only the date part
      });
    }
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Maintenance Period(Years)*'),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: Non,
                      decoration: const InputDecoration(
                        // labelText: 'Select Date and Time',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(' Maintenance Start Date*'),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: Dateone,
                      decoration: InputDecoration(
                        // labelText: 'Select Date and Time',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => _selectDateTime(context, 'one'),
                        ),
                      ),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Maintenance End Date*'),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: Datetwo,
                      decoration: InputDecoration(
                        // labelText: 'Select Date and Time',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => _selectDateTime(context, 'two'),
                        ),
                      ),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Maintenance Cycle Type*'),
              Drop(_SeletedName, StationName, (newValue) {
                setState(() {
                  _SeletedName = newValue!;
                });
              }),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('No of Cycles(Yearly)*'),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: Noc,
                      decoration: const InputDecoration(
                        // labelText: 'Select Date and Time',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('No of Notify Days*'),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: Non,
                      decoration: const InputDecoration(
                        // labelText: 'Select Date and Time',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isChecked ? AppColor.Blue : Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: isChecked
                            ? Icon(
                                Icons.check,
                                color: AppColor.Blue,
                              )
                            : const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Enable Maintanance Notification',
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(children: [
                Container(
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
              ])
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
