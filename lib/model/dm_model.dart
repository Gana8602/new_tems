class DmTableModel {
  final String stationName;
  final String date;
  final String time;
  final String waterTemperature;
  final String waterPressure;
  final String specificConductance;
  final String salinity;
  final String pH;
  final String dissolvedOxygenSaturation;
  final String turbidity;
  final String dissolvedOxygen;
  final String tds;
  final String chlorophyll;
  final String depth;
  final String oxidationReductionPotential;
  final String externalVoltage;

  DmTableModel(
      {required this.stationName,
      required this.date,
      required this.time,
      required this.waterTemperature,
      required this.waterPressure,
      required this.specificConductance,
      required this.salinity,
      required this.pH,
      required this.dissolvedOxygenSaturation,
      required this.turbidity,
      required this.dissolvedOxygen,
      required this.tds,
      required this.chlorophyll,
      required this.depth,
      required this.oxidationReductionPotential,
      required this.externalVoltage});
}
