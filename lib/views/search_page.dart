import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:veggytably_customer/controllers/search_controller.dart';
import 'package:veggytably_customer/widgets/sliver_search_page_app_bar.dart';

import '../controllers/merchant_controller.dart';
import '../widgets/food_menu_card.dart';
import '../widgets/resto_menu_card.dart';
import '../widgets/switcher.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MerchantController());
    Get.put(SearchController());
    double topPadding = MediaQuery.of(context).padding.top + 15;

    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  RegularSearchAppBar(topPadding),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Switcher(),
                  ),
                  const SizedBox(height: 20),
                  // menu list here
                  GetBuilder<SearchController>(
                    builder: (controller) {
                      if (controller.isLoading.value) {
                        return Center(
                          child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.asset(
                                'assets/images/loading_search_page.png'),
                          ),
                        );
                      }

                      if (controller.search.length < 3) {
                        return const SizedBox();
                      }

                      if (controller.search.length > 3) {
                        if (controller.showMenu.value &&
                            controller.menuSearchResult.isEmpty) {
                          return Center(
                            child: SizedBox(
                                height: 300,
                                width: 300,
                                child: Image.asset(
                                    'assets/images/sorry_search_page.png')),
                          );
                        }

                        if (!controller.showMenu.value &&
                            controller.merchantSearchResult.isEmpty) {
                          return Center(
                            child: SizedBox(
                                height: 300,
                                width: 300,
                                child: Image.asset(
                                    'assets/images/sorry_search_page.png')),
                          );
                        }
                      }

                      return Expanded(
                        child: controller.showMenu.value
                            ? ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                itemCount: controller.menuSearchResult.length,
                                itemBuilder: (context, index) {
                                  return FoodMenuCard(
                                    menu: controller.menuSearchResult[index],
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount:
                                    controller.merchantSearchResult.length,
                                itemBuilder: (context, index) {
                                  return RestoMenuCard(
                                    merchant:
                                        controller.merchantSearchResult[index],
                                  );
                                },
                              ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
