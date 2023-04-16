import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/search_menu.dart';
import '../widgets/counter_button.dart';
import '../widgets/counter_mini.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        shadowColor: Color.fromARGB(25, 78, 54, 54),
        toolbarHeight: 74.72,

        leading:
        IconButton(
          icon: Image.asset('images/arrow-left.png'),
          color: Colors.black,
          onPressed: () {
          },
          iconSize: 40,

        ),
        titleSpacing: 0,
        title: Text(
          'Resto Tanah Air Jaya',
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
          icon: Image.asset('images/fav.png'),
          color: Colors.black,
          onPressed: () {
          },
          iconSize: 40,
        ),
        
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 18,),
                  Text(
                      "ADDRESS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff9f9f9f),
                          fontSize: 10,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w600,
                      ),
                  ),
                  SizedBox(height: 11.62,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset('images/location.png'),
                    SizedBox(width: 10,),
                    Text(
                        "Pogung Kidul",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    Spacer(),
                    TextButton(
                      
                      onPressed: () {

                      }, 
                      child: Text(
                        "Change Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff4b875b),
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                        ),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
  
                      ),
                    )
                    
                    
                  ],),
                  SizedBox(height: 8),
                  Container(
                      width: MediaQuery.of(context).size.width-48,
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xfff6f7fb),
                      ),
                      padding: const EdgeInsets.only(left: 26, right: 10, bottom: 10, top: 10),

                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                              Text(
                                  "Add address details and delivery instructions",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff9f9f9f),
                                      fontSize: 10,
                                  ),
                              ),
                          ],
                      ),
                  ),


                  // Cart Item
                  SizedBox(height: 32,),
                  Row(
                    children: [
                      Text(
                          "ORDERS",
                          style: TextStyle(
                              color: Color(0xff9f9f9f),
                              fontSize: 10,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w600,
                          ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: (){},
                        child: Text(
                            "Add Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff4b875b),
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                            ),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
    
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8,),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                  
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                                Text(
                                    "Tomyum Guwrih",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                    "Rp35.000",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                    ),
                                ),
                            ],
                          ),
                        ),
                        Spacer(),
                        CounterMini(),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  //line
                  Container(
                    width: MediaQuery.of(context).size.width-48,
                    height: 1,
                    color: Color(0xffd1d1d6),
                  ),

                  //voucher
                  SizedBox(height: 32,),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xfff6f7fb),
                    ),
                    child: Row(children: [
                      Container(
                        child: Image.asset('images/voucher.png'),
                        width: 42,
                        height: 42,
                      ),
                      SizedBox(width: 10),
                      Text(
                          "Place a voucher to get a discount!",
                          style: TextStyle(
                              color: Color(0xff242424),
                              fontSize: 15,
                          ),
                      ),
                    ],)
                  ),
                  SizedBox(height: 32),


                  Text(
                      "PAYMENT SUMMARY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff9f9f9f),
                          fontSize: 10,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w600,
                      ),
                  ),
                  SizedBox(height: 8,),
                  Row(children: [
                    Text(
                        "Total Order",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                        ),
                    ),
                    Spacer(),
                    Text(
                        "Rp 119.000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                        ),
                    ),
                  ],),

                  SizedBox(height: 8,),
                  Row(children: [
                    Text(
                        "Delivery Fee",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                        ),
                    ),
                    Spacer(),
                    Text(
                        "Rp 10.000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                        ),
                    ),
                  ],)


                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1A909090),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, -4), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                height: 134,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                            "Total Price",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        Spacer(),
                        Text(
                            "Rp129.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                      ],
                    
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                              BoxShadow(
                                  color: Color(0xb2ffffff),
                                  blurRadius: 30,
                                  offset: Offset(0, 0),
                              ),
                          ],
                          color: Color(0xff70cb88),
                      ),
                      width: MediaQuery.of(context).size.width-48,
                      height: 44,
                      child: TextButton(
                        onPressed: (){},
                        child: Text(
                                "Confirm Order",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.w600,
                                ),
                            ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ],
        )

      ),
    );
  }
}


class ListMenu extends StatelessWidget {
  final Menu menu;

  const ListMenu({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {


    return Column(children: [
                        SizedBox(height: 8,),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                              Text(
                                // menu.name,
                                  "Tomyum Guwrih",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.bold,
                                  ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                  "Rp35.000",
                                  // "Rp ${menu.price}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                  ),
                              ),
                          ],
                        ),
                      ),
                      Spacer(),
                      CounterMini(),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                //line
                Container(
                  width: MediaQuery.of(context).size.width-48,
                  height: 1,
                  color: Color(0xffd1d1d6),
                ),

    ],);
      
    //  Divider();
  }
}
