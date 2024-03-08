import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenace_Reports/widget/add_report.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class MaintenanceReports extends StatefulWidget {
  const MaintenanceReports({super.key});

  @override
  State<MaintenanceReports> createState() => _MaintenanceReportsState();
}

class _MaintenanceReportsState extends State<MaintenanceReports> {
  String _selectedItem = 'Selected 1';
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Showing of',
              style: GoogleFonts.ubuntu(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 240,
              child: DropdownButtonFormField<String>(
                value: _selectedItem,
                items: <String>[
                  'Selected 1',
                  'Selected 2',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                  });
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      border: Border.all(color: Colors.lightBlue)),
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.lightBlue,
                      ),
                      label: Text(
                        'Filter',
                        style: GoogleFonts.ubuntu(color: Colors.lightBlue),
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      border: Border.all(color: Colors.lightBlue)),
                  child: TextButton.icon(
                      onPressed: () {
                        _showTopModal();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.lightBlue,
                      ),
                      label: Text(
                        'Add Report',
                        style: GoogleFonts.ubuntu(color: Colors.lightBlue),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Future<void> _showTopModal() async {
    final value = await showTopModalSheet<String?>(
      context,
      const AddReportPage(),
      backgroundColor: Colors.white,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    );
  }
}
