import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class PrimaryDetails extends StatefulWidget {
  final VoidCallback onNext;
  PrimaryDetails({super.key, required this.onNext});

  @override
  State<PrimaryDetails> createState() => _PrimaryDetailsState();
}

class _PrimaryDetailsState extends State<PrimaryDetails> {
  TextEditingController _date = TextEditingController();
  MultiSelectController _controller = MultiSelectController();
  DateTime? _selectedDateTime;
  String SelectedMType = 'Preventive Maintenance';
  List<String> MType = ['Preventive Maintenance', 'Corrective Maintenance'];
  String Station = 'WQ 1';
  List<String> Stations = ['WQ 1', 'Bhitarkanika Nation Park'];
  String Vtype = 'Schedule';
  List<String> Vtypes = ['Schedule', 'Urgent', 'On Call', 'Others'];
  String priority = 'High';
  List<String> priorities = [
    'High',
    'Medium'
        'Low'
  ];
  String SelectedAssign = 'Assign Member 1';
  List<String> AssignTo = ['Assign Member 1', 'Assign Member 2'];
  List<ValueItem> items = [
    const ValueItem(label: 'Team Member 1', value: '1'),
    const ValueItem(label: 'Team Member 2', value: '2'),
  ];
  List<ValueItem> items2 = [
    const ValueItem(label: 'Assign Member 1', value: '1'),
    const ValueItem(label: 'Assign Member 2', value: '2'),
  ];

  Future<void> PIckDate(BuildContext context) async {
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

        _date.text =
            "${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}";

        // Format the selected date as a string with only the date part
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                'Primary Details',
                style: GoogleFonts.ubuntu(color: Colors.blue, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Drop('Maintenance Type*', SelectedMType, MType, (p0) {
                setState(() {
                  SelectedMType = p0!;
                });
              }),
              SizedBox(
                height: 10,
              ),
              Drop('Stations*', Station, Stations, (p0) {
                setState(() {
                  Station = p0!;
                });
              }),
              SizedBox(
                height: 10,
              ),
              _Text('Date', _date, true, () => PIckDate(context)),
              SizedBox(
                height: 10,
              ),
              Drop('Visit Type*', Vtype, Vtypes, (p0) {
                setState(() {
                  Vtype = p0!;
                });
              }),
              SizedBox(
                height: 10,
              ),
              Drop('Priority*', priority, priorities, (p0) {
                setState(() {
                  priority = p0!;
                });
              }),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sensors*'),
                  MultiSelectDropDown(
                    showClearIcon: true,
                    controller: _controller,
                    onOptionSelected: (options) {
                      debugPrint(options.toString());
                    },
                    options: items,
                    selectionType: SelectionType.multi,
                    chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                    dropdownHeight: 300,
                    optionTextStyle: GoogleFonts.ubuntu(fontSize: 16),
                    showChipInSingleSelectMode: true,
                    selectedOptionIcon: const Icon(Icons.check_circle),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Drop('Assign To*', SelectedAssign, AssignTo, (p0) {
                setState(() {
                  SelectedAssign = p0!;
                });
              }),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.onNext();
                      });
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
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
}
