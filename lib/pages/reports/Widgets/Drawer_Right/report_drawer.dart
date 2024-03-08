import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import 'drawer_date.dart';

class ReportDrawerRight extends StatefulWidget {
  const ReportDrawerRight({super.key});

  @override
  State<ReportDrawerRight> createState() => _ReportDrawerRightState();
}

class _ReportDrawerRightState extends State<ReportDrawerRight> {
  String selectedUnit = 'Date Range';
  String? selectedYear;
  String? selectedMonth;
  List<String> Categories5 = ['Date Range', 'Weekly', 'Monthly', 'Yearly'];
  // ignore: non_constant_identifier_names
  final DrawerDate _DAteController = Get.put(DrawerDate());
  final MultiSelectController _controller = MultiSelectController();
  final TextEditingController _dateController = TextEditingController();

  bool _selectAll = false;
  void _selectWeek(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) {
        // Allow selection only if the day is Monday (1) to Sunday (7)
        return date.weekday >= DateTime.monday &&
            date.weekday <= DateTime.sunday;
      },
    );

    if (pickedDate != null) {
      // Calculate the start and end dates of the selected week
      DateTime startDate =
          pickedDate.subtract(Duration(days: pickedDate.weekday - 1));
      DateTime endDate =
          pickedDate.add(Duration(days: DateTime.sunday - pickedDate.weekday));

      // Update the text field with the selected week range
      setState(() {
        _dateController.text =
            '${startDate.day}/${startDate.month}/${startDate.year} - ${endDate.day}/${endDate.month}/${endDate.year}';
      });
    }
  }

  DateTime? _startDate;
  DateTime? _endDate;

  void _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) {
        return date.day <= 31; // Restricting to days up to 31st of each month
      },
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  void _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      selectableDayPredicate: (DateTime date) {
        return date.day <= 31; // Restricting to days up to 31st of each month
      },
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  // String selectedYear = '';

  List<String> years = [];

  void generateYearDropdown() {
    int currentYear = DateTime.now().year;
    for (int year = 2023; year <= currentYear && year <= 2024; year++) {
      years.add(year.toString());
    }
    selectedYear = years.first; // Initialize with the first year
  }

  @override
  void initState() {
    super.initState();
    generateYearDropdown();
  }

  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'Bhitarkanika National Park', value: '2'),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const ListTile(
                title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Advance Filtering'), Icon(Icons.close)],
            )),
            ListTile(
              title: const Text('Station*'),
              onTap: () {}, // Add functionality as needed
            ),
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
              optionTextStyle: const TextStyle(fontSize: 16),
              showChipInSingleSelectMode: true,
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),
            ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _selectAll,
                    onChanged: (value) {
                      setState(() {
                        _selectAll = value!;
                        if (_selectAll) {
                          // Select all options
                          // _controller.setSelectedOptions(
                          //     items.map((e) => e.value).toList());

                          // .toList());
                        } else {
                          // Deselect all options
                          _controller.clearAllSelection();
                        }
                      });
                    },
                  ),
                  const Text('Select All'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedUnit,
                    items: Categories5.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Genarate For',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedUnit = value!;
                      });
                    },
                  ),
                  if (selectedUnit == 'Date Range')
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        TextField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'From Date*',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          controller: TextEditingController(
                            text: _startDate == null
                                ? 'Select Start Date'
                                : DateFormat('yyyy-MM-dd').format(_startDate!),
                          ),
                          onTap: () => _selectStartDate(context),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'End Date*',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          controller: TextEditingController(
                            text: _endDate == null
                                ? 'Select Start Date'
                                : DateFormat('yyyy-MM-dd').format(_endDate!),
                          ),
                          onTap: () => _selectEndDate(context),
                        ),
                        // Include your date range selection fields here
                      ],
                    ),
                  if (selectedUnit == 'Yearly')
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: selectedYear,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedYear = newValue!;
                              // Regenerate months when year changes
                            });
                          },
                          items: years
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: 'Value',
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        // Include your yearly selection field here
                      ],
                    ),
                  if (selectedUnit == 'Weekly')
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        TextField(
                          controller: _dateController,
                          readOnly: true,
                          onTap: () {
                            _selectWeek(context);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Select Week',
                            border: OutlineInputBorder(),
                          ),
                        )
                        // Include your weekly selection field here
                      ],
                    ),
                  if (selectedUnit == 'Monthly')
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          value: selectedYear,
                          hint: const Text('Select Year'),
                          onChanged: (newValue) {
                            setState(() {
                              selectedYear = newValue;
                              // Reset the selected month when the year changes
                              selectedMonth = null;
                            });
                          },
                          items: years.map((year) {
                            return DropdownMenuItem<String>(
                              value: year,
                              child: Text(year),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: 'Year',
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: selectedMonth,
                          hint: const Text('Select Month'),
                          onChanged: (newValue) {
                            setState(() {
                              selectedMonth = newValue;
                            });
                          },
                          items: _DAteController.months.where((month) {
                            // Show only months up to the current month if the selected year is the current year
                            if (selectedYear ==
                                DateTime.now().year.toString()) {
                              final currentMonth = DateTime.now().month;
                              final monthIndex =
                                  _DAteController.months.indexOf(month) + 1;
                              return monthIndex <= currentMonth;
                            }
                            return true; // Show all months for previous years
                          }).map((month) {
                            return DropdownMenuItem<String>(
                              value: month,
                              child: Text(month),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: 'Month',
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        // Include your monthly selection fields here
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
