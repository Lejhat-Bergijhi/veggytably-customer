import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/widgets/filter_button.dart';

int _selectedIndex = 2;

class ListMenuPage extends StatelessWidget {
  const ListMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/image10.png',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 13,
                left: 5,
                child: Image.asset("assets/images/arrow-left.png", width: 35),
              ),
              Positioned(
                top: 13,
                right: 5,
                child: Image.asset("assets/images/fav.png", width: 35),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Resto Tanah Air Jaya",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                SizedBox(
                                    width:
                                        4), // add some spacing between the icon and text
                                Container(
                                  child: Text(
                                    "Wonogiri Kota (0.60 km)",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(width: 30),
                                Image.asset(
                                  "assets/images/Layer_2.png",
                                  width: 13,
                                ),
                                SizedBox(
                                    width:
                                        4), // add some spacing between the icon and text
                                Container(
                                  child: Text(
                                    "Rp4.000, 25 minutes",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
            height: 10,
          ),
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'MENU THAT MATCHES YOUR RESTRICTIONS',
                      style: TextStyle(
                        color: Color.fromARGB(131, 88, 83, 83),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                new ListMenu(
                    gambar: "assets/images/image9.png",
                    text: "Salad Yammy",
                    harga: "Rp 15.000",
                    syarat1: "MEAT-FREE",
                    syarat2: "DAIRY-FREE"),
                new ListMenu(
                    gambar: "assets/images/image7.png",
                    text: "Tomyum Guwrih",
                    harga: "Rp 35.000",
                    syarat1: "EGG-FREE",
                    syarat2: "DAIRY-FREE"),
                new ListMenu(
                    gambar: "assets/images/image6.png",
                    text: "Gado-gado Wuenak",
                    harga: "Rp 12.000",
                    syarat1: "MEAT-FREE",
                    syarat2: "DAIRY-FREE"),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    'OTHER MENU',
                    style: TextStyle(
                      color: Color.fromARGB(131, 88, 83, 83),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new ListMenu(
                    gambar: "assets/images/image11.png",
                    text: "Roasted Chic",
                    harga: "Rp 60.000",
                    syarat1: "NUT-FREE",
                    syarat2: "FISH-FREE"),
                new ListMenu(
                    gambar: "assets/images/image9.png",
                    text: "Salad Yammy",
                    harga: "Rp 15.000",
                    syarat1: "MEAT-FREE",
                    syarat2: "GLLUTEN-FREE"),
                new ListMenu(
                    gambar: "assets/images/image6.png",
                    text: "Salad Juowo",
                    harga: "Rp 9.000",
                     syarat1: "MEAT-FREE",
                    syarat2: "DAIRY-FREE")
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  final String gambar;
  final String text;
  final String harga;
  final String syarat1;
  final String syarat2;

  const ListMenu(
      {required this.gambar,
      required this.text,
      required this.harga,
      required this.syarat1,
      required this.syarat2});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
          // top: BorderSide(
          //   color: Colors.black12,
          //   width: 1.0,
          // ),
        ),
      ),
      padding: new EdgeInsets.all(15),
      child: new Align(
        alignment: Alignment.topLeft,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(),
            new Image(
              image: AssetImage(gambar),
              width: 75.0,
            ),
            new Container(
                padding: EdgeInsets.all(8),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            text,
                            style: TextStyle(
                                fontSize: 12.5, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            harga,
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              FilterButton(syarat1),
                              SizedBox(width: 4),
                              FilterButton(syarat2),
                            ]
                          ),  
                        ]))),
          ],
        ),
      ),
    );
    //  Divider();
  }
}
