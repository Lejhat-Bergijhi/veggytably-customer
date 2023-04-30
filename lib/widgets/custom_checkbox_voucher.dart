import 'package:flutter/material.dart';

class CustomCheckboxVoucher extends StatelessWidget {
  final bool value;
  final String image;
  final String title;
  final String description;
  final Function(bool?) onChanged;
  final int chosen;
  final int id;

  CustomCheckboxVoucher({
    required this.id,
    required this.value,
    required this.image,
    required this.title,
    required this.description,
    required this.onChanged,
    required this.chosen,
  });

  @override
  Widget build(BuildContext context) {
    if (chosen==id || chosen == -1 ) 
    return Container(
            margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFF6F7FB),
                border: Border.all(color: Color(0xF6F7FB)),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    children: [
                    SizedBox(
                      width: 40,
                      height: 70,
                      child: Image(
                        image: AssetImage(image),
                        width: 55.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              description,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 10.0,
                                color: Color(0xFF9F9F9F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Checkbox(
                      // tristate: true,
                      
                      onChanged:  onChanged,
                      value: value,
                      activeColor: Color.fromARGB(255, 112, 203, 136),
                    ),
                  ],
                ),
              ),
            ),
    );

    else return Opacity(
      opacity: 0.4,
      child: Container(
              margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7FB),
                  border: Border.all(color: Color(0xF6F7FB)),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      children: [
                      SizedBox(
                        width: 40,
                        height: 70,
                        child: Image(
                          image: AssetImage(image),
                          width: 55.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                description,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 10.0,
                                  color: Color(0xFF9F9F9F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
