//template
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/restriction_page1.dart';

class ViewMenu extends StatefulWidget {
  @override
  _ViewMenuState createState() => _ViewMenuState();
}

void _showViewMenu(BuildContext context) {
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
      return Container(
        height:  MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(height: 15),
            //swipe up line
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
            SizedBox(height: 12),
            //food pic
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset('images/menu_food1.png', fit: BoxFit.cover),
            ),
      
            SizedBox(height: 12),
            //food name
            Text(
              'Salad Yammy',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Rubik',
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            SizedBox(height: 12),
            //food detail
            Text(
                "Perpaduan nanas, tahu, paprika, brambang, ditambah sego thiwul yang sangat lejhat.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                      fontFamily: 'Rubik',
                ),
            ),

            SizedBox(height: 12),
            //food price
            Text(
                "Rp15.000",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w500,
                ),
            ),

            SizedBox(height: 12),
            //tags
            

          ],
        ),
      );
    },
  );
}

class _ViewMenuState extends State<ViewMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            _showViewMenu(context);
          },
          child: Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}
