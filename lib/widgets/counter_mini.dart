//template

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CounterMini extends StatelessWidget {
  final int cartIndex;
  const CounterMini({super.key, required this.cartIndex});

  @override
  Widget build(BuildContext context) {
    void showAlertDialog(BuildContext context) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Are you sure you want to delete this menu?'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Yes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffd13d34),
                    fontSize: 15,
                  ),
                )),
            CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "No",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )),
          ],
        ),
      );
    }

    return Row(children: [
      InkWell(
        borderRadius: BorderRadius.circular(5.73),
        splashColor: Colors.transparent,
        onTap: () {
          if (Get.find<CartController>().cart.cartItem[cartIndex].quantity ==
              1) {
            showAlertDialog(context);
          }
        },
        child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.73),
            border: Border.all(
              color: const Color(0xffd1d1d6),
              width: 0.72,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "-",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff70cb88),
                    fontSize: 15.77,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
        ),
      ),
      const SizedBox(width: 10),
      SizedBox(
        width: 31,
        height: 31,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CartController>(builder: (controller) {
                return Text(
                  "${controller.cart.cartItem[cartIndex].quantity}",
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Rubik',
                  ),
                  textAlign: TextAlign.center,
                );
              }),
            ]),
      ),
      const SizedBox(width: 10),
      InkWell(
        onTap: () {
          // int quantity = quantityController.getQuantity('ayam lonly');
          // quantityController.updateQuantity(1, quantity + 1);
        },
        borderRadius: BorderRadius.circular(5.73),
        splashColor: Colors.transparent,
        child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.73),
            border: Border.all(
              color: const Color(0xffd1d1d6),
              width: 0.72,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff70cb88),
                    fontSize: 15.77,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
        ),
      ),
    ]);
  }
}
