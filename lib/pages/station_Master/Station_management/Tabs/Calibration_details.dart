// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

class CalibrationDetails extends StatefulWidget {
  const CalibrationDetails({super.key});

  @override
  State<CalibrationDetails> createState() => _CalibrationDetailsState();
}

class _CalibrationDetailsState extends State<CalibrationDetails> {
  final TextEditingController _remarks = TextEditingController();
  TextEditingController nameee = TextEditingController();
  String _SeletedName = 'wQ 1';
  String _selectedSensor = 'Factory';
  String _SelectedCaliType = 'WATER QUALITY';
  String? PickedDate;

  DateTime? _selectedDateTime;
  String SelectedStatus = 'Pass';
  TextEditingController datecontroller = TextEditingController();

  String? name;
  String? sen;
  String? type;
  DateTime? date;
  String? status;
  String? remark;

  List<String> StationName = ['wQ 1', 'Bhitarkanika National Park'];
  List<String> CalibrationType = [
    'WATER QUALITY',
    'DATA LOGGER',
    'MODEM',
    'DATA BUOY'
  ];
  List<String> sensor = [];

  List<String> calitype = [];
  List<String> calidate = [];
  List<String> calistat = [];
  List<String> calremark = [];

  List<String> SensorNAme = ['Factory', 'Onsite'];
  List<String> Status = ['Pass', 'Fail'];

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          datecontroller.text = _selectedDateTime!.toString();
        });
      }
    }
  }

  void editRow(int index) {
    setState(() {
      // Update controllers and selected values with the values of the selected row
      _selectedSensor = sensor[index];
      _SelectedCaliType = calitype[index];
      datecontroller.text = calidate[index];
      // _selectedDateTime = DateTime.parse(calidate[index]);
      SelectedStatus = calistat[index];
      _remarks.text = calremark[index];
    });
  }

  void clearFields() {
    setState(() {
      _SeletedName = 'wQ 1';
      _selectedSensor = 'Factory';
      _SelectedCaliType = 'WATER QUALITY';
      _selectedDateTime = null;
      SelectedStatus = 'Pass';
      _remarks.text = '';
      datecontroller.clear();
      // Clear other relevant state variables and controllers here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 6.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Station Name*'),
                  const SizedBox(
                    height: 5,
                  ),
                  Drop(_SeletedName, StationName, (newValue) {
                    setState(() {
                      _SeletedName = newValue!;
                      nameee.text = newValue;
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sensor Name*'),
                  const SizedBox(
                    height: 5,
                  ),
                  Drop(_selectedSensor, SensorNAme, (newValue) {
                    setState(() {
                      _selectedSensor = newValue!;
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Calibration Type*'),
                  const SizedBox(
                    height: 5,
                  ),
                  Drop(_SelectedCaliType, CalibrationType, (newValue) {
                    setState(() {
                      _SelectedCaliType = newValue!;
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Calibration Date*'),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: datecontroller,
                      decoration: InputDecoration(
                        // labelText: 'Select Date and Time',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => _selectDateTime(context),
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
                  const Text('Status*'),
                  const SizedBox(
                    height: 5,
                  ),
                  Drop(SelectedStatus, Status, (newValue) {
                    setState(() {
                      SelectedStatus = newValue!;
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Remark*'),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _remarks,
                      decoration: const InputDecoration(
                        // contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            sensor.add(_selectedSensor);
                            calitype.add(_SelectedCaliType);
                            calidate.add(_selectedDateTime.toString());
                            calistat.add(SelectedStatus);
                            calremark.add(_remarks.text);
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              color: AppColor.Blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Center(
                            child: Text(
                              'Add',
                              style: GoogleFonts.ubuntu(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      InkWell(
                        onTap: () {
                          clearFields();
                        },
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              color: AppColor.Blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Center(
                            child: Text(
                              'Clear',
                              style: GoogleFonts.ubuntu(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text('Station : '),
                      Text(
                        '$_SeletedName',
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columnSpacing: 10,
                          columns: const [
                            DataColumn(
                                label: SizedBox(
                                    width: 60,
                                    child: Text(
                                      'Sensor Name',
                                      softWrap: true,
                                    ))),
                            DataColumn(
                                label: SizedBox(
                                    width: 70,
                                    child: Text(
                                      'Calibration type',
                                      softWrap: true,
                                    ))),
                            DataColumn(
                                label: SizedBox(
                                    width: 75,
                                    child: Text(
                                      'Calibration date',
                                      softWrap: true,
                                    ))),
                            DataColumn(label: Text('status')),
                            DataColumn(label: Text('remark')),
                            DataColumn(label: Text('action')),
                          ],
                          rows: List.generate(sensor.length, (index) {
                            return DataRow(cells: [
                              // DataCell(Text(name ?? "")),
                              DataCell(Text(sensor[index])),
                              DataCell(Center(child: Text(calitype[index]))),
                              DataCell(Center(child: Text(calidate[index]))),
                              DataCell(Center(child: Text(calistat[index]))),
                              DataCell(Center(child: Text(calremark[index]))),
                              DataCell(Row(
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
                                  const SizedBox(
                                    width: 5,
                                  ),
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
            ],
          ),
        ),
      ),
    );
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
