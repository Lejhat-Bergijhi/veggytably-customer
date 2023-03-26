import 'package:dio/dio.dart';

import '../utils/api.endpoints.dart';

class SearchApi {
  static final SearchApi instance = SearchApi();

  Future<dynamic> searchMerchant(String query) async {
    try {
      Response response = await Dio().get(ApiEndPoints.baseUrl +
          ApiEndPoints.customerEndpoints
              .searchMerchant(search: query, limit: 20));

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> searchMenu(String query) async {
    try {
      Response response = await Dio().get(ApiEndPoints.baseUrl +
          ApiEndPoints.customerEndpoints.searchMenu(search: query, limit: 20));

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
