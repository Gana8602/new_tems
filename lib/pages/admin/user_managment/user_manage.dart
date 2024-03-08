import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_between_two_points/pages/admin/user_managment/tabs/Custome_user.dart';
import 'package:route_between_two_points/pages/admin/user_managment/tabs/user_create.dart';

import '../../widget/bar.dart';
import '../../widget/drawer_left/drawer_left.dart';

class UserManagment extends StatefulWidget {
  const UserManagment({super.key});

  @override
  State<UserManagment> createState() => _UserManagmentState();
}

class _UserManagmentState extends State<UserManagment>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Head(context),
      drawer: const Drawerleft(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'User Action Log',
            style: GoogleFonts.ubuntu(fontSize: 20),
          ),
          // const Row(
          //   children: [
          //     Text('Home | '),
          //     Text('User Action Log'),
          //   ],
          // ),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(
                text: 'User Management',
              ),
              Tab(
                text: 'Custom Role Management',
              ),
            ],
            controller: _tabController,
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: const [
              UserCreation(),
              CustomUserRole(),
            ],
          ))
        ]),
      ),
    );
  }
}
