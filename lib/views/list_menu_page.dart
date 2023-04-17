import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/controllers/merchant_controller.dart';
import 'package:veggytably_customer/widgets/filter_button.dart';

import '../models/search_menu.dart';
import '../widgets/counter_button.dart';
import 'cart_page.dart';

class ListMenuPage extends StatelessWidget {
  final MerchantController merchantController = Get.find<MerchantController>();

  ListMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/image10.png',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 13,
                left: 5,
                child: Image.asset("assets/images/arrow-left.png", width: 35),
              ),
              Positioned(
                top: 13,
                right: 5,
                child: Image.asset("assets/images/fav.png", width: 35),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              merchantController.merchant.restaurantName,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                const SizedBox(
                                    width:
                                        4), // add some spacing between the icon and text
                                const Text(
                                  "Wonogiri Kota (0.60 km)",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                const SizedBox(width: 30),
                                Image.asset(
                                  "assets/images/Layer_2.png",
                                  width: 13,
                                ),
                                const SizedBox(
                                    width:
                                        4), // add some spacing between the icon and text
                                Container(
                                  child: Text(
                                    "Rp ${merchantController.merchant.price}, ${merchantController.merchant.duration} minutes",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    // 'OTHER MENU',
                    "MENU LIST",
                    style: TextStyle(
                      color: Color.fromARGB(131, 88, 83, 83),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Menu List
                GetBuilder<MerchantController>(builder: (controller) {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<Menu> menuList = controller.menuList;

                  return Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            itemCount: menuList.length,
                            itemBuilder: (context, index) {
                              return ListMenu(menu: menuList[index]);
                            }),
                        // cart details button
                        Positioned(
                          left: boxWidth * 0.15 / 2,
                          right: boxWidth * 0.15 / 2,
                          bottom: 30,
                          child: Container(
                            width: boxWidth * 0.85,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const CartPage());
                              },
                              child: const Text(
                                'View Cart Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: "Rubik",
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff70cb88),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  final Menu menu;
  final RxInt counter = 1.obs;

  ListMenu({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    void showViewMenu(BuildContext context) {
      double boxWidth = MediaQuery.of(context).size.width;
      showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        useRootNavigator: true,
        enableDrag: true,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: EdgeInsets.only(
                  left: 25, right: 25, bottom: boxWidth * 0.15 + 45),
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  //swipe up line
                  Center(
                    child: Container(
                      width: 100,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffd1d1d6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  //food pic
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: boxWidth * 0.9,
                    // child: Image.asset('assets/images/menu_food1.png',
                    //     fit: BoxFit.cover),
                    child: menu.imageUrl != null
                        ? Image.network(
                            menu.imageUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return const SizedBox(
                                width: 100,
                                height: 100,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset("assets/image7.png");
                            },
                          )
                        : Image.asset(
                            "assets/images/food1.png",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                  ),

                  const SizedBox(height: 12),
                  //food name
                  Text(
                    menu.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Rubik',
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),
                  //food detail
                  Text(
                    menu.description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Rubik',
                    ),
                  ),

                  const SizedBox(height: 12),
                  //food price
                  Text(
                    "Rp ${menu.price}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),
                  //tags
                  Container(
                    height: 20,
                    width: boxWidth * 0.9,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        FilterButton('NUT-FREE'),
                        const SizedBox(width: 4),
                        FilterButton('DAIRY-FREE'),
                        const SizedBox(width: 4),
                        FilterButton('MEAT-FREE'),
                        const SizedBox(width: 4),
                        FilterButton('EGG-FREE'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: boxWidth,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        Counter(counter: counter),
                        const Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: boxWidth * 0.15 / 2,
              right: boxWidth * 0.15 / 2,
              bottom: 30,
              child: Container(
                width: boxWidth * 0.85,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    // Get.offAll(() => ProfilePage(), transition: Transition.fade);
                    // emailController.clear();
                    // passwordController.clear();
                    print(counter.value);
                    print(menu.toString());
                  },
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "Rubik",
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff70cb88),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ]);
        },
      );
    }

    return GestureDetector(
      onTap: () {
        // Get.to(() => ViewMenu());
        showViewMenu(context);
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 1.0,
            ),
            // top: BorderSide(
            //   color: Colors.black12,
            //   width: 1.0,
            // ),
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(),
              // Image(
              //   image: AssetImage(gambar),
              //   width: 75.0,
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: menu.imageUrl != null
                    ? Image.network(
                        menu.imageUrl!,
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return const SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/image7.png");
                        },
                      )
                    : Image.asset(
                        "assets/images/food1.png",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              menu.name,
                              style: const TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Rp ${menu.price}",
                              style: const TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            Row(children: [
                              FilterButton("NUT-FREE"),
                              const SizedBox(width: 4),
                              FilterButton("FISH-FREE"),
                            ]),
                          ]))),
            ],
          ),
        ),
      ),
    );
    //  Divider();
  }
}
