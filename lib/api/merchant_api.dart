import 'package:dio/dio.dart';

import '../utils/api.endpoints.dart';

class MerchantApi {
  static final MerchantApi instance = MerchantApi();

  Future<dynamic> getMenuByMerchantId(String merchantId) async {
    try {
      Response response = await Dio().get(ApiEndPoints.baseUrl +
          ApiEndPoints.customerEndpoints
              .getMerchantMenu(merchantId: merchantId, limit: 20));

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
