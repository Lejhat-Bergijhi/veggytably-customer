import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const InputTextField(this.textEditingController, this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //hint text color
      
      controller: textEditingController,
      decoration: InputDecoration(
        //outline color
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Color(0xfff6f7fb), width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Color(0xfff6f7fb),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff9f9f9f),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8 ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff6f7fb), width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
