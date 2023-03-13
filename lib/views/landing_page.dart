import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/profile_page.dart';

import '../widgets/bottom_navbar.dart';
import 'home_page_user.dart';

class LandingPage extends StatelessWidget {
  final int initialIndex;
  final List<Widget> pages = [
    const HomePage(),
    const Placeholder(), // discount
    const Placeholder(), // history
    const ProfilePage(),
  ];
  LandingPage({super.key, required this.initialIndex});

  late final RxInt _selectedIndex = initialIndex.obs;

  void setSelectedIndex(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => pages[_selectedIndex.value]),
        bottomNavigationBar: Container(
            height: 87.7,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.50),
                topRight: Radius.circular(25.50),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 230),
                    spreadRadius: 0,
                    blurRadius: 20),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.50),
                topRight: Radius.circular(25.50),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              child: CustomBottomNavigationBar(
                initialIndex: initialIndex,
                setSelectedIndex: setSelectedIndex,
              ),
            )));
  }
}
