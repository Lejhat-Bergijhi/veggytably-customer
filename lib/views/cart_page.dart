import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:veggytably_customer/models/cart.dart';
import '../controllers/cart_controller.dart';
import '../controllers/merchant_controller.dart';
import '../utils/number_formatter.dart';
import '../widgets/counter_mini.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        shadowColor: const Color.fromARGB(25, 78, 54, 54),
        toolbarHeight: 74.72,
        leading: IconButton(
          icon: Image.asset('assets/images/arrow-left.png'),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
          iconSize: 40,
        ),
        titleSpacing: 0,
        title: Text(
          MerchantController.to.merchant.restaurantName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: "Rubik",
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/fav.png'),
            color: Colors.black,
            onPressed: () {},
            iconSize: 40,
          ),
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "ADDRESS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 10,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 11.62,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/location.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Pogung Kidul",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          child: const Text(
                            "Change Address",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff4b875b),
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: MediaQuery.of(context).size.width - 48,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xfff6f7fb),
                      ),
                      padding: const EdgeInsets.only(
                          left: 26, right: 10, bottom: 10, top: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Add address details and delivery instructions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff9f9f9f),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Cart Item
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        const Text(
                          "ORDERS",
                          style: TextStyle(
                            color: Color(0xff9f9f9f),
                            fontSize: 10,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          child: const Text(
                            "Add Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff4b875b),
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                          minHeight: 56.0),
                      child: GetBuilder<CartController>(
                        builder: (controller) {
                          List<CartItem> cartItem = controller.cart.cartItem;
                          return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cartItem.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 8);
                              },
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItem[index].menu.name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          NumberFormatter.instance.idr(
                                              cartItem[index].menu.price *
                                                  cartItem[index].quantity),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    CounterMini(
                                      cartIndex: index,
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    //line
                    Container(
                      width: MediaQuery.of(context).size.width - 48,
                      height: 1,
                      color: const Color(0xffd1d1d6),
                    ),

                    //voucher
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xfff6f7fb),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              child: Image.asset('assets/images/voucher.png'),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Place a voucher to get a discount!",
                              style: TextStyle(
                                color: Color(0xff242424),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 32),

                    const Text(
                      "PAYMENT SUMMARY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 10,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Total Order",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        GetBuilder<CartController>(builder: (controller) {
                          return Text(
                            NumberFormatter.instance
                                .idr(controller.totalPrice.value),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          );
                        }),
                      ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Delivery Fee",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Rp 10.000",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A909090),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, -4), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              height: 134,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Row(
                  children: [
                    const Text(
                      "Total Price",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GetBuilder<CartController>(builder: (controller) {
                      return Text(
                        NumberFormatter.instance
                            .idr(controller.totalPrice.value + 10000),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xb2ffffff),
                        blurRadius: 30,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: const Color(0xff70cb88),
                  ),
                  width: MediaQuery.of(context).size.width - 48,
                  height: 44,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Confirm Order",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      )),
    );
  }
}

// class ListMenu extends StatelessWidget {
//   final Menu menu;

//   const ListMenu({super.key, required this.menu});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 8,
//         ),

//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       // menu.name,
//                       "Tomyum Guwrih",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontFamily: "Rubik",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     const Text(
//                       "Rp35.000",
//                       // "Rp ${menu.price}",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               CounterMini(),
//             ],
//           ),
//         ),
//         const SizedBox(height: 8),
//         //line
//         Container(
//           width: MediaQuery.of(context).size.width - 48,
//           height: 1,
//           color: const Color(0xffd1d1d6),
//         ),
//       ],
//     );

//     //  Divider();
//   }
// }
