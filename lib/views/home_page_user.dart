import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veggytably_customer/views/restriction_page1.dart';
import 'package:veggytably_customer/widgets/filter_button.dart';
import 'package:veggytably_customer/widgets/food_card.dart';
import 'package:veggytably_customer/widgets/sliver_search_app_bar.dart';
import 'package:veggytably_customer/widgets/filter_card.dart';

import '../controllers/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> showOnce(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    bool? hasShownDialog =
        prefs.getBool('modalShown_${AuthController.to.user.id}') ?? false;
    if (!hasShownDialog) {
      await prefs.setBool('modalShown_${AuthController.to.user.id}', true);

      if (!context.mounted) return;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DialogRestriksi();
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();

    showOnce(context);
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
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Domvet(marginleft: marginleft, boxWidth: boxWidth),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.only(left: marginleft, right: marginleft),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filter Your Food",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Filterfood(boxWidth, 'assets/images/Food-restriction.png',
                          "Food\nRestriction"),
                      const Spacer(),
                      Filterfood(boxWidth, 'assets/images/orderhistory.png',
                          "Order\nHistory"),
                      const Spacer(),
                      Filterfood(boxWidth, 'assets/images/favresto.png',
                          "Favorite\nResto"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.only(left: marginleft, right: marginleft),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Recommendations for You!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
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
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    SizedBox(
                      width: marginleft,
                    ),
                    const FoodCard('assets/images/image8.png', 'Salad Mix',
                        'Helti Resto Jaya Makmur', 'Rp32.000'),
                    const SizedBox(
                      width: 12,
                    ),
                    const FoodCard('assets/images/food2.png', 'Veg Rice',
                        'Waras Resto', 'Rp17.000'),
                    const SizedBox(
                      width: 12,
                    ),
                    const FoodCard(
                        'assets/images/food3.png',
                        'Indo Mix Vegetarian Salad with Egg',
                        'MakJreng Resto',
                        'Rp24.000'),
                    const SizedBox(
                      width: 12,
                    ),
                    const FoodCard('assets/images/image8.png', 'Salad Mix',
                        'Helti Resto Jaya Makmur', 'Rp32.000'),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                )),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.only(left: marginleft, right: marginleft),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
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
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: marginleft,
                    ),
                    const PromoCard('assets/images/promo1.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const PromoCard('assets/images/promo2.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const PromoCard('assets/images/promo3.png'),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                )),
            const SizedBox(
              height: 100,
            ),
          ]))
        ],
      ),
    );
  }
}

class DialogRestriksi extends StatelessWidget {
  const DialogRestriksi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      // border
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          const Text(
            'Welcome!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.w600,
              fontFamily: 'Rubik',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            // height: 204,
            // width: 204,
            child: Image.asset(
              'assets/images/illustration1.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
              ),
              children: [
                TextSpan(
                  text: "Your default food restriction is ",
                ),
                WidgetSpan(child: FilterButton("MEAT-FREE")),
                TextSpan(
                  text: " and ",
                ),
                WidgetSpan(child: FilterButton("FISH-FREE")),
              ],
            ),
          ),
        ],
      ),
      children: <Widget>[
        Column(children: [
          Container(
            height: 38,
            width: min((MediaQuery.of(context).size.width) * 0.7,
                MediaQuery.of(context).size.height * 0.7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff70cb88),
            ),
            child: TextButton(
                onPressed: () {
                  // set preferences
                  // Get.to(() => const ProfilePage(),
                  //     transition: Transition.fade);
                  Get.to(() => const EditRestrictionPage(),
                      transition: Transition.fade);
                },
                child: const Text(
                  "Customize Restriction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Customize Later",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff9f9f9f),
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              )),
          const SizedBox(height: 12)
        ]),
      ],
    );
  }
}

class PromoCard extends StatelessWidget {
  final String imgpath;
  const PromoCard(
    this.imgpath, {
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
        child: Image.asset(
          imgpath,
          fit: BoxFit.contain,
        ));
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
          const BoxShadow(
            color: Color(0x19000000),
            blurRadius: 12,
            offset: Offset(0, 0),
          ),
        ],
        image: DecorationImage(
          image: Image.asset(
            "assets/images/deco_saldo.png",
            fit: BoxFit.cover,
          ).image,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 23,
          ),
          Container(
            width: (boxWidth - marginleft * 2) * 1 / 2,
            padding: const EdgeInsets.only(bottom: 21.18, top: 21.82),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                //saldo domvet
                Text(
                  "SALDO DOMVET",
                  style: TextStyle(
                    color: Color(0xff5192a3),
                    fontSize: 12,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  // textAlign: TextAlign.left,
                ),

                //nominal saldo
                Text(
                  "Rp 1.234.245,00",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 59,
            margin: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff5192a3),
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
                    child: Image.asset('assets/images/top-up-wallet.png')),

                //top up
                Container(
                  child: const Text(
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
