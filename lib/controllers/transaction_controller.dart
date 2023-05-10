import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../api/transaction_api.dart';
import '../models/exception_response.dart';

class TransactionController extends GetxController {
  static TransactionController get to => Get.find();

  final RxDouble _domvetBalance = 0.0.obs;

  RxBool isLoading = false.obs;

  double get domvetBalance => _domvetBalance.value;

  void setDompetBalance(double dompetBalance) {
    _domvetBalance.value = dompetBalance;
    update();
  }

  void clearDompetBalance() {
    _domvetBalance.value = 0.0;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // fetch dompet balance
    getDompetBalance();
  }

  Future<void> getDompetBalance() async {
    try {
      isLoading.value = true;
      update();
      Response response = await TransactionApi.instance.getWallet();

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      var balance = response.data["data"]["wallet"].toDouble();
      setDompetBalance(balance);

      isLoading.value = false;
      update();
    } catch (e) {
      print(e);
      Get.snackbar("Failed to domvet balance", e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
