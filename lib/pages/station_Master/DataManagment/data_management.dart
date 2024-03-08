import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/controllers/drawer_controller.dart';

import '../../../utils/string.dart';
import '../../Drawer_right/drawer_right.dart';
import '../../home.dart';
import '../../widget/bar.dart';
import '../../widget/drawer_left/drawer_left.dart';
import '../../widget/float_Button.dart';
import 'Widgets/Tabs/data_qa.dart';
import 'Widgets/Tabs/dataupload.dart';

class DataManagementPage extends StatefulWidget {
  const DataManagementPage({super.key});

  @override
  State<DataManagementPage> createState() => _DataManagementPageState();
}

class _DataManagementPageState extends State<DataManagementPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  GlobalKey<ScaffoldState> __key = GlobalKey<ScaffoldState>();
  DrawerStrings _string = Get.put(DrawerStrings());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> data(String val) async {
    setState(() {
      _string.drawervalue = val;
    });
    __key.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: __key,
      appBar: Head(context),
      drawer: const Drawerleft(),
      endDrawer: DataQADra(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Management',
              style: GoogleFonts.ubuntu(fontSize: 25),
            ),
            // Row(
            //   children: <Widget>[
            //     InkWell(
            //       onTap: () => Get.to(() => const HomePage()),
            //       child: Text(
            //         'Home',
            //         style: GoogleFonts.ubuntu(fontSize: 17),
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
            //       onTap: () {},
            //       child: Text(
            //         'Data Management',
            //         style: GoogleFonts.ubuntu(fontSize: 17),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 15,
            ),
            TabBar(
              // isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              controller: _tabController,
              // isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.lightBlue,
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Tab(
                    text: 'Data QA',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Tab(
                    text: 'Upload',
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                DataQA(
                  ontap: (p0) => data(p0),
                ),
                DataUpload(
                  ontap: (p0) => data(p0),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
