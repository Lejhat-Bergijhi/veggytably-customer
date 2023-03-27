import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/search_merchant.dart';
import '../views/list_menu_page.dart';

class RestoMenuCard extends StatelessWidget {
  final Merchant merchant;
  const RestoMenuCard({
    super.key,
    required this.merchant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ListMenuPage());
      },
      child: Container(
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
              // Container(
              //   width: 100.0,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child:image,

              // ),
              //curved image
              Container(
                width: 100.0,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:
                        // merchant.imageUrl != null
                        //       ? Image.network(
                        //           merchant.imageUrl!,
                        //           loadingBuilder: (context, child, loadingProgress) {
                        //             if (loadingProgress == null) return child;

                        //             return const SizedBox(
                        //               width: 100,
                        //               height: 100,
                        //               child: Center(
                        //                 child: CircularProgressIndicator(),
                        //               ),
                        //             );
                        //           },
                        //           errorBuilder: (context, error, stackTrace) {
                        //             return Image.asset("assets/image7.png");
                        //           },
                        //         )
                        //       :
                        Image.asset("assets/images/foodres.png",
                            fit: BoxFit.cover)),
                // ),
              ),

              const SizedBox(width: 12),
              Container(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              merchant.restaurantName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              merchant.restaurantAddress,
                              style: TextStyle(
                                fontFamily: "Rubik",
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "${merchant.duration} mins",
                              style: TextStyle(
                                color: Color(0xff70cb88),
                                fontFamily: "Rubik",
                                fontSize: 12,
                              ),
                            ),
                          ]))),
            ],
          ),
        ),
      ),
    );
  }
}
