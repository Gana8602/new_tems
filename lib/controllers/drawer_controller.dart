import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/bool/bool_values.dart';
import 'package:route_between_two_points/pages/Drawer_right/d_m_filter_drawer.dart';
import 'package:route_between_two_points/pages/Drawer_right/data_upload_drawer.dart';
import 'package:route_between_two_points/pages/Drawer_right/drawer_right.dart';
import 'package:route_between_two_points/pages/Drawer_right/filter_drawer.dart';
import 'package:route_between_two_points/pages/Drawer_right/statis_drawer_filter.dart';
import 'package:route_between_two_points/pages/Drawer_right/upload_one_drawer.dart';

import '../pages/Drawer_right/add_station.dart';
import '../utils/string.dart';

class DataQADra extends StatefulWidget {
  DataQADra({
    super.key,
  });

  @override
  State<DataQADra> createState() => _DataQADraState();
}

class _DataQADraState extends State<DataQADra> {
  DrawerStrings _string = Get.put(DrawerStrings());
  @override
  Widget build(BuildContext context) {
    if (_string.drawervalue == 'qaUplaod') {
      return UploadDataQA();
    } else if (_string.drawervalue == 'qaFilter') {
      return DMFDrawer();
    } else if (_string.drawervalue == 'addStation') {
      return AddStation();
    } else if (_string.drawervalue == 'main') {
      return DrawerRight();
    } else if (_string.drawervalue == 'reportFilter') {
      return FilterDrawer();
    } else if (_string.drawervalue == 'SataticFilter') {
      return StaticticDrawerFilter();
    } else if (_string.drawervalue == 'upload2') {
      return DataUplaodDrawer();
    }
    return Container();
  }
}
