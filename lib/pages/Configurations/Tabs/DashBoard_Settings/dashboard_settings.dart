import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../widgets/con_drop.dart';
import '../../widgets/tab_tick.dart';

class DashBoardSettings extends StatefulWidget {
  const DashBoardSettings({super.key});

  @override
  State<DashBoardSettings> createState() => _DashBoardSettingsState();
}

class _DashBoardSettingsState extends State<DashBoardSettings> {
  final MultiSelectController _controller = MultiSelectController();

  final String _dashboardSelected = 'Single dashboard';
  final List<String> _dashboardList = [
    'Single dashboard',
    'SlideShow dashboard'
  ];

  final String _sensorSelected = 'Water Quality';
  final List<String> _sensorList = ['Water Quality'];

  List<ValueItem> items = [
    const ValueItem(label: 'Water Temperature', value: '1'),
    const ValueItem(label: 'Water pressure', value: '2'),
    const ValueItem(label: 'Specific Conductance', value: '3'),
    const ValueItem(label: 'Salinity', value: '4'),
    const ValueItem(label: 'pH', value: '5'),
    const ValueItem(label: 'Dissolved Oxygen Saturation', value: '6'),
    const ValueItem(label: 'Turbidity', value: '7'),
    const ValueItem(label: 'Dissolved Oxygen', value: '8'),
    const ValueItem(label: 'tds', value: '9'),
    const ValueItem(label: 'Chlorophyll', value: '10'),
    const ValueItem(label: 'Depth', value: '11'),
    const ValueItem(label: 'Oxidation Reduction Potential', value: '12'),
    const ValueItem(label: 'External Voltage', value: '13'),
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
                  const Text(
                    'Dashboard Settings',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ConfigDrop(
                            val: _dashboardSelected, items: _dashboardList),
                      ),
                      const SizedBox(
                        width: 10,
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
                          child: const Center(
                              child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Customized Dashboard Widgets',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Select Sensor*',
                    style: TextStyle(fontSize: 18),
                  ),
                  ConfigDrop(val: _sensorSelected, items: _sensorList),
                  const SizedBox(
                    height: 15,
                  ),
                  TabTick(val: 'Enable'),
                  const SizedBox(
                    height: 15,
                  ),
                  MultiSelectDropDown(
                    showClearIcon: false,
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
                    selectedOptionTextColor: Colors.lightBlue,
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
                          child: const Center(
                            child: Text(
                              'Update',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _controller.clearAllSelection();
                        },
                        icon: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 131, 216, 255),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Clear',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                        columnSpacing: 20,
                        columns: const [
                          DataColumn(
                              label: SizedBox(
                                  width: 60,
                                  child: Text(
                                    'Sensor Name',
                                    softWrap: true,
                                  ))),
                          DataColumn(label: Text('Status')),
                          DataColumn(
                              label: SizedBox(
                                  width: 75,
                                  child: Text(
                                    'Activated Parameters',
                                    softWrap: true,
                                  ))),
                          DataColumn(label: Text('action')),
                        ],
                        rows: const [
                          DataRow(cells: [
                            DataCell(SizedBox(
                                width: 60,
                                child: Text(
                                  'Water Quality',
                                  softWrap: true,
                                ))),
                            DataCell(Text('Enabled')),
                            DataCell(Center(child: Text('12'))),
                            DataCell(Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.lightBlue,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )
                              ],
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
