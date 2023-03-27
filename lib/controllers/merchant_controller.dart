import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_customer/api/search_api.dart';
import 'package:veggytably_customer/models/search_menu.dart';

import '../api/merchant_api.dart';
import '../models/search_merchant.dart';

class MerchantController extends GetxController {
  final Rx<Merchant> _merchant = Merchant(
    id: "",
    duration: 0,
    price: 0,
    rating: 0,
    restaurantAddress: "",
    restaurantName: "",
    userId: "",
  ).obs;
  final RxList<Menu> menuList = <Menu>[].obs;

  RxBool isLoading = false.obs;

  Merchant get merchant => _merchant.value;

  Future<void> getMenuList(String merchantId) async {
    try {
      isLoading(true);
      update();

      Response response =
          await MerchantApi.instance.getMenuByMerchantId(merchantId);

      SearchMenu searchMenu = SearchMenu.fromJson(response.data["data"]);

      if (searchMenu.menuList == null) {
        throw Exception("Error loading search data.");
      }

      print("menus: ${searchMenu.menuList?.length}");

      menuList.value = searchMenu.menuList!;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }

  void setMerchant(Merchant merchant) {
    _merchant.value = merchant;
    update();
  }

  void setMenuList(List<Menu> menuList) {
    this.menuList.value = menuList;
    update();
  }
}
