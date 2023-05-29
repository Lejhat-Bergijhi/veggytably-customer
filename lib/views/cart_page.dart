import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:veggytably_customer/models/cart.dart';
import 'package:veggytably_customer/views/voucher_page.dart';
import '../controllers/cart_controller.dart';
import '../controllers/merchant_controller.dart';
import '../controllers/transaction_controller.dart';
import '../controllers/voucher_controller.dart';
import '../utils/number_formatter.dart';
import '../widgets/counter_mini.dart';
import '../widgets/voucher_item.dart';

class CartPage extends StatelessWidget {
  final VoucherController voucherController = Get.put(VoucherController());
  final CartController cartController = Get.put(CartController());
  final TransactionController transactionController = Get.put(
    TransactionController(),
  );

  late final RxString paymentMethod; // "Domvet" or "Cash"

  CartPage({super.key}) {
    Get.find<TransactionController>().domvetBalance >
            Get.find<CartController>().totalPrice.value
        ? paymentMethod = "Domvet".obs
        : paymentMethod = "Cash".obs;
  }

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

          // 'padang vegan',
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
                        minHeight: 56.0,
                      ),
                      child: GetBuilder<CartController>(
                        builder: (controller) {
                          if (controller.isLoading.value) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                heightFactor: 2,
                                widthFactor: 2,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          List<CartItem> cartItem = controller.cart.cartItem;
                          return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cartItem.length,
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: Color(0xffd1d1d6),
                                  thickness: 1,
                                );
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
                    const SizedBox(
                      height: 32,
                    ),
                    // voucher section
                    GestureDetector(
                      onTap: () {
                        voucherController.getVouchers();
                        Get.to(() => VoucherPage(),
                            transition: Transition.rightToLeft);
                      },
                      child:
                          GetBuilder<VoucherController>(builder: (controller) {
                        return controller.selectedVoucher.id == "init"
                            ? Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xfff6f7fb),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 42,
                                      height: 42,
                                      child: Image.asset(
                                          'assets/images/voucher.png'),
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
                                ),
                              )
                            : VoucherItem(
                                voucher: controller.selectedVoucher,
                                disableModal: true,
                              );
                      }),
                    ),
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
                        // Text('10000'),
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
                    ),
                    // check if voucher is selected
                    Obx(
                      () => voucherController.selectedVoucher.id != "init"
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Discount",
                                      style: TextStyle(
                                        color: Color(0xff4b875b),
                                        fontSize: 15,
                                      ),
                                    ),
                                    const Spacer(),
                                    GetBuilder<VoucherController>(
                                        builder: (controller) {
                                      // calculate discount
                                      return Text(
                                        "-${NumberFormatter.instance.idr(controller.calculateDiscount(cartController.totalPrice.value))}",
                                        style: const TextStyle(
                                          color: Color(0xff4b875b),
                                          fontSize: 15,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      "PAYMENT METHOD",
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
                    GestureDetector(
                      onTap: () {
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
                            double boxWidth = MediaQuery.of(context).size.width;
                            // var checked = true;
                            return Stack(children: [
                              Positioned(
                                bottom: 30,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 24),
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
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      "Save Changes",
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
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                    bottom: boxWidth * 0.15 + 45),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xffd1d1d6),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    PaymentMethod(
                                        selectedMethod: paymentMethod,
                                        balance: transactionController
                                            .domvetBalance
                                            .round(),
                                        type: 'Domvet'),
                                    const SizedBox(height: 12),
                                    Container(
                                        height: 1,
                                        color: const Color(0xffD1D1D6)),
                                    const SizedBox(height: 12),
                                    PaymentMethod(
                                      selectedMethod: paymentMethod,
                                      type: 'Cash',
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                          },
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        child: Obx(
                          () => Row(
                            children: [
                              Container(
                                width: 46.17,
                                height: 43.55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: paymentMethod.value == "Domvet"
                                    ? Image.asset('assets/images/wallet.png')
                                    : Image.asset('assets/images/cash.png'),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    paymentMethod.value == "Domvet"
                                        ? "Domvet"
                                        : "Cash",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Balance: ${NumberFormatter.instance.idr(transactionController.domvetBalance.round())}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 7.55,
                                height: 12,
                                child: Image.asset(
                                    'assets/images/arrow-right.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                    Obx(() {
                      return Text(
                        NumberFormatter.instance.idr(
                            cartController.totalPrice.value -
                                voucherController.calculateDiscount(
                                    cartController.totalPrice.value) +
                                10000),
                        // '10000',
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
                Obx(
                  () => transactionController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
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
                            onPressed: () {
                              transactionController.postTransaction(
                                paymentMethod: paymentMethod.value,
                              );
                            },
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
                )
              ]),
            ),
          ),
        ],
      )),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final RxString selectedMethod;
  final int balance;
  final String type;

  final CartController cartController = Get.find();
  final Map<String, dynamic> paymentMethod;

  PaymentMethod({
    super.key,
    required this.selectedMethod,
    this.balance = 0,
    required this.type,
  }) : paymentMethod = {
          'Domvet': {
            'image': 'assets/images/wallet.png',
            'subtitle': 'Balance: ${NumberFormatter.instance.idr(balance)}',
            'desc':
                'Say goodbye to the hassle of carrying cash and fumbling for change - with our secure and easy-to-use e-wallet payment options, you can make transactions with just a few taps on your smartphone, all while enjoying the convenience and peace of mind that comes with going cashless.'
          },
          'Cash': {
            'image': 'assets/images/cash.png',
            'subtitle': 'Exact change is appreciated!',
            'desc':
                'In a world of digital payments, sometimes cash is still best - choose our cash payment option for a traditional and time-tested way to make transactions.',
          }
        };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46.17,
                height: 43.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(paymentMethod[type]['image']),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    paymentMethod[type]['subtitle'],
                    style: TextStyle(
                      color: type == 'Cash' ||
                              balance >= cartController.totalPrice.value + 10000
                          ? Colors.black
                          : Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Obx(
                () => Checkbox(
                  onChanged: type == 'Cash' ||
                          balance >= cartController.totalPrice.value + 10000
                      ? (value) {
                          selectedMethod.value = type;
                        }
                      : null,
                  value: selectedMethod.value == type,
                  activeColor: const Color.fromARGB(255, 112, 203, 136),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            paymentMethod[type]['desc'],
            style: const TextStyle(
              color: Color(0xff9f9f9f),
              fontSize: 12,
              fontFamily: 'Rubik',
            ),
          ),
        ],
      ),
    );
  }
}
