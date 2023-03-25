import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:veggytably_customer/views/edit_profile.dart';
import 'package:veggytably_customer/views/profile_page.dart';
import '../widgets/detail_menu.dart';
import 'views/login_page.dart';
import 'views/signup_page.dart';
import 'views/home_page_user.dart';
import 'views/search_page1.dart';
import 'views/search_page2.dart';
import 'views/search_page3.dart';
import 'views/search_page4.dart';
import 'package:veggytably_customer/controllers/auth_controller.dart';
import 'package:veggytably_customer/views/restriction_page.dart';
import 'views/restriction_page.dart';
import 'views/list_menu_page.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListMenuPage(),
    );
  }
}
