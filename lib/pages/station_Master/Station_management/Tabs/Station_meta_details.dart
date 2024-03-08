// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

class StationMetaDetails extends StatefulWidget {
  const StationMetaDetails({super.key});

  @override
  State<StationMetaDetails> createState() => _StationMetaDetailsState();
}

class _StationMetaDetailsState extends State<StationMetaDetails> {
  int? _sortColumnIndex;
  String? _selectedItem;
  final bool _sortAscending = true;
  TextEditingController seriaNumber1 = TextEditingController();
  TextEditingController seriaNumber2 = TextEditingController();
  TextEditingController seriaNumber3 = TextEditingController();
  TextEditingController seriaNumber4 = TextEditingController();
  TextEditingController brand1 = TextEditingController();
  TextEditingController brand2 = TextEditingController();
  TextEditingController brand3 = TextEditingController();
  TextEditingController brand4 = TextEditingController();
  TextEditingController warenty1 = TextEditingController();
  TextEditingController warenty2 = TextEditingController();
  TextEditingController warenty3 = TextEditingController();
  TextEditingController warenty4 = TextEditingController();

  final List<Map<String, dynamic>> _data = List.generate(
    4, // Number of rows
    (index) => {
      'Name': 'Item $index',
      'Serial Number': '',
      'Brand': '',
      'Installation Date': DateTime.now(),
      'Warranty (Months)': ''
    },
  );

  void _updateData(Map<String, dynamic> newData) {
    setState(() {
      final index = _data.indexWhere((item) => item['Name'] == newData['Name']);
      if (index != -1) {
        _data[index] = newData;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 6.0)
            ]),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Station*',
                    style: GoogleFonts.ubuntu(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: DropdownButtonFormField<String>(
                          value: _selectedItem,
                          items: <String>['wQ 1', 'Bhitarkanika National Park']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        width: 110,
                      )
                    ],
                  ),
                ],
              ),
            ),
            PaginatedDataTable(
              rowsPerPage: 7,
              onRowsPerPageChanged: (newRowsPerPage) {
                setState(() {});
              },
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columnSpacing: 20,
              // ignore: deprecated_member_use
              dataRowHeight: 60,
              availableRowsPerPage: const [7, 10, 15],
              columns: const [
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: SizedBox(
                      width: 60,
                      child: Text(
                        'Serial Number',
                        softWrap: true,
                      )),
                ),
                DataColumn(
                  label: Text('Brand'),
                ),
                DataColumn(
                  label: SizedBox(
                      width: 60,
                      child: Text(
                        'Installation Date',
                        softWrap: true,
                      )),
                ),
                DataColumn(
                  label: Text('Warranty (Months)'),
                ),
              ],
              source: _DataSource(context, _data, _updateData),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColor.Blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        'Upadte',
                        style: GoogleFonts.ubuntu(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final BuildContext _context;
  final List<Map<String, dynamic>> _data;
  final Function(Map<String, dynamic>) _updateDataCallback;

  _DataSource(this._context, this._data, this._updateDataCallback);

  @override
  DataRow getRow(int index) {
    final rowData = _data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Container(
            height: 50,
            width: 60,
            color: AppColor.Blue,
            child: Center(child: Text(rowData['Name'])))),
        DataCell(Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: 60,
            child: TextField(
              maxLines: 1,
              onChanged: (value) {
                rowData['Serial Number'] = value;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Enter serial number',
              ),
            ),
          ),
        )),
        DataCell(SizedBox(
          width: 60,
          child: TextField(
            onChanged: (value) {
              rowData['Brand'] = value;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              hintText: 'Enter brand',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        )),
        DataCell(
          TextButton(
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: _context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                _updateDataCallback(
                    {...rowData, 'Installation Date': pickedDate});
              }
            },
            child: Text(rowData['Installation Date'].toString()),
          ),
        ),
        DataCell(SizedBox(
          width: 60,
          child: TextField(
            onChanged: (value) {
              rowData['Warranty (Months)'] = value;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              hintText: 'Enter warranty (months)',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        )),
      ],
    );
  }

  @override
  int get rowCount => _data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
