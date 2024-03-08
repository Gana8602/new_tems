import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceCycle extends StatefulWidget {
  const MaintenanceCycle({super.key});

  @override
  State<MaintenanceCycle> createState() => _MaintenanceCycleState();
}

class _MaintenanceCycleState extends State<MaintenanceCycle> {
  String _selectedItem = 'Preventive Maintenance';

  List<dynamic> MaintenanceDashboardValue = [
    {
      'icon': 'assets/svg/total_stations.svg',
      'text': 'Total Stations',
    },
    {
      'icon': 'assets/svg/total_cycles.svg',
      'text': 'Total Cycles',
    },
    {
      'icon': 'assets/svg/pm_completed.svg',
      'text': 'PM Completed',
    },
    {
      'icon': 'assets/svg/cm_requests.svg',
      'text': 'CM Requets',
    },
    {
      'icon': 'assets/svg/cm_completed.svg',
      'text': 'CM Completed',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6.0),
            ]),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // crossAxisSpacing: 4.0, // Adjust as needed
                    // mainAxisSpacing: 4.0, // Adjust as needed
                  ),
                  // scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: MaintenanceDashboardValue.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        // padding: const EdgeInsets.only(top: 40),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(0, 1),
                              blurRadius: 15,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: SvgPicture.asset(
                                    '${MaintenanceDashboardValue[index]['icon']}',
                                    // ignore: deprecated_member_use
                                    color: Colors.white,
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              MaintenanceDashboardValue[index]['text']
                                  .toString(),
                              style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Project Process",
                    style: GoogleFonts.ubuntu(
                        color: Colors.lightBlue, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Completed',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Planned',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.amber, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Overdue',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.red, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: 240,
                          child: DropdownButtonFormField<String>(
                            value: _selectedItem,
                            items: <String>[
                              'Preventive Maintenance',
                              'Corrective Maintenance'
                            ].map((String value) {
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
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 240,
                        child: DropdownButtonFormField<String>(
                          value: _selectedItem,
                          items: <String>[
                            'Preventive Maintenance',
                            'Corrective Maintenance'
                          ].map((String value) {
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
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
