//template

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Counter extends StatefulWidget {
  @override
  _ViewCounter createState() => _ViewCounter();
}


class _ViewCounter extends State<Counter> {
  @override
  
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Container(
            width: 31,
            height: 31,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xffd1d1d6), width: 1, ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(
                "-",
                style: TextStyle(
                  color: Color(0xffd1d1d6),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Rubik',
                  
                ),
                textAlign: TextAlign.center,
                
              ),
              ]
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 31,
            height: 31,
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(
                "1",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Rubik',
                  
                ),
                textAlign: TextAlign.center,
                
              ),
              ]
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 31,
            height: 31,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xffd1d1d6), width: 1, ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(
                "+",
                style: TextStyle(
                  color: Color(0xffd1d1d6),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Rubik',
                  
                ),
                textAlign: TextAlign.center,
                
              ),
              ]
            ),
          ),
        ]
      )
    );
  }
}
