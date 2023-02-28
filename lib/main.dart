import 'package:demo47/screens/slider/view/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/login/view/login_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}
