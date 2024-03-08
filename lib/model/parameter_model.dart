import 'package:get/get.dart';

class ParameterModel extends GetxController {
  List<Map<String, dynamic>> param = [
    {
      'Sensors*': 'Water Quality',
      'Parameter*': 'Water Temparature',
      'Unit*': '°C',
      'Minimum Value*': '-5',
      'Maximum Value*': '50',
      'Warning Threshold*': '30',
      'Danger Threshold*': '40',
      'Round To*': '2',
    },
    {
      'Sensors*': 'Water Quality',
      'Parameter*': 'Specific Conductance',
      'Unit*': '',
      'Minimum Value*': '',
      'Maximum Value*': '',
      'Warning Threshold*': '',
      'Danger Threshold*': '',
      'Round To*': '',
    },
    {
      'Sensors*': 'Water Quality',
      'Parameter*': 'Salinity',
      'Unit*': 'PSU',
      'Minimum Value*': '0',
      'Maximum Value*': '350',
      'Warning Threshold*': '15',
      'Danger Threshold*': '25',
      'Round To*': '2',
    },
    {
      'Sensors*': 'Water Quality',
      'Parameter*': 'pH',
      'Unit*': '',
      'Minimum Value*': '0',
      'Maximum Value*': '14',
      'Warning Threshold*': '9',
      'Danger Threshold*': '11',
      'Round To*': '2',
    },
    {
      'Sensors*': 'Water Quality',
      'Parameter*': 'Dissolved Oxygen Saturation',
      'Unit*': '%',
      'Minimum Value*': '0',
      'Maximum Value*': '100',
      'Warning Threshold*': '98',
      'Danger Threshold*': '100',
      'Round To*': '2',
    },
  ];
}
