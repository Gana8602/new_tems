// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/maintanance_settings/widget/configuration.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/maintanance_settings/widget/manpower.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/maintanance_settings/widget/physical.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/maintanance_settings/widget/standard_procedure.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/widget/drawer_left/drawer_left.dart';

class MaintananceSettings extends StatefulWidget {
  const MaintananceSettings({super.key});

  @override
  State<MaintananceSettings> createState() => _MaintananceSettingsState();
}

class _MaintananceSettingsState extends State<MaintananceSettings>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Head(context),
      drawer: const Drawerleft(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'User Action Log',
            style: GoogleFonts.ubuntu(fontSize: 20),
          ),
          // const Row(
          //   children: [
          //     Text('Home | '),
          //     Text('User Action Log'),
          //   ],
          // ),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabs: const [
              Tab(
                text: 'Configuration',
              ),
              Tab(
                text: 'Man Power',
              ),
              Tab(text: 'Physical Inspection'),
              Tab(text: 'Standard Procedure'),
            ],
            controller: _tabController,
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: const [
              ConfiguyrationTab(),
              ManPowerTab(),
              Physical_inspectionTab(),
              StandardProcedureTab()
            ],
          ))
        ]),
      ),
    );
  }
}
