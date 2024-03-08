import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../../../utils/style.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final MultiSelectController _controller = MultiSelectController();
  String Selectedparameter = '';
  List<String> parameter = [];
  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'Bhitarkanika National Park', value: '2'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    style: GoogleFonts.ubuntu(color: Colors.blue, fontSize: 18),
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
              height: 600,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Station*'),
                          Drop(Selectedparameter, parameter, (value) {
                            Selectedparameter = value!;
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sensors*'),
                          MultiSelectDropDown(
                            showClearIcon: true,
                            controller: _controller,
                            onOptionSelected: (options) {
                              debugPrint(options.toString());
                            },
                            options: items,
                            selectionType: SelectionType.multi,
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.wrap),
                            dropdownHeight: 300,
                            optionTextStyle: GoogleFonts.ubuntu(fontSize: 16),
                            showChipInSingleSelectMode: true,
                            selectedOptionIcon: const Icon(Icons.check_circle),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Priority*'),
                          Drop(Selectedparameter, parameter, (value) {
                            Selectedparameter = value!;
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Maintenance Request Date*'),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // readOnly: true,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10),
                                    // labelText: 'From Date*',
                                    border: InputBorder.none),
                                // controller: _firstDate,
                                // onTap: () => _selectDateTime(context, 'one'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Team Size*'),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // readOnly: true,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                  // labelText: 'From Date*',
                                  border: InputBorder.none,
                                ),
                                // controller: _firstDate,
                                // onTap: () => _selectDateTime(context, 'one'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Request Description*'),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // readOnly: true,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10),
                                    // labelText: 'From Date*',
                                    border: InputBorder.none),
                                // controller: _firstDate,
                                // onTap: () => _selectDateTime(context, 'one'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Reported By*'),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // readOnly: true,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10),
                                    // labelText: 'From Date*',
                                    border: InputBorder.none),
                                // controller: _firstDate,
                                // onTap: () => _selectDateTime(context, 'one'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Assign To*'),
                          Drop(Selectedparameter, parameter, (value) {
                            Selectedparameter = value!;
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border:
                            Border.all(color: AppColor.Blue, strokeAlign: 1),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.ubuntu(color: AppColor.Blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          // border: Border.all(color: Colors.blue, strokeAlign: 1),
                          color: AppColor.Blue),
                      child: Center(
                        child: Text(
                          'Save',
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }

  Widget Drop(
    String? selectedValue,
    List<String> list,
    void Function(String?)? onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: list.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
        ),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }
}
