import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenace_Reports/tabs/daily_progress_report.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenace_Reports/tabs/primary_details.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenace_Reports/tabs/standard_procedure.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenace_Reports/tabs/station_voltage.dart';
import 'package:route_between_two_points/pages/station_Master/meintanance_Manager/Maintenance_Dashboard/Maintenace_Reports/tabs/technical_maintenance.dart';

import '../../../../../../utils/style.dart';
import 'progressBar.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({super.key});

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  int _currentStep = 0;
  bool isOKay = false;
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Request Details',
                        style: GoogleFonts.ubuntu(
                            color: Colors.blue, fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: LinearProgressWithStep(
                    totalSteps: 5,
                    currentStep: _currentStep,
                  ),
                ),
                Expanded(
                  key: _scaffold,
                  child: _currentStep == 0
                      ? PrimaryDetails(
                          onNext: () {
                            setState(() {
                              _currentStep = 1;
                            });
                          },
                        )
                      : _currentStep == 1
                          ? StationVoltage(
                              onNext: () {
                                setState(() {
                                  _currentStep = 2;
                                });
                              },
                              onBack: () {
                                setState(() {
                                  _currentStep = 0;
                                });
                              },
                            )
                          : _currentStep == 2
                              ? StandardProcedure(
                                  onNext: () {
                                    setState(() {
                                      _currentStep = 3;
                                    });
                                  },
                                  onBack: () {
                                    setState(() {
                                      _currentStep = 1;
                                    });
                                  },
                                )
                              : _currentStep == 3
                                  ? TechnicalMaintenance(
                                      onNext: () {
                                        setState(() {
                                          _currentStep = 4;
                                        });
                                      },
                                      onBack: () {
                                        setState(() {
                                          _currentStep = 2;
                                        });
                                      },
                                    )
                                  : _currentStep == 4
                                      ? DailyProgressReport(
                                          onBack: () {
                                            setState(() {
                                              _currentStep = 3;
                                            });
                                          },
                                        )
                                      : Container(), // Added a default Container widget
                ),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: AppColor.Blue, strokeAlign: 1),
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.ubuntu(color: AppColor.Blue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        isOKay
                            ? InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      // border: Border.all(color: Colors.blue, strokeAlign: 1),
                                      color: AppColor.Blue),
                                  child: Center(
                                    child: Text(
                                      'Save',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    // border: Border.all(color: Colors.blue, strokeAlign: 1),
                                    color: AppColor.Blue.withOpacity(0.3)),
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style:
                                        GoogleFonts.ubuntu(color: Colors.white),
                                  ),
                                ),
                              ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
