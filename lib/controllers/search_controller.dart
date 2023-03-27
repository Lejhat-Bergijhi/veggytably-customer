import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_customer/api/search_api.dart';
import 'package:veggytably_customer/models/search_menu.dart';

import '../models/search_merchant.dart';

class SearchController extends GetxController {
  final _search = ''.obs;
  final _menuSearchResult = [].obs;
  final _merchantSearchResult = [].obs;
  set search(String value) => _search.value = value;

  RxBool isLoading = false.obs;

  String get search => _search.value;

  // method to search (just search both menu and restaurant)
  void searchAll(String query) async {
    try {
      isLoading(true);
      update();

      search = query;
      print(query);
      Response merchantResponse =
          await SearchApi.instance.searchMerchant(query);
      Response menuResponse = await SearchApi.instance.searchMenu(query);

      SearchMerchant searchMerchant =
          SearchMerchant.fromJson(merchantResponse.data["data"]);
      SearchMenu searchMenu = SearchMenu.fromJson(menuResponse.data["data"]);

      print("merchants: ${searchMerchant.merchantList?.length}}");
      print("menus: ${searchMenu.menuList?.length}");
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }
}
