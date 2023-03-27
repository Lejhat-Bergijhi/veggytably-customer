import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veggytably_customer/views/restriction_page1.dart';
import 'package:veggytably_customer/widgets/filter_button.dart';
import 'package:veggytably_customer/widgets/food_card.dart';
import 'package:veggytably_customer/widgets/sliver_search_page_app_bar.dart';
import 'package:veggytably_customer/widgets/filter_card.dart';

import '../controllers/auth_controller.dart';
import '../widgets/background_wave.dart';
import '../widgets/search_bar2.dart';
import '../widgets/switcher.dart';

class SearchPage2 extends StatefulWidget {
  const SearchPage2({super.key});
  @override
  _SearchPage2State createState() => _SearchPage2State();
}

class _SearchPage2State extends State<SearchPage2> {
  Future<void> showOnce(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final hasShownDialog =
        prefs.getBool('modalShown_${AuthController.to.user.id}') ?? false;
    if (!hasShownDialog) {
      await prefs.setBool('modalShown_${AuthController.to.user.id}', true);

      if (!context.mounted) return;
    }
  }

  TextStyle setTextStyle(bool selected) {
    if (selected) {
      return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        decoration: TextDecoration.underline,
      );
    } else {
      return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    showOnce(context);
  }

  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController());
    double marginleft = 24;
    double boxWidth = MediaQuery.of(context).size.width;
    double topPadding = MediaQuery.of(context).padding.top + 15;
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SafeArea(
          child: Column(
            children: [
              RegularSearchAppBar(topPadding),
              // Padding(
              //   padding: const EdgeInsets.only(left: 30),
              //   child: Switcher(),
              // ),
              const SizedBox(height: 80),
              ListView(children: [
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/images/sorry_search_page.png'),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
