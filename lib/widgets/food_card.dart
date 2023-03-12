import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String img;
  final String name;
  final String rest;
  final String price;

  const FoodCard(this.img, this.name, this.rest, this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 168,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.66),
          boxShadow: [
              BoxShadow(
                  color: Color(0x0c000000),
                  blurRadius: 16,
                  offset: Offset(0, 0),
              ),
          ],
          color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 110,
              height: 102.67,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.66), topRight: Radius.circular(10.66), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
              ),
              child: Image.asset(img),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, right : 8, top: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w500,
                  ),
                  

              ),

              Text(
                  rest,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 10,
                      fontFamily: "Rubik",
                  ),
              ),
              SizedBox(height: 6,),
              Text(
                  price,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w500,
                  ),
              )
            ],)
          )
        ],
      )
    );
  }
}

