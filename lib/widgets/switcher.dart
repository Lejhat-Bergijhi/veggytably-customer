import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/controllers/search_controller.dart';

class Switcher extends StatelessWidget {
  final SearchController searchController = Get.find();
  Switcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  searchController.setShowMenu(true);
                },
                child: SizedBox(
                  width: 83,
                  child: Text(
                    "Food",
                    textAlign: TextAlign.center,
                    style: searchController.showMenu.value
                        ? const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )
                        : const TextStyle(
                            color: Color(0xff9f9f9f),
                            fontSize: 15,
                          ),
                  ),
                ),
              ),
              searchController.showMenu.value
                  ? Container(
                      width: 83.50,
                      height: 1.50,
                      decoration: BoxDecoration(
                        color: const Color(0xff4b875b),
                        borderRadius: BorderRadius.circular(1.50),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(width: 11),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  searchController.setShowMenu(false);
                },
                child: SizedBox(
                  width: 92,
                  child: Text(
                    "Restaurants",
                    textAlign: TextAlign.center,
                    style: !searchController.showMenu.value
                        ? const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )
                        : const TextStyle(
                            color: Color(0xff9f9f9f),
                            fontSize: 15,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              !searchController.showMenu.value
                  ? Container(
                      width: 83.50,
                      height: 1.50,
                      decoration: BoxDecoration(
                        color: const Color(0xff4b875b),
                        borderRadius: BorderRadius.circular(1.50),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
