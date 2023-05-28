//template

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter extends StatelessWidget {
  final RxInt counter;
  const Counter({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 31,
        height: 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffd1d1d6),
            width: 1,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            if (counter.value > 0) {
              counter.value--;
            }
          },
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "-",
                  style: TextStyle(
                    color: Color(0xffd1d1d6),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Rubik',
                  ),
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
      const SizedBox(width: 10),
      Container(
        width: 31,
        height: 31,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  counter.toString(),
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Rubik',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
      ),
      const SizedBox(width: 10),
      Container(
        width: 31,
        height: 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffd1d1d6),
            width: 1,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            counter.value++;
          },
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "+",
                  style: TextStyle(
                    color: Color(0xffd1d1d6),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Rubik',
                  ),
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
    ]);
  }
}
