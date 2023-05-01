import 'package:get/get.dart';

/**
 * [
                  'Lacto-vegetarian',
                  'Ovo-vegetarian',
                  'Pollo-vegetarian',
                  'Lacto-ovo vegetarian',
                  'Pesco-vegetarian'
                ]
 */

class VoucherController extends GetxController {
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

  int _selectedOption = -1;
  int get selectedOption => _selectedOption;

  set selectedOption(int value) => _selectedOption = value;

  void setVoucher(int selectedOption) {
    this._selectedOption = selectedOption;
    print(_selectedOption);
    update();
  }

  int getIndex() {
    return _selectedOption;
  }
}
