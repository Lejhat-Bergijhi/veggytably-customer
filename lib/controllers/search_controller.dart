import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_customer/api/search_api.dart';

class SearchController extends GetxController {
  final _search = ''.obs;
  set search(String value) => _search.value = value;

  String get search => _search.value;

  // method to search (just search both menu and restaurant)
  void searchAll(String query) async {
    search = query;
    print(query);
    Response merchantResponse = await SearchApi.instance.searchMerchant(query);
    Response menuResponse = await SearchApi.instance.searchMenu(query);

    print(merchantResponse.data);
    print(menuResponse.data);
  }
}
