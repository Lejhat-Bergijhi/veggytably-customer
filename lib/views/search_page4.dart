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
                                          color: Color(0xff9f9f9f),
                                          fontSize: 15,
                                      ),
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
                  ],
              ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12, 
                  width: 1.0),
                  ),
            ),
            padding: const EdgeInsets.only(left: 15),
            child: Align(alignment: Alignment.topLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image(
                    image: AssetImage("assets/images/BerSalad.png"),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Merasa BerSalad",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Wonogiri Desa (3.90 Km)",
                                style: TextStyle(
                                  fontFamily: "Rubik",
                                color: Colors.black,
                                fontSize: 14,),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                "Rp 12.000, 37 Minutes",
                                style: TextStyle(
                                    color: Color(0xff70cb88),
                                    fontFamily: "Rubik",
                                    fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ]))),
              ],
            ),
            ),),
        ],
      ),)
    );
  }
}