import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenace_Reports/maintenance_reports.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenance_Requests/maintenance_requests.dart';

import '../../../../utils/style.dart';
import '../../../Drawer_right/drawer_right.dart';
import '../../../home.dart';
import '../../../widget/bar.dart';
import '../../../widget/drawer_left/drawer_left.dart';
import '../../../widget/float_Button.dart';
import 'Maintenance_Cycle/maintenance_cycle.dart';

class MaintenanceDashboardPage extends StatefulWidget {
  const MaintenanceDashboardPage({super.key});

  @override
  State<MaintenanceDashboardPage> createState() =>
      _MaintenanceDashboardPageState();
}

class _MaintenanceDashboardPageState extends State<MaintenanceDashboardPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Head(context),
      drawer: const Drawerleft(),
      endDrawer: const DrawerRight(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Maintenance Dashboard',
              style: GoogleFonts.ubuntu(fontSize: 25),
            ),
            // Row(
            //   children: [
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
            //       onTap: () => Get.to(() => const MaintenanceDashboardPage()),
            //       child: Text(
            //         'Maintenance Module',
            //         style: GoogleFonts.ubuntu(fontSize: 17),
            //       ),
            //     ),
            //   ],
            // ),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              // isScrollable: true,
              indicator: BoxDecoration(
                  color: AppColor.Blue,
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
                    text: 'Maintenance Cycle',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Tab(
                    text: 'Maintenance Reports',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Tab(
                    text: 'Maintenance Requests',
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                MaintenanceCycle(),
                MaintenanceReports(),
                MaintenanceRequest(),
              ]),
            ),

            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       height: 40,
            //       width: 230,
            //       decoration: BoxDecoration(
            //         color: Colors.lightBlue,
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       child: TextButton.icon(
            //         onPressed: () {
            //           Get.to(() => const MaintenanceSettingsPage());
            //         },
            //         icon: SvgPicture.asset(
            // 'assets/svg/maintenance_cycle.svg',
            //           color: Colors.white,
            //         ),
            //         label: Text(
            //           'Maintenance Cycle',
            //           style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 16),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       height: 40,
            //       width: 250,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       child: TextButton.icon(
            //         onPressed: () {
            //           Get.to(() => const MaintenanceSettingsPage());
            //         },
            //         icon: SvgPicture.asset(
            //             'assets/svg/maintenance_reports.svg'),
            //         label: Text(
            //           'Maintenance Reports',
            //           style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 16),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       height: 40,
            //       width: 250,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       child: TextButton.icon(
            //         onPressed: () {},
            //         icon: SvgPicture.asset(
            //             'assets/svg/maintenance_request.svg'),
            //         label: Text(
            //           'Maintenance Request',
            //           style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 16),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
