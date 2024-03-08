import 'package:expandable_datatable/expandable_datatable.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/controllers/drawer_controller.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/utils/string.dart';

import '../widget/drawer_left/drawer_left.dart';
import '../widget/float_Button.dart';
import 'Widgets/icon_popup.dart';
import 'Widgets/report_drop.dart';
import 'widget/report_data.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController _searchController = TextEditingController();

  final String _itemsSelected = '10 Items';
  final List<String> _items = ['5 Items', '10 Items', '20 Items'];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DrawerStrings _string = Get.put(DrawerStrings());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Head(context),
      drawer: const Drawerleft(),
      endDrawer: DataQADra(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Reports',
              style: TextStyle(fontSize: 25),
            ),
            // Row(
            //   children: [
            //     InkWell(
            //       onTap: () => Get.to(const HomePage()),
            //       child: const Text(
            //         'Home',
            //         style: TextStyle(fontSize: 15),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Container(
            //       height: 15,
            //       width: 1,
            //       color: Colors.black,
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     InkWell(
            //       onTap: () => Get.to(() => const ReportPage()),
            //       child: const Text(
            //         'Reports',
            //         style: TextStyle(fontSize: 15),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          _string.drawervalue = 'reportFilter';
                        });
                        _scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue, width: 1),
                        ),
                        child: const Center(
                            child: Text(
                          '+ Filter',
                          style:
                              TextStyle(color: Colors.lightBlue, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Water Quality',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                IconPopup(
                    icon: SvgPicture.asset(
                      'assets/svg/report_filter.svg',
                      color: Colors.lightBlue,
                    ),
                    text1: 'All',
                    text2: 'Valid Data',
                    text3: 'QA/QC Data'),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.lightBlue),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/svg/report_print.svg',
                          color: Colors.lightBlue)),
                ),
                const Spacer(),
                IconPopup(
                    icon: SvgPicture.asset(
                      'assets/svg/report_download.svg',
                      color: Colors.lightBlue,
                    ),
                    text1: 'Copy',
                    text2: 'CSV',
                    text3: 'PDF'),
                const SizedBox(width: 10),
                ReportDrop(val: _itemsSelected, items: _items)
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                    child: ExpandableTheme(
                      data: ExpandableThemeData(
                        context,
                        expandedBorderColor: Colors.transparent,
                        paginationSize: 40,
                        rowTextMaxLines: 1,
                        expansionIcon: Image.asset('assets/image/add.png'),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                      ),
                      child: ExpandableDataTable(
                        headers: ReportTableData().headers,
                        rows: ReportTableData().rows,
                        visibleColumnCount: 3,
                        multipleExpansion: false,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
