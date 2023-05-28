import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Placeholder(),
      // bottomNavigationBar: Container(
      //       height: 87.7,
      //       decoration: BoxDecoration(

      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),

      //           boxShadow: [
      //           BoxShadow(color: Color.fromRGBO(0,0,0,230), spreadRadius: 0, blurRadius: 20),
      //           ],

      //       ),

      //       child: ClipRRect(

      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),

      //           child: CustomBottomNavigationBar(initialIndex: 2),
      //       )
      // )
    );
  }
}
