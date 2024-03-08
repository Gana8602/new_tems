// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/pages/station_Master/Station_management/Tabs/Calibration_details.dart';
import 'package:route_between_two_points/pages/station_Master/Station_management/Tabs/Station_details.dart';
import 'package:route_between_two_points/pages/station_Master/Station_management/Tabs/Station_meta_details.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/widget/drawer_left/drawer_left.dart';

class StationMaster extends StatefulWidget {
  const StationMaster({super.key});

  @override
  State<StationMaster> createState() => _StationMasterState();
}

class _StationMasterState extends State<StationMaster>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Station Master',
            style: GoogleFonts.ubuntu(fontSize: 20),
          ),
          // const Row(
          //   children: [
          //     Text('Home | '),
          //     Text('Station Master'),
          //   ],
          // ),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(
                text: 'Station Details',
              ),
              Tab(
                text: 'Station meta details',
              ),
              Tab(text: 'Calibration details')
            ],
            controller: _tabController,
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: const [
              StationDetails(),
              StationMetaDetails(),
              CalibrationDetails()
            ],
          ))
        ]),
      ),
    );
  }
}
