import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_customer/controllers/cart_controller.dart';
import 'package:veggytably_customer/controllers/geo_controller.dart';
import 'package:veggytably_customer/utils/socket_service.dart';
import 'package:veggytably_customer/views/deliver_order.dart';
import 'package:veggytably_customer/views/landing_page.dart';

import '../api/transaction_api.dart';
import '../models/driver_model.dart';
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

  void setDriver(Driver driver) {
    transaction!.driver = driver;
    update();
  }

  void updateStatus(String status) {
    transaction!.status = status;

    if (status == "FINISHED") {
      SocketService().disconnect();
      finishTransaction();
    }
    update();
  }

  void finishTransaction() {
    Get.to(() => LandingPage(initialIndex: 0));
    transaction = null;
    Get.snackbar('Order completed!', 'Enjoy your meal');
    CartController.to.clearCart();
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
      SocketService().connect();
      Transaction transaction = Transaction.fromJson(response.data["data"]);

      setTransaction(transaction);

      Get.to(() => DeliverOrderPage());
    } catch (e) {
      print(e);
      Get.snackbar("Failed to create order!", e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }
}
