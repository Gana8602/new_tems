import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/bool/bool_values.dart';
import 'package:route_between_two_points/controllers/drawer_controller.dart';
import 'package:route_between_two_points/pages/Drawer_right/drawer_right.dart';
import 'package:route_between_two_points/pages/Drawer_right/statis_drawer_filter.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/widget/drawer_left/drawer_left.dart';
import 'package:route_between_two_points/pages/widget/float_Button.dart';
import 'package:route_between_two_points/utils/string.dart';

import '../../utils/style.dart';
import 'widgets/linechart.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({
    super.key,
  });

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  DrawerStrings _strings = Get.put(DrawerStrings());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Head(context),
      drawer: const Drawerleft(),
      endDrawer: DataQADra(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const FloatButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Statistics',
                style: GoogleFonts.ubuntu(fontSize: 25),
              ),
              // Row(
              //   children: [
              //     InkWell(
              //       // onTap: () => Get.to(const HomePage()),
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
              //       onTap: () => Get.to(() => const StatisticsPage()),
              //       child: Text(
              //         'Statistics',
              //         style: GoogleFonts.ubuntu(fontSize: 17),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _strings.drawervalue = 'SataticFilter';
                    });

                    _scaffoldKey.currentState!.openEndDrawer();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.Blue, width: 1),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColor.Blue,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 6),
                  Text(
                    'Water Temparature',
                    style: GoogleFonts.ubuntu(
                      color: AppColor.Blue,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: const ChartF(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 50,
                              color: Colors.redAccent,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('WQ 1')
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
