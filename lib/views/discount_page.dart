import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/widgets/bottom_navbar.dart';


class DiscountPage extends StatelessWidget {
  const DiscountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(   
            height: 87.7,                                          
            decoration: BoxDecoration(          
                                                   
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
        
                boxShadow: [                                                               
                BoxShadow(color: Color.fromRGBO(0,0,0,230), spreadRadius: 0, blurRadius: 20),       
                ],

            ),               

            child: ClipRRect( 
                
                                                                         
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                                                                   
                child: CustomBottomNavigationBar(initialIndex: 1),
            )
      )
    );
  }
}
