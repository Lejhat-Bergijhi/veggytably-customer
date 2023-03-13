//template
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final bool Recomendation_selected;
  const FilterButton(this.title, this.Recomendation_selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Recomendation_selected? Color(0xffb1e4be):Color(0xffefefef),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Recomendation_selected? Colors.black:Color(0xff9f9f9f),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
