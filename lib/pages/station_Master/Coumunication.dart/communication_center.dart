// ignore_for_file: library_private_types_in_public_api

import 'package:count_down_time/count_down_time.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:route_between_two_points/pages/widget/bar.dart';
import 'package:route_between_two_points/pages/widget/drawer_left/drawer_left.dart';

import '../../../utils/style.dart';

class Communication extends StatefulWidget {
  const Communication({super.key});

  @override
  _CommunicationState createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Head(context),
      drawer: const Drawerleft(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Communication Center',
                style: GoogleFonts.ubuntu(fontSize: 20),
              ),
              // Row(
              //   children: [
              //     Text('Home | '),
              //     Text('Communication Center'),
              //   ],
              // ),
              SizedBox(
                height: 25,
              ),
              Expanded(

                  // color: Colors.amber,

                  child: BuoyList()),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BuoyList extends StatelessWidget {
  const BuoyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6.0,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/noimage.png'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'NCSCM - WQ1 ysgfahsfui',
                          softWrap: true,
                          style: GoogleFonts.ubuntu(fontSize: 14),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'WQ1',
                            style: GoogleFonts.ubuntu(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 20,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                                child: Text(
                              'OFFLINE',
                              style: GoogleFonts.ubuntu(color: Colors.white),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year.toString().substring(2)}',
                        style: GoogleFonts.ubuntu(fontSize: 14),
                      ),
                      Text(
                        '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}',
                        softWrap: true,
                        style: GoogleFonts.ubuntu(fontSize: 14),
                      ),
                      Text(
                        'Last Updated',
                        // softWrap: true,
                        style: GoogleFonts.ubuntu(fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: CircularPercentIndicator(
                        radius: 25.0,
                        lineWidth: 3.0,
                        percent: 0.7,
                        center: const Text("70%"),
                        progressColor: AppColor.Blue,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Builder(builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.more_vert_rounded),
                      onPressed: () {
                        final RenderBox renderBox =
                            context.findRenderObject() as RenderBox;
                        final Offset offset =
                            renderBox.localToGlobal(Offset.zero);
                        final RelativeRect position = RelativeRect.fromLTRB(
                          offset.dx,
                          offset.dy + renderBox.size.height,
                          offset.dx + renderBox.size.width,
                          offset.dy + renderBox.size.height,
                        );

                        showMenu(context: context, position: position, items: [
                          PopupMenuItem(
                            child: ListTile(
                              title: Center(
                                child: CountDownTime.minutes(
                                  timeStartInMinutes: 10,
                                  textStyle: GoogleFonts.ubuntu(fontSize: 15),
                                  onTimeOut: () {},
                                ),
                              ),
                              subtitle: const SizedBox(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'Next Update',
                                    softWrap: false,
                                  ),
                                ),
                              ),
                              trailing: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                          color: AppColor.Blue, width: 1)),
                                  child: Icon(
                                    Icons.messenger_outline_sharp,
                                    color: AppColor.Blue,
                                  )),
                              leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                          color: AppColor.Blue, width: 1)),
                                  child: Icon(
                                    Icons.file_download_outlined,
                                    color: AppColor.Blue,
                                  )),
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: Container(
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '✓ Connect',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.black),
                                    ),
                                  )),
                            ),
                          ),
                        ]);
                      },
                    );
                  })
                ],
              )),
        );
      },
    );
  }
}
