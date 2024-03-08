import 'package:expandable_datatable/expandable_datatable.dart';

import '../../../controllers/report_Controller.dart';

class ReportTableData {
  final List<ExpandableColumn<dynamic>> headers = [
    ExpandableColumn<String>(columnTitle: "Station Name", columnFlex: 1),
    ExpandableColumn<String>(columnTitle: "Date", columnFlex: 1),
    ExpandableColumn<String>(columnTitle: "Time", columnFlex: 1),
    ExpandableColumn<String>(columnTitle: "Water Temperature", columnFlex: 3),
    ExpandableColumn<String>(columnTitle: "Water Pressure", columnFlex: 3),
    ExpandableColumn<String>(
        columnTitle: "Specific Conductance", columnFlex: 3),
    ExpandableColumn<String>(columnTitle: "Salinity", columnFlex: 2),
    ExpandableColumn<String>(columnTitle: "pH", columnFlex: 2),
    ExpandableColumn<String>(
        columnTitle: "Dissolved Oxygen Saturation", columnFlex: 5),
    ExpandableColumn<String>(columnTitle: "Turbidity", columnFlex: 2),
    ExpandableColumn<String>(columnTitle: "Dissolved Oxygen", columnFlex: 3),
    ExpandableColumn<String>(columnTitle: "TDS", columnFlex: 2),
    ExpandableColumn<String>(columnTitle: "Chlorophyll", columnFlex: 2),
    ExpandableColumn<String>(columnTitle: "Depth", columnFlex: 2),
    ExpandableColumn<String>(
        columnTitle: "Oxidation Reduction Potential", columnFlex: 5),
    ExpandableColumn<String>(columnTitle: "External Voltage", columnFlex: 3),
  ];

  final List<ExpandableRow> rows = ReportTableControlller()
      .ReportTableModelList
      .map(
        (e) => ExpandableRow(
          cells: [
            ExpandableCell(columnTitle: 'Station Name', value: e.stationName),
            ExpandableCell(columnTitle: 'Date', value: e.date),
            ExpandableCell(columnTitle: 'Time', value: e.time),
            ExpandableCell(
                columnTitle: 'Water Temperature', value: e.waterTemperature),
            ExpandableCell(
                columnTitle: 'Water Pressure', value: e.waterPressure),
            ExpandableCell(
                columnTitle: 'Specific Conductance',
                value: e.specificConductance),
            ExpandableCell(columnTitle: 'Salinity', value: e.salinity),
            ExpandableCell(columnTitle: 'pH', value: e.pH),
            ExpandableCell(
                columnTitle: 'Dissolved Oxygen Saturation',
                value: e.dissolvedOxygenSaturation),
            ExpandableCell(columnTitle: 'Turbidity', value: e.turbidity),
            ExpandableCell(
                columnTitle: 'Dissolved Oxygen', value: e.dissolvedOxygen),
            ExpandableCell(columnTitle: 'TDS', value: e.tds),
            ExpandableCell(columnTitle: 'Chlorophyll', value: e.chlorophyll),
            ExpandableCell(columnTitle: 'Depth', value: e.depth),
            ExpandableCell(
                columnTitle: 'Oxidation Reduction Potential',
                value: e.oxidationReductionPotential),
            ExpandableCell(
                columnTitle: 'External Voltage', value: e.externalVoltage),
          ],
        ),
      )
      .toList();
}
