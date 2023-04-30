import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_checkbox_voucher.dart';

int chosen = -1;

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;

  //TODO: fetch dari API, ini masih dummy
  List voucherList = [
    {
      "id": 0,
      'isChecked': false,
      "name": "Disc 10% up to 20.000",
      "description":
          "Minimal Spending of Rp 50.000. Rp 4.000 delivery discount.",
      "discount": 10,
      "maxDiscount": 20000,
      "image": "assets/images/vc1.png",
    },
    {
      "id": 1,
      'isChecked': false,
      "name": "Disc 40% up to 30.000",
      "description": "Minimal Spending of Rp 50.000. With SVB Payment.",
      "discount": 40,
      "maxDiscount": 30000,
      "image": "assets/images/vc2.png",
    },
    {
      "id": 2,
      'isChecked': false,
      "name": "Disc 10% up to 80.000",
      "description": "MMinimal Spending of Rp 0. Rp 4.000 delivery discount.",
      "discount": 10,
      "maxDiscount": 80000,
      "image": "assets/images/vc3.png",
    },
    {
      "id": 3,
      'isChecked': false,
      "name": "Disc 50% up to 25.000",
      "description":
          "Minimal Spending of Rp 80.000. Rp 8.000 delivery discount. With FWBenefit Payment.",
      "discount": 50,
      "maxDiscount": 25000,
      "image": "assets/images/vc4.png",
    },
    {
      "id": 4,
      'isChecked': false,
      "name": "Disc 20% up to 40.000",
      "description": "Minimal Spending of Rp 60.000. With FFS Payment.",
      "discount": 20,
      "maxDiscount": 40000,
      "image": "assets/images/vc5.png",
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          shadowColor: const Color.fromARGB(25, 78, 54, 54),
          toolbarHeight: 74.72,
          leading: IconButton(
            icon: Image.asset('assets/images/arrow-left.png'),
            color: Color(0x5F5F5F),
            onPressed: () {
              Get.back();
            },
            iconSize: 40,
          ),
          titleSpacing: 0,
          title: Text(
            "Voucher",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/images/fav.png'),
              color: Color(0x5F5F5F),
              onPressed: () {},
              iconSize: 40,
            ),
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemCount: voucherList.length,
                itemBuilder: (context, index) {
                  return CustomCheckboxVoucher(
                    id: voucherList[index]['id'],
                    value: voucherList[index]['isChecked'],
                    chosen: chosen,
                    image: voucherList[index]['image'],
                    title: voucherList[index]['name'],
                    description: voucherList[index]['description'],
                    onChanged: (value) {
                      if (chosen == -1 ) {
                        setState(() {
                          voucherList[index]['isChecked'] = !voucherList[index]['isChecked'];
                          chosen = voucherList[index]['id'];
                          // value = false;
                        });
                      } else if (chosen != -1) {
                        setState(() {
                          voucherList[index]['isChecked'] = !voucherList[index]['isChecked'];
                          chosen = -1;
                          // value = true;
                        });
                      }
                    },
                  );
                },
              ),
            ),

            // Container(
            //   margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF6F7FB),
            //       border: Border.all(color: Color(0xF6F7FB)),
            //       borderRadius: BorderRadius.circular(7.0),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: CustomCheckboxVoucher(
            //         value: _isChecked2,
            //         chosen: chosen,
            //         image: 'assets/images/vc1.png',
            //         title: 'Disc 10% up to 20.000',
            //         description:
            //             'Minimal Spending of Rp 50.000. Rp 4.000 delivery discount.',
            //         onChanged: (value) {
            //           print(chosen);
            //           print(value);
            //           if (chosen == false && value == true) {
            //             value = false;
            //             chosen = true;
            //             setState(() {
            //               _isChecked2 = value ?? false;
            //               chosen = chosen;
            //             });
            //           } else if (chosen == true && value == false) {
            //             value = true;
            //             chosen = false;
            //             setState(() {
            //               _isChecked2 = value ?? false;
            //               chosen = chosen;
            //             });
            //           }
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF6F7FB),
            //       border: Border.all(color: Color(0xF6F7FB)),
            //       borderRadius: BorderRadius.circular(7.0),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: CustomCheckboxVoucher(
            //         value: _isChecked2,
            //         image: 'assets/images/vc2.png',
            //         title: 'Disc 40% up to 30.000',
            //         description:
            //             'Minimal Spending of Rp 50.000. With SVB Payment. ',
            //         onChanged: (value) {
            //           setState(() {
            //             _isChecked2 = value ?? false;
            //           });
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF6F7FB),
            //       border: Border.all(color: Color(0xF6F7FB)),
            //       borderRadius: BorderRadius.circular(7.0),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: CustomCheckboxVoucher(
            //         value: _isChecked2,
            //         image: 'assets/images/vc3.png',
            //         title: 'Disc 10% up to 80.000',
            //         description:
            //             'Minimal Spending of Rp 0. Rp 4.000 delivery discount.',
            //         onChanged: (value) {
            //           setState(() {
            //             _isChecked2 = value ?? false;
            //           });
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF6F7FB),
            //       border: Border.all(color: Color(0xF6F7FB)),
            //       borderRadius: BorderRadius.circular(7.0),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: CustomCheckboxVoucher(
            //         value: _isChecked2,
            //         image: 'assets/images/vc4.png',
            //         title: 'Disc 50% up to 25.000',
            //         description:
            //             'Minimal Spending of Rp 80.000. Rp 8.000 delivery discount. With FWBenefit Payment.',
            //         onChanged: (value) {
            //           setState(() {
            //             _isChecked2 = value ?? false;
            //           });
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF6F7FB),
            //       border: Border.all(color: Color(0xF6F7FB)),
            //       borderRadius: BorderRadius.circular(7.0),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: CustomCheckboxVoucher(
            //         value: _isChecked2,
            //         image: 'assets/images/vc5.png',
            //         title: 'Disc 20% up to 40.000',
            //         description:
            //             'Minimal Spending of Rp 60.000. With FFS Payment.',
            //         onChanged: (value) {
            //           setState(() {
            //             _isChecked2 = value ?? false;
            //           });
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 80),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 40),
            //   width: 600,
            //   height: 45,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Get.offAll(() => const ProfilePage(),
            //       //     transition: Transition.fade);
            //       Get.back();
            //     },
            //     child: const Text(
            //       'Confirm Order',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 15,
            //         color: Colors.white
            //       ),
            //     ),
            //     style: ElevatedButton.styleFrom(
            //       primary: const Color(0xff70cb88),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        )

            /*Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: DecoratedBox(
              decoration: BoxDecoration(
              color: Color.fromRGBO(255, 254, 254, 0.425),
              border: Border.all(color: Color.fromARGB(83, 225, 220, 220)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCheckboxVoucher(
                  value: _isChecked1,
                  image: 'assets/images/food1.png',
                  title: 'Disc 10% up to 20.000',
                  description: 'Minimal Spending of Rp 50.000. Rp 4.000 delivery discount.',
                  onChanged: (value) {
                    setState(() {
                      _isChecked1 = value ?? false;
                    });
                  },
                ),
                  SizedBox(height: 10),
                  CustomCheckboxVoucher(
                    value: _isChecked2, 
                    image: 'assets/images/food1.png', 
                    title: 'Disc 40% up to 30.000',
                    description: 'Minimal Spending of Rp 50.000. With SVB Payment.', 
                    onChanged: (value) {
                    setState(() {
                      _isChecked1 = value ?? false;
                    });
                  }
                  )
                ],
              ),
        )),*/
            ));
  }
}
