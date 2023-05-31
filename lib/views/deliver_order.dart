import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:veggytably_customer/utils/number_formatter.dart';

import '../controllers/transaction_controller.dart';
import '../utils/text_format.dart';

class DeliverOrderPage extends StatelessWidget {
  final DraggableScrollableController dragController =
      DraggableScrollableController();

  final TransactionController transactionController =
      Get.find<TransactionController>();

  DeliverOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var customerPosition = transactionController.transaction!.customerAddress;
    var merchantPosition = transactionController.transaction!.merchantAddress;
    var markers = <Marker>[
      // customer
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(customerPosition.latitude, customerPosition.longitude),
        builder: (ctx) => const Icon(
          Icons.location_on,
          color: Colors.blue,
          size: 40,
        ),
      ),
      // merchant
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(merchantPosition.latitude, merchantPosition.longitude),
        builder: (ctx) => const Icon(
          Icons.location_on,
          color: Colors.red,
          size: 40,
        ),
      ),
    ];
    if (transactionController.transaction == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(customerPosition.latitude - 0.008,
                  customerPosition.longitude),
              zoom: 13.0,
            ),
            children: [
              // Map Layer
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              // Marker
              MarkerLayer(
                markers: markers,
              ),
            ],
          ),
          DraggableScrollableSheet(
            controller: dragController,
            initialChildSize: 0.4,
            snapSizes: const [0.4, 0.8, 1],
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1a000000),
                        blurRadius: 4,
                        offset: Offset(0, -4),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: ListView(
                            controller: scrollController,
                            children: <Widget>[
                              const SizedBox(height: 8),
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
                              const SizedBox(height: 20),
                              Container(
                                  width: MediaQuery.of(context).size.width - 48,
                                  // height: 46,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xfff6f7fb),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/info.png',
                                        width: 22,
                                        height: 22,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GetBuilder<TransactionController>(
                                            builder: (controller) {
                                              if (controller.transaction!
                                                          .status ==
                                                      "PROCESSING" ||
                                                  controller.transaction!
                                                          .status ==
                                                      "RECEIVED") {
                                                return const Text(
                                                  "We Are Getting Your Food Ready!",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: "Rubik",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                );
                                              }

                                              if (controller
                                                      .transaction!.status ==
                                                  "ON_DELIVERY") {
                                                return const Text(
                                                  "Your Food Is On The Way!",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: "Rubik",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                );
                                              }

                                              return const Text(
                                                "Your order is complete!",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: "Rubik",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              );
                                            },
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text:
                                                      "Your food will arrive in ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: "Rubik",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "${(transactionController.transaction!.estimatedDeliveryTime / 60).round()} minutes",
                                                  style: const TextStyle(
                                                    color: Color(0xff70CB88),
                                                    fontSize: 12,
                                                    fontFamily: "Rubik",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 25),
                              //pickup location
                              const Text(
                                "PICKUP LOCATION",
                                style: TextStyle(
                                  color: Color(0xff9f9f9f),
                                  fontSize: 10,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                transactionController
                                    .transaction!.merchant.restaurantName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                transactionController
                                    .transaction!.merchantAddress.address,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const SizedBox(height: 25),

                              //pickup loc
                              const Text(
                                "DELIVERY LOCATION",
                                style: TextStyle(
                                  color: Color(0xff9f9f9f),
                                  fontSize: 10,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                TextFormatter.splitWords(
                                    transactionController
                                        .transaction!.customerAddress.address,
                                    2),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                transactionController
                                    .transaction!.customerAddress.address,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              //delivery loc

                              const SizedBox(height: 25),

                              const Text(
                                "MERCHANT",
                                style: TextStyle(
                                  color: Color(0xff9f9f9f),
                                  fontSize: 10,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xfff6f7fb),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/merchantlogo.png',
                                        width: 35,
                                        height: 35,
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            transactionController.transaction!
                                                .merchant.restaurantName,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: "Rubik",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Text(
                                            "+62 89101112131",
                                            style: TextStyle(
                                              color: Color(0xff9f9f9f),
                                              fontSize: 12,
                                              fontFamily: "Rubik",
                                              fontWeight: FontWeight.normal,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        'assets/images/message.png',
                                        width: 17.14,
                                        height: 17.14,
                                      ),
                                      const SizedBox(width: 13.71),
                                      Image.asset(
                                        'assets/images/call.png',
                                        width: 17.14,
                                        height: 17.14,
                                      ),
                                    ],
                                  )),

                              //merchant

                              const SizedBox(height: 25),
                              const Text(
                                "DRIVER",
                                style: TextStyle(
                                  color: Color(0xff9f9f9f),
                                  fontSize: 10,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Driver
                              GetBuilder<TransactionController>(
                                builder: (controller) {
                                  if (controller.transaction!.driver == null) {
                                    return const Text(
                                      "Finding a driver...",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }
                                  return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xfff6f7fb),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/driverlogo.png',
                                            width: 35,
                                            height: 35,
                                          ),
                                          const SizedBox(width: 12),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.transaction!.driver!
                                                    .driverName,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: "Rubik",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Text(
                                                "Honda Vario Merah",
                                                style: TextStyle(
                                                  color: Color(0xff9f9f9f),
                                                  fontSize: 12,
                                                  fontFamily: "Rubik",
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Text(
                                                controller.transaction!.driver!
                                                    .driverPlateNumber,
                                                style: const TextStyle(
                                                  color: Color(0xff9f9f9f),
                                                  fontSize: 12,
                                                  fontFamily: "Rubik",
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          Image.asset(
                                            'assets/images/message.png',
                                            width: 17.14,
                                            height: 17.14,
                                          ),
                                          const SizedBox(width: 13.71),
                                          Image.asset(
                                            'assets/images/call.png',
                                            width: 17.14,
                                            height: 17.14,
                                          ),
                                        ],
                                      ));
                                },
                              ),

                              const SizedBox(height: 25),
                              // Orders
                              const Text(
                                "ORDERS",
                                style: TextStyle(
                                  color: Color(0xff9f9f9f),
                                  fontSize: 10,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),

                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: transactionController
                                    .transaction!.cart.cartItem.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var cartItem = transactionController
                                      .transaction!.cart.cartItem[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 4),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${cartItem.quantity}x',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: "Rubik",
                                                fontWeight: FontWeight.normal,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              // order
                                              //     .orderList[index].menu.name,
                                              cartItem.menu.name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: "Rubik",
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              NumberFormatter.instance
                                                  .idr(cartItem.menu.price),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: "Rubik",
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                    ]),
                                  );
                                },
                              ),
                              //orders

                              const SizedBox(height: 25),

                              const Text(
                                "PAYMENT SUMMARY",
                                style: TextStyle(
                                  color: Color(0xff9f9f9f),
                                  fontSize: 10,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Subtotal Order",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      NumberFormatter.instance.idr(
                                          transactionController
                                              .transaction!.totalPrice
                                              .toInt()),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Delivery Fee",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Rp 10.000",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Total Fee",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      NumberFormatter.instance.idr(
                                          transactionController
                                                  .transaction!.totalPrice
                                                  .toInt() +
                                              10000),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //payment
                              const SizedBox(height: 25),
                              // Finished button
                              transactionController.transaction!.status ==
                                      "FINISHED"
                                  ? ElevatedButton(
                                      onPressed: () {
                                        transactionController
                                            .finishTransaction();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text(
                                        "FINISHED",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                  : const SizedBox(),
                            ]),
                      )));
            },
          ),
        ],
      ),
    );
  }
}
