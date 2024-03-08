import 'package:get/get.dart';

import '../model/dm_model.dart';

class DmTableController extends GetxController {
  final List<DmTableModel> dmTableModelList = [
    DmTableModel(
        stationName: 'WQ1',
        date: '22/02/2024',
        time: '23:50:00',
        waterTemperature: '27.78',
        waterPressure: '0.544',
        specificConductance: '40362.0',
        salinity: '26.23',
        pH: '7.93',
        dissolvedOxygenSaturation: '83.5',
        turbidity: '521.3',
        dissolvedOxygen: '6.543',
        tds: '26.24',
        chlorophyll: '0.21',
        depth: '0.57',
        oxidationReductionPotential: '204.4',
        externalVoltage: '13.44'),
    DmTableModel(
        stationName: 'WQ1',
        date: '22/02/2024',
        time: '23:60:00',
        waterTemperature: '28.03',
        waterPressure: '0.505',
        specificConductance: '40013.0',
        salinity: '25.98',
        pH: '7.8',
        dissolvedOxygenSaturation: '83.4',
        turbidity: '102.4',
        dissolvedOxygen: '6.504',
        tds: '26.01',
        chlorophyll: '0.04',
        depth: '0.54',
        oxidationReductionPotential: '204',
        externalVoltage: '13.89')
  ];
}
