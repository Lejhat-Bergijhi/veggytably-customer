import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RestoMenuCard extends StatelessWidget {
  final String image;
  final String name, location, deliverydetail;
  const RestoMenuCard(this.image, this.name, this.location, this.deliverydetail,
      {super.key});

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
                child: Image.asset(image, fit: BoxFit.fitHeight),
              ),
            ),
            
            const SizedBox(width: 12),
            Container(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            location,
                            style: TextStyle(
                              fontFamily: "Rubik",
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Text(
                            deliverydetail,
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
    );
  }
}
