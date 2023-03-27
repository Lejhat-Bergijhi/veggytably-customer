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
import '../widgets/food_menu_card.dart';
import '../widgets/search_bar2.dart';
import '../widgets/switcher.dart';

class SearchPage3 extends StatefulWidget {
  const SearchPage3({super.key});
  @override
  _SearchPage3State createState() => _SearchPage3State();
}

class _SearchPage3State extends State<SearchPage3> {
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
      body: SafeArea(child: Column(
        children: [
          RegularSearchAppBar(topPadding),
           Padding(
            padding: const EdgeInsets.only(left: 30),
            child:
              Switcher(),
          ),
          const SizedBox(height: 20),
          FoodMenuCard('images/food1.png',"Gurino Salado", "Rp 10.000", "Helty Resto Jaya"),
        ],
      ),)
    );
  }
}

