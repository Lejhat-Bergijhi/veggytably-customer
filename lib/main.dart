import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:veggytably_customer/views/restriction_page.dart';
import 'views/login_page.dart';
import 'views/signup_page.dart';
import 'views/restriction_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RestrictionPage(),
    );
  }
}
