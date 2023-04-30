import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/controllers/merchant_controller.dart';
import 'package:veggytably_customer/widgets/filter_button.dart';

import '../controllers/cart_controller.dart';
import '../models/cart.dart';
import '../models/search_menu.dart';
import '../utils/number_formatter.dart';
import '../widgets/counter_button.dart';
import 'cart_page.dart';

class ListMenuPage extends StatelessWidget {
  final MerchantController merchantController = Get.find<MerchantController>();
  final CartController cartController = Get.put(CartController());

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
                        GetBuilder<CartController>(builder: (controller) {
                          return ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              itemCount: menuList.length,
                              itemBuilder: (context, index) {
                                try {
                                  return ListMenu(
                                    menu: menuList[index],
                                    cartIndex: index,
                                  );
                                } catch (e) {
                                  return ListMenu(
                                      menu: menuList[index], cartIndex: 0);
                                }
                              });
                        }),
                        // cart details button
                        Obx(
                          () => cartController.cart.cartItem.isNotEmpty
                              ? Positioned(
                                  left: boxWidth * 0.15 / 2,
                                  right: boxWidth * 0.15 / 2,
                                  bottom: 30,
                                  child: SizedBox(
                                    width: boxWidth * 0.85,
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.to(() => CartPage());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff70cb88),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Cart - ${cartController.cart.cartItem.length} Menu',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                fontFamily: "Rubik",
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(NumberFormatter.instance.idr(
                                                cartController
                                                    .totalPrice.value)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
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
  final CartController cartController = Get.find<CartController>();
  final Menu menu;
  final int cartIndex;
  final RxInt counter = 1.obs;

  ListMenu({
    super.key,
    required this.menu,
    required this.cartIndex,
  });

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
                physics: const NeverScrollableScrollPhysics(),
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
                    NumberFormatter.instance.idr(menu.price),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),
                  //tags
                  SizedBox(
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
                  SizedBox(
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
              child: SizedBox(
                width: boxWidth * 0.85,
                height: 45,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: counter.value > 0
                        ? () {
                            // add menu to cart then close modal
                            // CartItem cartItem = CartItem(
                            //   cartId: cartController.cart.id,
                            //   menuId: menu.id,
                            //   menu: menu,
                            //   quantity: counter.value,
                            // );
                            // cartController.updateCartItem(cartItem);
                            cartController.incrementCartItemQuantity(
                                menu, counter.value);
                            Get.back();
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff70cb88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledBackgroundColor: const Color(0xffd1d1d6),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: "Rubik",
                      ),
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
        showViewMenu(context);
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 1.0,
            ),
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(),
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
                              NumberFormatter.instance.idr(menu.price),
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
