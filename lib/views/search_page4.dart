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
import '../widgets/resto_menu_card.dart';
import '../widgets/search_bar2.dart';
import '../widgets/switcher.dart';

class SearchPage4 extends StatefulWidget {
  const SearchPage4({super.key});
  @override
  _SearchPage4State createState() => _SearchPage4State();
}

class _SearchPage4State extends State<SearchPage4> {
  Future<void> showOnce(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final hasShownDialog =
        prefs.getBool('modalShown_${AuthController.to.user.id}') ?? false;
    if (!hasShownDialog) {
      await prefs.setBool('modalShown_${AuthController.to.user.id}', true);

      if (!context.mounted) return;
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Switcher(),
              ),
              const SizedBox(height: 20),
              RestoMenuCard('images/food3.png', "Merasa BerSalad",
                  "Wonogiri Desa (3.90 Km)", "Rp 12.000, 37 Minutes"),
            ],
          ),
        ));
  }
}
