import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/widgets/filter_button.dart';
import 'package:veggytably_customer/widgets/food_card.dart';
import 'package:veggytably_customer/widgets/sliver_search_app_bar.dart';
import 'package:veggytably_customer/widgets/filter_card.dart';
import 'package:veggytably_customer/widgets/filter_button.dart';
import 'package:veggytably_customer/widgets/bottom_navbar.dart';
import 'package:veggytably_customer/views/profile_page.dart';


class HomePage extends StatefulWidget {
  @override
  const HomePage({super.key});
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasShownDialog = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasShownDialog) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return 
            //dialog
            SimpleDialog(
              // border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Column(
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Rubik',
                      

                    ),
                    textAlign : TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                      "Your default food restriction is",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',

                      ),
                  ),
                  Container(
                    // height: 204,
                    // width: 204,
                    child: Image.asset('images/illustration1.png', fit: BoxFit.contain,),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "LACTO-OVO\nVEGETARIAN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.bold,
                    ),
                  ),    
                ],
              ),
              children: <Widget>[
                Column(
                  children:[
                    Container(
                      height: 38,
                      width: (MediaQuery.of(context).size.width) *0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff70cb88),
                      ),
                      child: TextButton(
                        onPressed: () {
                                   Get.offAll(() => ProfilePage(), transition: Transition.fade);

                          
                        },
                        child: Text(
                            "Customize Restriction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                            ),
                        )

                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                          "Customize Later",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff9f9f9f),
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                          ),
                      )

                    ),
                    SizedBox(height: 12)
                    
                  ]
    
                ),
                
              ],
            );
            // AlertDialog(
            //   title: Text('Welcome'),
            //   content: Text('Thank you for using our app.'),
            //   actions: <Widget>[
            //     TextButton(
            //       child: Text('OK'),
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //     ),
            //   ],
            // );
          },
        );
        setState(() {
          _hasShownDialog = true;
        });
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController());
    double marginleft = 24;
    double boxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          const SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Domvet(marginleft: marginleft, boxWidth: boxWidth),
                SizedBox(height: 24,),
                Container(
                  margin: EdgeInsets.only(left: marginleft, right: marginleft),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Filter Your Food",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                        ),
                        
                      ),
                      SizedBox(height: 12,),
                      Row(

                        children: [
                          Filterfood(boxWidth, 'images/Food-restriction.png', "Food\nRestriction"),
                          Spacer(),
                          Filterfood(boxWidth, 'images/orderhistory.png', "Order\nHistory"),
                          Spacer(),
                          Filterfood(boxWidth, 'images/favresto.png', "Favorite\nResto"),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                Container(
                  margin: EdgeInsets.only(left: marginleft, right: marginleft),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommendations for You!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                        ),
                       
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          
                          FilterButton('MEAT-FREE', true),
                          SizedBox(width: 8,),
                          FilterButton('DAIRY-FREE', false),
                          SizedBox(width: 8,),
                          FilterButton('EGG-FREE', false),
                          SizedBox(width: 8,),
                          FilterButton('FISH-FREE', false),
                        ],
                      ),
                      SizedBox(height: 12,),
                     
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(left: marginleft),
                  width: boxWidth,
                  height: 168,
                  child: ListView(
                    
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      SizedBox(width: marginleft,),
                      FoodCard('images/image8.png', 'Salad Mix', 'Helti Resto Jaya Makmur', 'Rp32.000'),
                      SizedBox(width: 12,),
                      FoodCard('images/food2.png', 'Veg Rice', 'Waras Resto', 'Rp17.000'),
                      SizedBox(width: 12,),
                      FoodCard('images/food3.png', 'Indo Mix Vegetarian Salad with Egg', 'MakJreng Resto', 'Rp24.000'),
                      SizedBox(width: 12,),
                      FoodCard('images/image8.png', 'Salad Mix', 'Helti Resto Jaya Makmur', 'Rp32.000'),
                      SizedBox(width: 12,),
                      
                    ],
                  )
                ),
                SizedBox(height: 24,),
                Container(
                  margin: EdgeInsets.only(left: marginleft, right: marginleft),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Promo Recommendations:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                        ),
                       
                      ),
                      
                     
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(left: marginleft),
                  width: boxWidth,
                  height: 168,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: marginleft,),
                      PromoCard('images/promo1.png'),
                      SizedBox(width: 12,),
                      PromoCard('images/promo2.png'),
                      SizedBox(width: 12,),
                      PromoCard('images/promo3.png'),
                      SizedBox(width: 12,),
                      
                    ],
                  )
                ),
                SizedBox(height: 100,),
              ]
            )
          )
        ],
      ),
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
                                                                   
                child:CustomBottomNavigationBar(initialIndex: 0,),
            )
      )
      
    );
  }
}

class PromoCard extends StatelessWidget {

  final String imgpath;
  const PromoCard(
    this.imgpath,
    {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285.19,
      height: 141.68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(imgpath, fit: BoxFit.contain,)
    );
  }
}

class Domvet extends StatelessWidget {
  const Domvet({
    super.key,
    required this.marginleft,
    required this.boxWidth,
  });

  final double marginleft;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      margin: EdgeInsets.only(left: marginleft, right: marginleft),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
            BoxShadow(
                color: Color(0x19000000),
                blurRadius: 12,
                offset: Offset(0, 0),
            ),
        ],
        image: DecorationImage(
          image: Image.asset("images/deco_saldo.png", fit: BoxFit.cover,).image,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 23,),
          Container(
            width: (boxWidth-marginleft*2)*1/2,
            padding: EdgeInsets.only(bottom: 21.18, top: 21.82),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //saldo domvet
                Container(
                  
                  child: Text(
                      "SALDO DOMVET",
                      style: TextStyle(
                          color: Color(0xff5192a3),
                          fontSize: 12,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w600,
                      ),
                      // textAlign: TextAlign.left,
                  ),
                ),

                //nominal saldo
                Container(
                  child: Text(
                      "Rp 1.234.245,00",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.left,
                  ),
                ),

                
              
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 59,
            margin: EdgeInsets.all(17),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff5192a3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //icon domvet
                Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset('images/top-up-wallet.png')
                ),

                //top up
                Container(
                  child: Text(
                    "Top Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

