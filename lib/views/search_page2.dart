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

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(child: Column(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child:
              Row(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                              SizedBox(
                                  width: 83,
                                  child: Text(
                                      "Food",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                      ),
                                  ),
                              ),
                              SizedBox(height: 3),
                              Container(
                                  width: 83.50,
                                  height: 1.50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff4b875b), width: 0.50, ),
                                  ),
                              ),
                          ],
                      ),
                      SizedBox(width: 11),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                              SizedBox(
                                  width: 83,
                                  child: Text(
                                      "Restaurants",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff9f9f9f),
                                          fontSize: 15,
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ],
              ),
          ),
          const SizedBox(height: 80),
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: Image.asset('assets/images/sorry_search_page.png'),
            ),
          ),
        ],
      ),)
    );
  }
}