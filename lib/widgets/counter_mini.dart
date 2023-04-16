//template

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/quantity_controller.dart';

class CounterMini extends StatefulWidget {
  @override
  _ViewCounter createState() => _ViewCounter();
}

class _ViewCounter extends State<CounterMini> {
  @override
  // final QuantityController quantityController = Get.find<QuantityController>();
  @override
  // void initState() {
  // super.initState();
  // Get.put(QuantityController());

  // }

  Widget build(BuildContext context) {

    void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Are you sure you want to delete this menu?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
          
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
                "Yes",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffd13d34),
                    fontSize: 15,
                ),
            )
          ),
          CupertinoDialogAction(
    
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
                "No",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                ),
            )
          ),
        ],
      ),
    );
  }
    //TODO: get quantity from controller

    double boxWidth = MediaQuery.of(context).size.width;
    return Container(
        child: Row(children: [
      InkWell(
        borderRadius: BorderRadius.circular(5.73),
        splashColor: Colors.transparent,
        //TODO: get index of menu
        onTap: () {
          _showAlertDialog(context);
          // int quantity = quantityController.getQuantity('ayam lonly');
          //  quantityController.updateQuantity(1, quantity + 1);
        },
        child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.73),
            border: Border.all(
              color: Color(0xffd1d1d6),
              width: 0.72,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
      SizedBox(width: 10),
      Container(
        width: 31,
        height: 31,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // '${quantityController.getQuantity('ayam lonly')}',
                '1',
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Rubik',
                ),
                textAlign: TextAlign.center,
              ),
            ]),
      ),
      SizedBox(width: 10),
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
              color: Color(0xffd1d1d6),
              width: 0.72,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
    ]));
  }
}
