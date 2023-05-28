//template
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final double sizetext = 10;
  final Map<String, dynamic> style = {
    "MEAT-FREE": BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color(0xffffd2dc),
    ),
    "DAIRY-FREE": BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color(0xffd8f2ee),
    ),
    "NUT-FREE": BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color(0xffe3d2b9),
    ),
    "EGG-FREE": BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color(0xfffee7a2),
    ),
    "FISH-FREE": BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color.fromARGB(255, 221, 196, 244),
    ),
    "GLLUTEN-FREE": BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color.fromARGB(255, 228, 253, 215),
    ),
  };

  final String title;
  FilterButton(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 80,
      //make width adjustable with text length

      width: title.length * 7.0,
      decoration: style[title],
      padding: EdgeInsets.symmetric(horizontal: sizetext * 0.2, vertical: 1),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: sizetext,
          ),
        ),
      ),
    );
  }
}
