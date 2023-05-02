import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/controllers/voucher_controller.dart';
import 'package:veggytably_customer/widgets/voucher_item.dart';

int chosen = -1;

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
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
      "voucherDetails":
          '''Enjoy 10% (max. Rp30rb) discount for every DietDash order with minimum order Rp40rb and the following Terms & Conditions: 

- Valid at restaurants with available promo code DIETDASHMANIA entered on 'Offer page Valid for 1x transactions per user with capped daily redemption Valid in Surabaya, Bandung, Semarang, Yogyakarta, Makassar, Medan, Bali, Palembang, Kebumen, Malang, Kediri, Garut, Sukabumi, Tasikmalaya, Cilacap, Pekalongan, Tegal, Solo, Bantul, Klaten. 
- Valid for: Pengantaran/Delivery 
- Not valid for purchasing cigarettes and alcohol beverages. The parking fee is not included. 
- DietDash has the right to cancel transactions/ cancel the use of the Promo without any prior notice, if there are indications of fraud/ abuse/ other reasons. 
- DietDash reserves the right to alter, extend, terminate the promotion/ amend the terms & conditions at its sole discretion at any time without prior notice to the Consumer 
- DietDash can personalize Promos given to users according to location, type of order, distance from restaurants, time of day, and other factors based on DietDash’s internal policies. By joining this promo, Consumer agrees to obey with Term and Service (dietdash.com/id/en/terms-policies/transport-delivery-logistics/) & Privacy Notice (dietdash.com/id/en/terms-policies/privacy-notice/)''',
    },
    {
      "id": 1,
      'isChecked': false,
      "name": "Disc 40% up to 30.000",
      "description": "Minimal Spending of Rp 50.000. With SVB Payment.",
      "discount": 40,
      "maxDiscount": 30000,
      "image": "assets/images/vc2.png",
      "voucherDetails":
          '''Enjoy 40% (max. Rp30rb) discount for every DietDash order with minimum order Rp50rb and the following Terms & Conditions: 

- Payment with SVB visa card products.
- Valid at restaurants with available promo code DIETGABANGKRUT entered on 'Offer page Valid for 1x transactions per user with capped daily redemption Valid in Surabaya, Bandung, Semarang, Yogyakarta, Makassar, Medan, Bali, Palembang, Kebumen, Malang, Kediri, Garut, Sukabumi, Tasikmalaya, Cilacap, Pekalongan, Tegal, Solo, Bantul, Klaten. 
- Valid for: Pengantaran/Delivery 
- Not valid for purchasing cigarettes and alcohol beverages. The parking fee is not included. 
- DietDash has the right to cancel transactions/ cancel the use of the Promo without any prior notice, if there are indications of fraud/ abuse/ other reasons. 
- DietDash reserves the right to alter, extend, terminate the promotion/ amend the terms & conditions at its sole discretion at any time without prior notice to the Consumer 
- DietDash can personalize Promos given to users according to location, type of order, distance from restaurants, time of day, and other factors based on DietDash’s internal policies. By joining this promo, Consumer agrees to obey with Term and Service (dietdash.com/id/en/terms-policies/transport-delivery-logistics/) & Privacy Notice (dietdash.com/id/en/terms-policies/privacy-notice/)''',
    },
    {
      "id": 2,
      'isChecked': false,
      "name": "Disc 10% up to 80.000",
      "description": "Minimal Spending of Rp 0. Rp 4.000 delivery discount.",
      "discount": 10,
      "maxDiscount": 80000,
      "image": "assets/images/vc3.png",
      "voucherDetails":
          '''Enjoy 10% (max. Rp80rb) discount for every DietDash order with no minimum order, extra Rp 10.000 delivery discount, and the following Terms & Conditions: 

- This voucher is provided in promotion cooperation with FTEks 
- Valid at restaurants with available promo code DIETDASH10% entered on 'Offer page Valid for 1x transactions per user with capped daily redemption Valid in Surabaya, Bandung, Semarang, Yogyakarta, Makassar, Medan, Bali, Palembang, Kebumen, Malang, Kediri, Garut, Sukabumi, Tasikmalaya, Cilacap, Pekalongan, Tegal, Solo, Bantul, Klaten. 
- Valid for: Pengantaran/Delivery 
- Not valid for purchasing cigarettes and alcohol beverages. The parking fee is not included. 
- DietDash has the right to cancel transactions/ cancel the use of the Promo without any prior notice, if there are indications of fraud/ abuse/ other reasons. 
- DietDash reserves the right to alter, extend, terminate the promotion/ amend the terms & conditions at its sole discretion at any time without prior notice to the Consumer 
- DietDash can personalize Promos given to users according to location, type of order, distance from restaurants, time of day, and other factors based on DietDash’s internal policies. By joining this promo, Consumer agrees to obey with Term and Service (dietdash.com/id/en/terms-policies/transport-delivery-logistics/) & Privacy Notice (dietdash.com/id/en/terms-policies/privacy-notice/)''',
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
      "voucherDetails":
          '''Enjoy 50% (max. Rp25rb) discount for every DietDash order with minimum order Rp80rb, with extra Rp8rb discount, and the following Terms & Conditions: 

- Payment with FWB Card.
- Valid at restaurants with available promo code FWBENEDIET entered on 'Offer page Valid for 1x transactions per user with capped daily redemption Valid in Surabaya, Bandung, Semarang, Yogyakarta, Makassar, Medan, Bali, Palembang, Kebumen, Malang, Kediri, Garut, Sukabumi, Tasikmalaya, Cilacap, Pekalongan, Tegal, Solo, Bantul, Klaten. 
- Valid for: Pengantaran/Delivery 
- Not valid for purchasing cigarettes and alcohol beverages. The parking fee is not included. 
- DietDash has the right to cancel transactions/ cancel the use of the Promo without any prior notice, if there are indications of fraud/ abuse/ other reasons. 
- DietDash reserves the right to alter, extend, terminate the promotion/ amend the terms & conditions at its sole discretion at any time without prior notice to the Consumer 
- DietDash can personalize Promos given to users according to location, type of order, distance from restaurants, time of day, and other factors based on DietDash’s internal policies. By joining this promo, Consumer agrees to obey with Term and Service (dietdash.com/id/en/terms-policies/transport-delivery-logistics/) & Privacy Notice (dietdash.com/id/en/terms-policies/privacy-notice/)''',
    },
    {
      "id": 4,
      'isChecked': false,
      "name": "Disc 20% up to 40.000",
      "description": "Minimal Spending of Rp 60.000. With FFS Payment.",
      "discount": 20,
      "maxDiscount": 40000,
      "image": "assets/images/vc5.png",
      "voucherDetails":
          '''Enjoy 20% (max. Rp40rb) discount for every DietDash order with minimum order Rp60rb and the following Terms & Conditions: 

- Payment with FFS gold plan card.
- Valid at restaurants with available promo code FORDIETSAKE entered on 'Offer page Valid for 1x transactions per user with capped daily redemption Valid in Surabaya, Bandung, Semarang, Yogyakarta, Makassar, Medan, Bali, Palembang, Kebumen, Malang, Kediri, Garut, Sukabumi, Tasikmalaya, Cilacap, Pekalongan, Tegal, Solo, Bantul, Klaten. 
- Valid for: Pengantaran/Delivery 
- Not valid for purchasing cigarettes and alcohol beverages. The parking fee is not included. 
- DietDash has the right to cancel transactions/ cancel the use of the Promo without any prior notice, if there are indications of fraud/ abuse/ other reasons. 
- DietDash reserves the right to alter, extend, terminate the promotion/ amend the terms & conditions at its sole discretion at any time without prior notice to the Consumer 
- DietDash can personalize Promos given to users according to location, type of order, distance from restaurants, time of day, and other factors based on DietDash’s internal policies. By joining this promo, Consumer agrees to obey with Term and Service (dietdash.com/id/en/terms-policies/transport-delivery-logistics/) & Privacy Notice (dietdash.com/id/en/terms-policies/privacy-notice/)''',
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
              fontSize: 22,
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
            child: Stack(
          children: [
            GetBuilder<VoucherController>(builder: (controller) {
              return Column(
                children: [
                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      itemCount: controller.vouchers.length,
                      itemBuilder: (context, index) {
                        // check if current voucher is chosen
                        if (controller.vouchers[index].id !=
                                controller.selectedVoucher.id &&
                            controller.selectedVoucher.id != "init") {
                          return VoucherItem(
                            voucher: controller.vouchers[index],
                            disabled: true,
                          );
                        }

                        // check if voucher is eligible
                        if (controller.vouchers[index].isEligible != true) {
                          return VoucherItem(
                            voucher: controller.vouchers[index],
                            disabled: true,
                          );
                        }

                        return VoucherItem(voucher: controller.vouchers[index]);
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
                ],
              );
            }),
            Positioned(
              bottom: 30,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: MediaQuery.of(context).size.width - 48,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    // Get.offAll(() => const ProfilePage(),
                    //     transition: Transition.fade);
                    Get.back();
                  },
                  child: const Text(
                    'Confirm Voucher',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff70cb88),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
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
