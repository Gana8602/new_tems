// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/pages/Drawer_right/add_station.dart';
import 'package:route_between_two_points/pages/Drawer_right/drawer_right.dart';
import 'package:route_between_two_points/pages/dashboard/Full_screen_map.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/widget/drawer_left/drawer_left.dart';
import 'package:route_between_two_points/pages/widget/style.dart';
import 'package:route_between_two_points/utils/string.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:marquee/marquee.dart';
import '../../controllers/drawer_controller.dart';
import '../../utils/style.dart';
import '../widget/float_Button.dart';
import '../widget/source.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DrawerStrings _string = Get.put(DrawerStrings());
  final MapStyle controller = Get.put(MapStyle());
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final double val = 23.7;
  DateTime? todaydate;
  String _selectedItem = 'wQ 1';
  @override
  void initState() {
    super.initState();
    getDat();
  }

  void getDat() {
    DateTime now = DateTime.now();

    setState(() {
      todaydate = now;
    });
  }

  List<String> dataValue = [
    '2881 mS/cm',
    '20.04 PSU',
    '8.11',
    '0%',
    '233.2 NTU',
    '0 mg/L',
    '18.77 ppt',
    '1.11 RFU',
    '202.1 mV',
    '13.8 V'
  ];

  List<dynamic> dataValue2 = [
    {'value': '2881 mS/cm', 'icon': 'assets/svg/test_tube.svg'},
    {'value': '19.8 PSV', 'icon': 'assets/svg/tube2.svg'},
    {'value': '8.11', 'icon': 'assets/svg/ph.svg'},
    {'value': '0%', 'icon': 'assets/svg/o2.svg'},
    {'value': '233.2 NTU', 'icon': 'assets/svg/meter.svg'},
    {'value': '0 mg/L', 'icon': 'assets/svg/o2.svg'},
    {'value': '18.77 ppt', 'icon': 'assets/svg/tube_back.svg'},
    {'value': '1.11 RFU', 'icon': 'assets/svg/leaf.svg'},
    {'value': '202.1 mV', 'icon': 'assets/svg/set.svg'},
    {'value': '13.8 V', 'icon': 'assets/svg/meter_fill.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: Head(context),
      drawer: const Drawerleft(),
      endDrawer: DataQADra(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: Marquee(
                  text: '*** Buoy moved out of danger circle, take action***',
                  style: GoogleFonts.ubuntu(backgroundColor: Colors.red),
                  blankSpace: MediaQuery.of(context).size.width,
                  startPadding: 10,
                  scrollAxis: Axis.horizontal),
            ),
            Text(
              'Dashboard',
              style: GoogleFonts.ubuntu(fontSize: 20),
            ),
            // Row(
            //   children: [
            //     const Text('Home'),
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
            //     const Text('Dashboard'),
            //   ],
            // ),
            Row(
              children: [
                Text(
                  'Last Updated : ',
                  style: GoogleFonts.ubuntu(color: AppColor.Blue),
                ),
                Text(
                  ' $todaydate}',
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'WQ 1',
              style: GoogleFonts.ubuntu(fontSize: 30, color: AppColor.Blue),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: DropdownButtonFormField<String>(
                    value: _selectedItem,
                    items: <String>['wQ 1', 'Bhitarkanika National Park']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _string.drawervalue = 'addStation';
                    });
                    _key.currentState!.openEndDrawer();
                  },
                  child: Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColor.Blue, width: 1)),
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: AppColor.Blue,
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/noimage.png'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Buoy Watch Circle'),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            FlutterMap(
                              options: MapOptions(
                                center: routePoints().routpoints[0],
                                zoom: 10,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate: controller.dark,
                                  // 'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png',
                                  subdomains: const ['a', 'b', 'c'],
                                  userAgentPackageName: 'com.example.app',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: routePoints().routpoints[0],
                                      builder: ((context) => Icon(
                                            Icons.location_on,
                                            color: AppColor.Blue,
                                          )),
                                    )
                                  ],
                                ),
                                CircleLayer(
                                  circles: [
                                    CircleMarker(
                                      point: routePoints().routpoints[0],
                                      useRadiusInMeter: true,
                                      radius: 18,
                                      color: Colors.yellow.withOpacity(0.5),
                                      borderColor: Colors.yellow,
                                      borderStrokeWidth: 2,
                                    ),
                                    CircleMarker(
                                      point: routePoints().routpoints[0],
                                      radius: 36,
                                      useRadiusInMeter: true,
                                      color: Colors.red.withOpacity(0.5),
                                      borderColor: Colors.red,
                                      borderStrokeWidth: 2,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(Icons.fullscreen_rounded),
                                    onPressed: () {
                                      Get.to(() => const FullView());
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Water'),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 380,
                width: 380,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 1),
                        blurRadius: 15,
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(children: <Widget>[
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: SfRadialGauge(
                          animationDuration: 300,
                          enableLoadingAnimation: true,
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: -5,
                              maximum: 45,
                              interval: 50,
                              startAngle: 180,
                              endAngle: 360,
                              pointers: <NeedlePointer>[
                                NeedlePointer(
                                  enableDragging: true,
                                  enableAnimation: true,
                                  animationType: AnimationType.ease,
                                  value: val,
                                )
                              ],
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: -5,
                                  endValue: val,
                                  color: Colors.amber[300],
                                )
                              ],
                            )
                          ])),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '23.51',
                    style: GoogleFonts.ubuntu(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Water  Temprature',
                    style:
                        GoogleFonts.ubuntu(fontSize: 27, color: AppColor.Blue),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                for (int i = 0; i < dataValue2.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 380,
                      width: 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(0, 1),
                              blurRadius: 15,
                            )
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        SizedBox(
                            height: 200,
                            width: 200,
                            child: Center(
                              child: SvgPicture.asset(
                                '${dataValue2[i]['icon']}',
                                color: AppColor.Blue,
                                width: 150,
                                height: 150,
                              ),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          dataValue2[i]['value'].toString(),
                          style: GoogleFonts.ubuntu(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Water  Temprature',
                          style: GoogleFonts.ubuntu(
                              fontSize: 27, color: AppColor.Blue),
                        ),
                      ]),
                    ),
                  )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
