import 'package:flutter/material.dart';

class CustomCheckboxVoucher extends StatelessWidget {
  final bool value;
  final String image;
  final String title;
  final String description;
  final ValueChanged<bool?> onChanged; 

  CustomCheckboxVoucher({
    required this.value,
    required this.image,
    required this.title,
    required this.description,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 70,
            child: Image(
              image: AssetImage(image),
              width: 55.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 10.0,
                      color: Color(0xFF9F9F9F),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Color.fromARGB(255, 112, 203, 136),
          ),
        ],
      ),
    );
  }
}
