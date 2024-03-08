import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:route_between_two_points/pages/Drawer_right/d_m_filter_drawer.dart';
import 'package:route_between_two_points/pages/Drawer_right/data_upload_drawer.dart';
import 'package:route_between_two_points/pages/Drawer_right/upload_one_drawer.dart';

class DataManagement extends StatefulWidget {
  const DataManagement({super.key});

  @override
  State<DataManagement> createState() => _DataManagementState();
}

class _DataManagementState extends State<DataManagement> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: DataUplaodDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _key.currentState!.openEndDrawer();
                },
                child: Text('filter')),
            ElevatedButton(onPressed: () {}, child: Text('upload 1')),
            ElevatedButton(onPressed: () {}, child: Text('upload 2'))
          ],
        ),
      ),
    );
  }
}
