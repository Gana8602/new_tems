// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../utils/style.dart';
import '../../../station_Master/Station_management/Tabs/widget.dart';

class UserCreation extends StatefulWidget {
  const UserCreation({super.key});

  @override
  State<UserCreation> createState() => _UserCreationState();
}

class _UserCreationState extends State<UserCreation> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _Name = TextEditingController();
  final TextEditingController _Designation = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _ConfirmPassword = TextEditingController();
  final MultiSelectController _controller = MultiSelectController();
  String selectedRole = 'PMANAGER';
  bool IsShow = true;
  bool isChecked = false;
  List<ValueItem> items = [
    const ValueItem(label: 'WQ 1', value: '1'),
    const ValueItem(label: 'Bhitarkanika National Park', value: '2'),
  ];
  List<String> roles = [
    'PMANAGER',
    'CMANAGER',
    'ENGINEER',
    'USER',
    'QA/QC MANAGER'
  ];
  List<String> Users = [];

  List<String> Names = [];
  List<String> Roles = [];
  List<String> email = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 6.0)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Add New User',
                  style: GoogleFonts.ubuntu(fontSize: 20),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              CustomeField(Controller: _userName, Title: 'User Name*'),
              const SizedBox(
                height: 10,
              ),
              CustomeField(Controller: _Name, Title: 'Name*'),
              const SizedBox(
                height: 10,
              ),
              CustomeField(Controller: _Designation, Title: 'Designation*'),
              const SizedBox(
                height: 10,
              ),
              Drop(selectedRole, roles, 'User Role*', (value) {
                setState(() {
                  selectedRole = value!;
                });
              }),
              const SizedBox(
                height: 10,
              ),
              CustomeField(Controller: _Email, Title: 'Email*'),
              const SizedBox(
                height: 10,
              ),
              passwordfield(
                Controller: _Password,
                show: IsShow,
                Title: 'Password',
              ),
              const SizedBox(
                height: 10,
              ),
              passwordfield(
                Controller: _ConfirmPassword,
                show: IsShow,
                Title: 'Confirm Password',
              ),
              const SizedBox(
                height: 10,
              ),
              CheckBox(),
              const SizedBox(
                height: 10,
              ),
              MultiSelectDropDown(
                showClearIcon: true,
                controller: _controller,
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                options: items,
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                dropdownHeight: 300,
                // optionGoogleFonts.ubuntu: const GoogleFonts.ubuntu(fontSize: 16),
                showChipInSingleSelectMode: true,
                selectedOptions: isChecked ? items : [],
                selectedOptionIcon: const Icon(Icons.check_circle),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Users.add(_userName.text);
                        Names.add(_Name.text);
                        Roles.add(selectedRole);
                        email.add(_Email.text);
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          'Add',
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      clearFields();
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.8),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          'Clear',
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columnSpacing: 10,
                      columns: const [
                        DataColumn(
                            label: SizedBox(
                                width: 60,
                                child: Text(
                                  'User',
                                  softWrap: true,
                                ))),
                        DataColumn(
                            label: SizedBox(
                                width: 70,
                                child: Text(
                                  'Name',
                                  softWrap: true,
                                ))),
                        DataColumn(
                            label: SizedBox(
                                width: 75,
                                child: Text(
                                  'Role',
                                  softWrap: true,
                                ))),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('action')),
                      ],
                      rows: List.generate(Users.length, (index) {
                        return DataRow(cells: [
                          // DataCell(Text(name ?? "")),
                          DataCell(Text(Users[index])),
                          DataCell(Center(child: Text(Names[index]))),
                          DataCell(Center(child: Text(roles[index]))),
                          DataCell(Center(child: Text(email[index]))),

                          DataCell(IconButton(
                            onPressed: () {
                              editRow(index);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.lightBlue,
                            ),
                          )),
                        ]);
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editRow(int index) {
    setState(() {
      // Update controllers and selected values with the values of the selected row
      _userName.text = Users[index];
      _Name.text = Names[index];
      selectedRole = roles[index];
      // _selectedDateTime = DateTime.parse(calidate[index]);
      _Email.text = email[index];
    });
  }

  Widget CheckBox() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border:
                    Border.all(color: isChecked ? AppColor.Blue : Colors.grey)),
            child: Center(
                child: isChecked ? const Icon(Icons.check) : const SizedBox()),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text('All Stations')
      ],
    );
  }

  void clearFields() {
    setState(() {
      _userName.clear();
      _Name.clear();
      selectedRole = 'PMANAGER';
      _Designation.clear();
      _Email.clear();
      _Password.clear();
      _ConfirmPassword.clear();
      // Clear other relevant state variables and controllers here
    });
  }

  Widget Drop(
    String? selectedValue,
    List<String> list,
    String title,
    void Function(String?)? onChanged,
  ) {
    return SizedBox(
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: DropdownButtonFormField<String>(
                value: selectedValue,
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onChanged,
                decoration: const InputDecoration(
                    hintText: '--Choose Role--',
                    contentPadding: EdgeInsets.symmetric(horizontal: 3),
                    // enabledBorder: OutlineInputBorder(),
                    border: InputBorder.none
                    // OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    // ),
                    ),
                // borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
