import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/controllers/merchant_controller.dart';
import 'package:veggytably_customer/widgets/filter_button.dart';

import '../models/search_menu.dart';

class ListMenuPage extends StatelessWidget {
  final MerchantController merchantController = Get.find<MerchantController>();
  ListMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                // TODO: menus that match your restriction
                // const Padding(
                //     padding: EdgeInsets.only(left: 16),
                //     child: Text(
                //       'MENU THAT MATCHES YOUR RESTRICTIONS',
                //       style: TextStyle(
                //         color: Color.fromARGB(131, 88, 83, 83),
                //         fontSize: 10,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     )),
                // ListMenu(
                //     gambar: "assets/images/image9.png",
                //     text: "Salad Yammy",
                //     harga: "Rp 15.000",
                //     syarat1: "MEAT-FREE",
                //     syarat2: "DAIRY-FREE"),
                // ListMenu(
                //     gambar: "assets/images/image7.png",
                //     text: "Tomyum Guwrih",
                //     harga: "Rp 35.000",
                //     syarat1: "EGG-FREE",
                //     syarat2: "DAIRY-FREE"),
                // ListMenu(
                //     gambar: "assets/images/image6.png",
                //     text: "Gado-gado Wuenak",
                //     harga: "Rp 12.000",
                //     syarat1: "MEAT-FREE",
                //     syarat2: "DAIRY-FREE"),
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
                GetBuilder<MerchantController>(builder: (controller) {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<Menu> menuList = controller.menuList;

                  return Expanded(
                    child: ListView.builder(
                        itemCount: menuList.length,
                        itemBuilder: (context, index) {
                          return ListMenu(menu: menuList[index]);
                        }),
                  );
                }),

                // ListMenu(
                //     gambar: "assets/images/image11.png",
                //     text: "Roasted Chic",
                //     harga: "Rp 60.000",
                //     syarat1: "NUT-FREE",
                //     syarat2: "FISH-FREE"),
                // ListMenu(
                //     gambar: "assets/images/image9.png",
                //     text: "Salad Yammy",
                //     harga: "Rp 15.000",
                //     syarat1: "MEAT-FREE",
                //     syarat2: "GLLUTEN-FREE"),
                // ListMenu(
                //     gambar: "assets/images/image6.png",
                //     text: "Salad Juowo",
                //     harga: "Rp 9.000",
                //     syarat1: "MEAT-FREE",
                //     syarat2: "DAIRY-FREE")
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

  const ListMenu({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
    //  Divider();
  }
}
