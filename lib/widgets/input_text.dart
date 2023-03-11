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
          borderSide: BorderSide(color: Color(0xff70cb88), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff9f9f9f),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8 ),
        ),
      ),
    );
  }
}
