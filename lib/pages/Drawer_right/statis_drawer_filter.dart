import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class StaticticDrawerFilter extends StatefulWidget {
  const StaticticDrawerFilter({super.key});

  @override
  State<StaticticDrawerFilter> createState() => _StaticticDrawerFilterState();
}

class _StaticticDrawerFilterState extends State<StaticticDrawerFilter> {
  MultiSelectController _controller = MultiSelectController();
  MultiSelectController _paracontroller = MultiSelectController();
  TextEditingController _firstDate = TextEditingController();
  TextEditingController _SecondDate = TextEditingController();
  List<String> parameter = [
    'Water Temprature',
    'Specific Conductance',
    'Salinity',
    'pH',
    'Dissolved Oxygen Saturation',
    'Turbidity',
    'Dissolved Oxygen',
    'tds',
    'Chlorophyll',
    'Depth',
    'Oxygen Reduction Potential',
    'External Voltage'
  ];
  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'Bhitarkanika National Park', value: '2'),
  ];
  List<ValueItem> items2 = [
    const ValueItem(label: 'Water Temprature', value: '1'),
    const ValueItem(label: 'Specific Conductance', value: '2'),
    const ValueItem(label: 'Salinity', value: '3'),
    const ValueItem(label: 'pH', value: '4'),
    const ValueItem(label: 'Dissolved Oxygen Saturation', value: '5'),
    const ValueItem(label: 'Turbidity', value: '6'),
    const ValueItem(label: 'Dissolved Oxygen', value: '7'),
    const ValueItem(label: 'tds', value: '8'),
    const ValueItem(label: 'Chlorophyll', value: '9'),
    const ValueItem(label: 'Depth', value: '10'),
    const ValueItem(label: 'Oxygen Reduction Potential', value: '11'),
    const ValueItem(label: 'External Voltage', value: '12'),
  ];

  DateTime? _selectedDateTime;
  TimeOfDay? pickedTime;
  Future<void> _selectDateTime(BuildContext context, String find) async {
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
      if (pickedDate != null) {
        setState(() {
          _selectedDateTime = DateTime(pickedDate.year, pickedDate.month,
              pickedDate.day, pickedTime!.hour, pickedTime!.minute);
          if (find == 'one') {
            _firstDate.text =
                "${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}  ${_selectedDateTime!.hour}:${_selectedDateTime!.minute}";
          } else if (find == 'two') {
            _SecondDate.text =
                "${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}  ${_selectedDateTime!.hour}:${_selectedDateTime!.minute}";
          }
          // Format the selected date as a string with only the date part
        });
      }
    }
  }

  bool istick = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                  title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Advance Filtering'),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Stations*'),
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
                    selectedOptions: istick
                        ? [
                            ValueItem(label: 'WQ 1', value: '1'),
                            ValueItem(
                                label: 'Bhitarkanika National Park', value: '2')
                          ]
                        : [],
                    showChipInSingleSelectMode: true,
                    selectedOptionIcon: const Icon(Icons.check_circle),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        istick = !istick;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: istick ? Colors.blue : Colors.grey,
                              strokeAlign: 1)),
                      child: Center(
                        child: istick
                            ? Icon(
                                Icons.check,
                                color: Colors.blue,
                              )
                            : SizedBox(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'All Station',
                    style: GoogleFonts.ubuntu(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'From Date*',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                controller: _firstDate,
                onTap: () => _selectDateTime(context, 'one'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'To Date*',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                controller: _SecondDate,
                onTap: () => _selectDateTime(context, 'two'),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Parameters*'),
                    MultiSelectDropDown(
                      showClearIcon: true,
                      controller: _paracontroller,
                      onOptionSelected: (options) {
                        debugPrint(options.toString());
                      },
                      options: items2,
                      selectionType: SelectionType.multi,
                      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                      dropdownHeight: 300,
                      optionTextStyle: GoogleFonts.ubuntu(fontSize: 16),
                      showChipInSingleSelectMode: true,
                      selectedOptionIcon: const Icon(Icons.check_circle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
