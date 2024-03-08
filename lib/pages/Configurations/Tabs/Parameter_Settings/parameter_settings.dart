import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../model/parameter_model.dart';
import '../../widgets/con_drop.dart';
import '../../widgets/con_table.dart';
import '../../widgets/con_text.dart';
import '../../widgets/tab_tick.dart';

class ParameterSettings extends StatefulWidget {
  const ParameterSettings({super.key});

  @override
  State<ParameterSettings> createState() => _ParameterSettingsState();
}

class _ParameterSettingsState extends State<ParameterSettings> {
  final String _sensorSelected = 'Water Quality';
  final List<String> _sensorList = ['Water Quality', 'Others'];
  ParameterModel param = Get.put(ParameterModel());

  final String _parameterSelected = 'Water Temparature';
  final List<String> _parametersList = [
    'Water Temparature',
    'Specific Conductance',
    'Salinity',
    'pH',
    'Dissolved Oxygen Saturation',
    'Turbidity',
    'Dissolved Oxygen',
    'tds',
    'Depth',
    'Chlorophyll',
    'Water Pressure',
    'Oxidation Reduction Potential',
    'External Voltage'
  ];

  final String _unitSelected = '°C';
  final List<String> _unitList = ['°C'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Parameter Settings',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Sensors*',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      ConfigDrop(val: _sensorSelected, items: _sensorList),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Parameter*',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      ConfigDrop(
                          val: _parameterSelected, items: _parametersList)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Unit*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigDrop(val: _unitSelected, items: _unitList)
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Minimum Value*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(val: '-5')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Maximum Value*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(val: '50')
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Warning Threshold*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(val: '30')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Danger Threshold*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(val: '40')
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Round To*',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            ConfigText(val: '2')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TabTick(val: 'Display on home'),
                  const SizedBox(
                    height: 20,
                  ),
                  TabTick(val: 'Enable Notification'),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: IconButton(
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
                          'Update',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ConfigTable(
                parameter: 'Water Temparature',
                unit: 'C',
                warning: "30",
                danger: '40',
                notification: 'Enabled')
          ],
        ),
      ),
    );
  }
}
