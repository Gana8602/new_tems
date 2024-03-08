import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:route_between_two_points/pages/auth/Login_page.dart';
import 'package:route_between_two_points/pages/home.dart';
import 'package:route_between_two_points/router/routes.dart';

import 'utils/style.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColor.Blue, // Change the color as needed
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AuthPageRoute,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: HomePageRoute, page: () => const HomePage()),
        GetPage(name: AuthPageRoute, page: () => const LoginPage()),
      ],
    );
  }
}
