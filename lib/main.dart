import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/login_page.dart';
import '../views/list_menu_page.dart';

import 'controllers/auth_controller.dart';
import 'views/cart_page.dart';
import 'views/voucher_page.dart';
import 'views/restriction_page.dart';
//import '../controllers/auth_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
