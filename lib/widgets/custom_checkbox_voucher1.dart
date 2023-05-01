import 'package:flutter/material.dart';

class CustomCheckboxVoucher1 extends StatelessWidget {
  final bool value;
  final String image;
  final String title;
  final String description;
  final dynamic onChanged;

  CustomCheckboxVoucher1({
    required this.value,
    required this.image,
    required this.title,
    required this.description,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        useRootNavigator: true,
        enableDrag: true,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          double boxWidth = MediaQuery.of(context).size.width;
          return Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: EdgeInsets.only(
                  left: 25, right: 25, bottom: boxWidth * 0.15 + 45),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 15),
                  //swipe up line
                  Center(
                    child: Container(
                      width: 100,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffd1d1d6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  Text('@vinca u can modify this & anythin below uwu'),
                ],
              ),
            ),
            ]);
        },
      );
      },
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
      ),
    );
  }
}
