import 'package:flutter/material.dart';

class DeliverOrderPage extends StatelessWidget {
  final DraggableScrollableController dragController =
      DraggableScrollableController();

  DeliverOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/images/Background.png', fit: BoxFit.cover),
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
                                  color: Color(0xffd1d1d6),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                                width: MediaQuery.of(context).size.width - 48,
                                // height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xfff6f7fb),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/info.png',
                                      width: 22,
                                      height: 22,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "We Are Getting Your Food Ready!",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
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
                                                text: "35 minutes",
                                                style: TextStyle(
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
                            SizedBox(height: 25),
                            //pickup loc
                            Text(
                              "PICKUP LOCATION",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 10,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Resto Tanah Air Jaya",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Jl. Raden Bagus Bege, No.15A, Pogung",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 25),

                            //pickup loc
                            Text(
                              "DELIVERY LOCATION",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 10,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Pogung Kidul",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Blok F No.17, Kasihan, Bantul",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            //delivery loc

                            SizedBox(height: 25),

                            Text(
                              "MERCHANT",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 10,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xfff6f7fb),
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
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Padang Vegan, Solo",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
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
                                    Spacer(),
                                    Image.asset(
                                      'assets/images/message.png',
                                      width: 17.14,
                                      height: 17.14,
                                    ),
                                    SizedBox(width: 13.71),
                                    Image.asset(
                                      'assets/images/call.png',
                                      width: 17.14,
                                      height: 17.14,
                                    ),
                                  ],
                                )),

                            //merchant

                            SizedBox(height: 25),
                            Text(
                              "DRIVER",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 10,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xfff6f7fb),
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
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Panda Nampai",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Honda Vario Merah",
                                          style: TextStyle(
                                            color: Color(0xff9f9f9f),
                                            fontSize: 12,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Text(
                                          "B 1554 YU",
                                          style: TextStyle(
                                            color: Color(0xff9f9f9f),
                                            fontSize: 12,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      'assets/images/message.png',
                                      width: 17.14,
                                      height: 17.14,
                                    ),
                                    SizedBox(width: 13.71),
                                    Image.asset(
                                      'assets/images/call.png',
                                      width: 17.14,
                                      height: 17.14,
                                    ),
                                  ],
                                )),

                            //driver

                            SizedBox(height: 25),

                            Text(
                              "ORDERS",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 10,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),

                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
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
                                              // '${order.orderList[index].quantity}x',
                                              '1x',
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
                                              'Sego Tiwul',
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
                                              'Rp3.000',
                                              // TextFormatter.formatCurrency(
                                              //     order.orderList[index].menu
                                              //         .price),
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
                            ),
                            //orders

                            SizedBox(height: 25),

                            Text(
                              "PAYMENT SUMMARY",
                              style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 10,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
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
                                    "Rp 26.000",
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
                            SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Delivery Fee (4.46 km)",
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
                            SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
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
                                    "Rp 36.000",
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
                            SizedBox(height: 52),

                            //payment
                          ]),
                    )));
          },
        ),
      ],
    );
  }
}
