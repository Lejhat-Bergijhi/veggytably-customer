import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/api.endpoints.dart';

class TransactionApi {
  static final TransactionApi instance = TransactionApi();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> getWallet() async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };

      Response response = await Dio().get(
          ApiEndPoints.baseUrl +
              ApiEndPoints.transactionEndpoints.getDomvetBalance,
          options: Options(
            headers: headers,
          ));

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> updateCartByMerchantId(
      String merchantId, Map<String, dynamic> body) async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };

      Response response = await Dio().put(
        ApiEndPoints.baseUrl +
            ApiEndPoints.customerEndpoints.updateCart(merchantId: merchantId),
        data: body,
        options: Options(
          headers: headers,
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> getVouchersByCartId(
    String merchantId,
  ) async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };

      Response response = await Dio().get(
        ApiEndPoints.baseUrl +
            ApiEndPoints.customerEndpoints.getVouchersByCartId(
              cartId: merchantId,
            ),
        options: Options(
          headers: headers,
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> postTransaction(Map<String, dynamic> body) async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };

      Response response = await Dio().post(
        ApiEndPoints.baseUrl +
            ApiEndPoints.transactionEndpoints.postTransaction,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
