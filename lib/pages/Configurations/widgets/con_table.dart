import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfigTable extends StatefulWidget {
  String parameter;
  String unit;
  String warning;
  String danger;
  String notification;
  ConfigTable(
      {super.key,
      required this.parameter,
      required this.unit,
      required this.warning,
      required this.danger,
      required this.notification});

  @override
  State<ConfigTable> createState() => _ConfigTableState();
}

class _ConfigTableState extends State<ConfigTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          const Text('Water Quality Parameters'),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 15,
              columns: const [
                DataColumn(label: Text('Parameter')),
                DataColumn(label: Text('Unit')),
                DataColumn(
                  label: SizedBox(
                      width: 70,
                      child: Text('Warning Threshold', softWrap: true)),
                ),
                DataColumn(
                  label: SizedBox(
                      width: 70,
                      child: Text('Danger Threshold', softWrap: true)),
                ),
                DataColumn(label: Text('Notification')),
                DataColumn(label: Text('Action'))
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Center(child: Text(widget.parameter))),
                    DataCell(Center(child: Text(widget.unit))),
                    DataCell(Center(child: Text(widget.warning))),
                    DataCell(Center(child: Text(widget.danger))),
                    DataCell(Center(child: Text(widget.notification))),
                    DataCell(IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.lightBlue))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
