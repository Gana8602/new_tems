import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Drawer_right/drawer_right.dart';
import '../home.dart';
import '../widget/bar.dart';
import '../widget/drawer_left/drawer_left.dart';
import '../widget/float_Button.dart';
import 'Tabs/DashBoard_Settings/dashboard_settings.dart';
import 'Tabs/Parameter_Settings/parameter_settings.dart';

class ConfigurationsPage extends StatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  State<ConfigurationsPage> createState() => _ConfigurationsPageState();
}

class _ConfigurationsPageState extends State<ConfigurationsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configurations',
              style: TextStyle(fontSize: 25),
            ),
            // Row(
            //   children: [
            //     InkWell(
            //       onTap: () => Get.to(() => const HomePage()),
            //       child: const Text(
            //         'Home',
            //         style: TextStyle(fontSize: 17),
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
            //       onTap: () => Get.to(() => const ConfigurationsPage()),
            //       child: const Text(
            //         'Configurations',
            //         style: TextStyle(fontSize: 17),
            //       ),
            //     ),
            //   ],
            // ),
            TabBar(
              controller: _tabController,
              // isScrollable: true,
              labelColor: Colors.lightBlue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.lightBlue,
              tabs: const [
                Tab(
                  text: 'Dashboard Settings',
                ),
                Tab(
                  text: 'Parameter Settings',
                )
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                DashBoardSettings(),
                ParameterSettings(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
