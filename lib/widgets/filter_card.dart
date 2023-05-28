//template
import 'package:flutter/material.dart';

class Filterfood extends StatelessWidget {
  final String title;
  final String imagepath;
  final double querywidth;

  const Filterfood(this.querywidth, this.imagepath, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Material(
        type: MaterialType.transparency,
        child: Container(
            width: (querywidth - 24 * 2 - 13.5 * 2) / 3,
            height: 89.33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 12,
                  offset: Offset(0, 0),
                ),
              ],
              color: Color(0xfffcfcfc),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  child: Image.asset(
                    imagepath,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
