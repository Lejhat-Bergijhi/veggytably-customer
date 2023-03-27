import 'package:flutter/material.dart';
import 'package:veggytably_customer/models/search_menu.dart';

class FoodMenuCard extends StatelessWidget {
  // final String image;
  // final String name, price, resto;
  final Menu menu;
  const FoodMenuCard({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1.0),
        ),
      ),
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  // child: Image.asset(image, fit: BoxFit.cover),
                  child: menu.imageUrl != null
                      ? Image.network(
                          menu.imageUrl!,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return const SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset("assets/image7.png");
                          },
                        )
                      : Image.asset("assets/images/food1.png",
                          fit: BoxFit.cover)),
            ),
            const SizedBox(width: 12),
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        menu.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        menu.price.toString(),
                        style: const TextStyle(
                          fontFamily: "Rubik",
                          color: Color(0xff70cb88),
                          fontSize: 17,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        menu.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Rubik",
                          fontSize: 12,
                        ),
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
