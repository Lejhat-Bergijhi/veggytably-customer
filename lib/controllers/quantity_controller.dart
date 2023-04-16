// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_customer/api/search_api.dart';
import 'package:veggytably_customer/models/search_menu.dart';

import '../api/merchant_api.dart';
import '../models/search_merchant.dart';
import '../controllers/merchant_controller.dart';

class Restaurant {
  final String id;
  final String name;
  final List<MenuItem> menu;

  Restaurant({required this.id, required this.name, required this.menu});
}

class MenuItem {
  final String id;
  final String name;
  final double price;

  MenuItem({required this.id, required this.name, required this.price});
}

class QuantityController extends GetxController {
  final RxList<Menu> menuList = <Menu>[].obs;
  var quantities = <Menu, int>{}.obs;
  final MerchantController merchantController = Get.find<MerchantController>();

  void updateQuantity(int index, int newQuantity) {
    final menu = merchantController.menuList[index];
    if (newQuantity == 0) {
      quantities.remove(menu);
    }
    quantities[menu] = newQuantity;
    merchantController.menuList[index] = menu;
    update();
  }

  int getQuantity(String itemId) {
    return quantities[itemId] ?? 0;
  }

  double getTotalPrice(List<MenuItem> menu) {
    List<Menu> menu = merchantController.menuList;
    int itemcount = menu.length;

    double totalPrice = 0;
    for (int i = 1; i < itemcount; i++) {
      int quantity = quantities[i] ?? 0;
      if (quantity > 0) {
        var price = menu[i].price;
        totalPrice += price * quantity;
      }
    }
    return totalPrice;
  }
}
