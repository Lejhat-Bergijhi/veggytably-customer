import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../api/cart_api.dart';
import '../models/exception_response.dart';
import '../models/voucher.dart';
import 'cart_controller.dart';

class VoucherController extends GetxController {
  int _selectedOption = -1;
  int get selectedOption => _selectedOption;

  final RxList<Voucher> _voucherList = <Voucher>[].obs;
  final Rx<Voucher?> _selectedVoucher = null.obs;

  List<Voucher> get vouchers => _voucherList.toList();
  Voucher? get selectedVoucher => _selectedVoucher.value;

  RxBool isLoading = false.obs;

  set selectedOption(int value) => _selectedOption = value;

  void setVoucher(int selectedOption) {
    _selectedOption = selectedOption;
    print(_selectedOption);
    update();
  }

  Future<void> getVouchers() async {
    try {
      isLoading(true);
      update();

      Response response =
          await CartApi.instance.getVouchersByCartId(CartController.to.cart.id);

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      List<Voucher> vouchers = [];
      for (var voucher in response.data["data"]["vouchers"]) {
        vouchers.add(Voucher.fromJson(voucher));
      }

      _voucherList.value = vouchers;

      print(_voucherList.length);
    } catch (e) {
      print(e);
      Get.snackbar("Failed to get vouchers.", e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  int getIndex() {
    return _selectedOption;
  }
}
