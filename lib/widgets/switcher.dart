import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class switcher extends StatelessWidget {
  const switcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
            Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                    SizedBox(
                        width: 83,
                        child: Text(
                            "Food",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 15,
                            ),
                        ),
                    ),
                ],
            ),
            SizedBox(width: 11),
            Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                    SizedBox(
                        width: 83,
                        child: Text(
                            "Restaurants",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                            ),
                        ),
                    ),
                    SizedBox(height: 3),
                    Container(
                        width: 83.50,
                        height: 1.50,
                        decoration: BoxDecoration(
                          color: Color(0xff4b875b),
                          borderRadius: BorderRadius.circular(1.50),
                        ),
                        
                    ),
                ],
            ),
        ],
    );
  }
}