import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/Drawer_right/drawer_right.dart';
import 'package:route_between_two_points/pages/widget/float_Button.dart';
import 'package:route_between_two_points/pages/widget/map.dart';
import 'widget/drawer_left/drawer_left.dart';
import 'widget/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MapStyle controller = Get.put(MapStyle());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: Head(context),
      drawer: const Drawerleft(),
      body: _buildMapView(),
      endDrawer: const DrawerRight(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
    );
  }

  Widget _buildMapView() {
    return GetBuilder<MapStyle>(
      init: MapStyle(), // Initialize MapStyle controller
      builder: (controller) {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const MapView();
      },
    );
  }

  // Widget _DetailSheet(){
  //   return BottomSheet(onClosing: onClosing, builder: builder)
  // }
}
