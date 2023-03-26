import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/controllers/search_controller.dart';
import 'package:veggytably_customer/widgets/sliver_search_page_app_bar.dart';

import '../widgets/switcher.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    SearchController searchController = Get.put(SearchController());
    // AuthController authController = Get.put(AuthController());
    double marginleft = 24;
    double boxWidth = MediaQuery.of(context).size.width;
    double topPadding = MediaQuery.of(context).padding.top + 15;

    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SafeArea(
          child: ListView(
            children: [
              RegularSearchAppBar(topPadding),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: switcher(),
              ),
              const SizedBox(height: 80),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/images/loading_search_page.png'),
                ),
              ),
            ],
          ),
        ));
  }
}
