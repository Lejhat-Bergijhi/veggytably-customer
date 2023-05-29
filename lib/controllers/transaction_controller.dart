import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_customer/controllers/cart_controller.dart';
import 'package:veggytably_customer/controllers/geo_controller.dart';

import '../api/transaction_api.dart';
import '../models/exception_response.dart';
import '../models/transasction_model.dart';

class TransactionController extends GetxController {
  static TransactionController get to => Get.find();
  Transaction? transaction;

  final RxDouble _domvetBalance = 0.0.obs;

  RxBool isLoading = false.obs;

  double get domvetBalance => _domvetBalance.value;

  void setDompetBalance(double dompetBalance) {
    _domvetBalance.value = dompetBalance;
    update();
  }

  void setTransaction(Transaction transaction) {
    this.transaction = transaction;
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

  Future<void> postTransaction({required String paymentMethod}) async {
    try {
      isLoading(true);
      update();

      var currentPosition = GeoController.to.currentPosition;

      Map<String, dynamic> body = {
        "cartId": CartController.to.cart.id,
        "merchantId": CartController.to.cart.merchantId,
        "customerAddress": {
          "coordinates": {
            "latitude": currentPosition.latitude,
            "longitude": currentPosition.longitude,
          }
        },
        "paymentMethod": paymentMethod == 'Domvet' ? 'WALLET' : 'CASH',
      };

      Response response = await TransactionApi.instance.postTransaction(body);

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      // if success connect to socket
      Transaction transaction = Transaction.fromJson(response.data["data"]);

      setTransaction(transaction);
    } catch (e) {
      print(e);
      Get.snackbar("Failed to create order!", e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }
}
