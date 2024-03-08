// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:route_between_two_points/pages/station_Master/Station_management/Tabs/widget.dart';
import 'package:route_between_two_points/pages/widget/style.dart';

import '../../../../utils/style.dart';
import '../../../widget/source.dart';

class StationDetails extends StatefulWidget {
  const StationDetails({super.key});

  @override
  State<StationDetails> createState() => _StationDetailsState();
}

class _StationDetailsState extends State<StationDetails> {
  final TextEditingController _Name = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final TextEditingController _lat = TextEditingController();
  final TextEditingController _lon = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final MapStyle controller = Get.put(MapStyle());
  File? _image;
  String? name;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        name = File(pickedFile.name).toString();
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 6.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Update Station',
                style: GoogleFonts.ubuntu(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              CustomeField(Controller: _Name, Title: 'Station Name*'),
              const SizedBox(
                height: 10,
              ),
              CustomeField2(Controller: _code, Title: 'Station Code*'),
              const SizedBox(
                height: 10,
              ),
              CustomeField(Controller: _lat, Title: 'LAT*'),
              const SizedBox(
                height: 10,
              ),
              CustomeField(Controller: _lon, Title: 'LON*'),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: _getImage,
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: const Center(
                          child: Text('Choose file'),
                        ),
                      ),
                    ),
                    Text(_image != null ? name.toString() : 'No file chosen'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _image != null
                  ? SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              const SizedBox(
                height: 10,
              ),
              CustomeField(Controller: _location, Title: 'Location Details*'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: FlutterMap(
                  options: MapOptions(
                    center: routePoints().routpoints[0],
                    zoom: 17,
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
                          builder: ((context) => IconButton(
                                onPressed: () {
                                  setState(() {
                                    _Name.text = 'WQ1';
                                    _code.text = 'CgYSDF';
                                  });
                                },
                                icon: const Icon(Icons.location_on),
                                color: AppColor.Blue,
                              )),
                        )
                      ],
                    ),
                    // CircleLayer(
                    //   circles: [
                    //     CircleMarker(
                    //       point: routePoints().routpoints[0],
                    //       useRadiusInMeter: true,
                    //       radius: 18,
                    //       color: Colors.yellow.withOpacity(0.5),
                    //       borderColor: Colors.yellow,
                    //       borderStrokeWidth: 2,
                    //     ),
                    //     CircleMarker(
                    //       point: routePoints().routpoints[0],
                    //       radius: 36,
                    //       useRadiusInMeter: true,
                    //       color: Colors.red.withOpacity(0.5),
                    //       borderColor: Colors.red,
                    //       borderStrokeWidth: 2,
                    //     )
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
