// ignore_for_file: unused_import

import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';
// import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/bool/bool_values.dart';
import 'package:route_between_two_points/controllers/drawer_controller.dart';
import 'package:route_between_two_points/controllers/report_Controller.dart';
import 'package:route_between_two_points/pages/Drawer_right/drawer_right.dart';
import 'package:route_between_two_points/pages/Drawer_right/filter_drawer.dart';
import 'package:route_between_two_points/pages/reports/widget/report_data.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/widget/drawer_left/drawer_left.dart';
import 'package:route_between_two_points/pages/widget/float_Button.dart';
import 'package:route_between_two_points/utils/string.dart';

import '../../utils/style.dart';

class ExpandableTableExample extends StatefulWidget {
  const ExpandableTableExample({super.key});

  @override
  State<ExpandableTableExample> createState() => _ExpandableTableExampleState();
}

class _ExpandableTableExampleState extends State<ExpandableTableExample> {
  // final ReportController controller = Get.put(ReportController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DrawerStrings _string = Get.put(DrawerStrings());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Head(context),
      floatingActionButton: const FloatButton(),
      endDrawer: DataQADra(),
      drawer: Drawerleft(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Text('Reports', style: GoogleFonts.ubuntu(fontSize: 20)),
          // const Row(
          //   children: [Text('Home | '), Text('Reports')],
          // ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                _string.drawervalue = 'reportFilter';
              });

              _scaffoldKey.currentState!.openEndDrawer();
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.Blue, width: 0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(
                  child: Text(
                '+ Filter',
                style: GoogleFonts.ubuntu(color: AppColor.Blue, fontSize: 16),
              )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Water Quality',
            style: GoogleFonts.ubuntu(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 4,
              )
            ]),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Search'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  )
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                    child: Icon(
                  Icons.filter_alt_outlined,
                  size: 17,
                )),
              ),
              const SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                    child: Icon(
                  Icons.file_download_outlined,
                  size: 17,
                )),
              ),
              const SizedBox(width: 10),
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text('10 items >'),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.5))
                    ]),
                width: MediaQuery.of(context).size.width,
                child: ExpandableTheme(
                  data: ExpandableThemeData(
                    context,
                    headerColor: Colors.white,
                    expandedBackgroundColor: Colors.white,
                    rowBorder: const BorderSide(color: Colors.amber),
                    // expandedBorderColor: Colors.transparent,
                    paginationSize: 40,
                    rowTextMaxLines: 1,
                    expansionIcon: Image.asset('assets/image/add.png'),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                  ),
                  child: ExpandableDataTable(
                    rows: ReportTableData().rows,
                    headers: ReportTableData().headers,
                    multipleExpansion: false,
                    visibleColumnCount: 3,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
