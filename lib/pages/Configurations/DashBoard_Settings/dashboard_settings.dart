import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class DashBoardSettings extends StatefulWidget {
  const DashBoardSettings({super.key});

  @override
  State<DashBoardSettings> createState() => _DashBoardSettingsState();
}

class _DashBoardSettingsState extends State<DashBoardSettings> {
  String _selectedItem1 = 'Single dashboard';
  String _selectedItem2 = 'Water Quality';
  bool isChecked = false;
  final MultiSelectController _controller = MultiSelectController();

  List<ValueItem> items = [
    const ValueItem(label: 'Water Pressure', value: '1'),
    const ValueItem(label: 'Specific conductance', value: '2'),
    const ValueItem(label: 'salinity', value: '3'),
    const ValueItem(label: 'pH', value: '4'),
    const ValueItem(label: 'Disolved oxygen saturation', value: '5'),
    const ValueItem(label: 'turbidity', value: '6'),
    const ValueItem(label: 'Disolved oxygen', value: '7'),
    const ValueItem(label: 'tds', value: '8'),
    const ValueItem(label: 'clorophile', value: '9'),
    const ValueItem(label: 'depth', value: '10'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 2),
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6.0),
                ]),
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard Settings',
                    style: GoogleFonts.ubuntu(fontSize: 20),
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedItem1,
                    items: <String>['Single dashboard', 'Slide show dasdboard']
                        .map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) => setState(
                      () {
                        _selectedItem1 = newValue!;
                      },
                    ),
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey))),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Text(
                        'Save',
                        style: GoogleFonts.ubuntu(color: Colors.white),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Customized Dashboard Widgets'),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Select Sensor*'),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _selectedItem2,
                      items: ['Water Quality'].map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) => setState(
                        () {
                          _selectedItem2 = newValue!;
                        },
                      ),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 70.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Customize radius here
                              border: Border.all(
                                color: isChecked
                                    ? Colors.lightBlue
                                    : Colors.grey.withOpacity(0.2),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: isChecked
                                  ? const Icon(
                                      Icons.check,
                                      size: 30.0,
                                      color: Colors.lightBlue,
                                    )
                                  : const Icon(
                                      Icons.check_box_outline_blank,
                                      size: 30.0,
                                      color: Colors.transparent,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Enable',
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 2),
                              blurRadius: 6.0,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: MultiSelectDropDown(
                          showClearIcon: true,
                          controller: _controller,
                          onOptionSelected: (options) {
                            debugPrint(options.toString());
                          },
                          options: items,
                          selectionType: SelectionType.multi,
                          chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                          dropdownHeight: 500,
                          optionTextStyle: GoogleFonts.ubuntu(fontSize: 16),
                          showChipInSingleSelectMode: true,
                          selectedOptionIcon: const Icon(Icons.check_circle),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(
                              'Update',
                              style: GoogleFonts.ubuntu(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 131, 216, 255),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
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
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Sensor Name')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Activated Parameters')),
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('')),
                        ],
                        rows: const [
                          DataRow(cells: [
                            DataCell(Text('Water Quality')),
                            DataCell(Text('Enabled')),
                            DataCell(Text('12')),
                            DataCell(Icon(
                              Icons.edit,
                              color: Colors.lightBlue,
                            )),
                            DataCell(Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
