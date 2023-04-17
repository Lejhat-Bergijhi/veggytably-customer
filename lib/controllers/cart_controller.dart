import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_customer/controllers/merchant_controller.dart';

import '../api/cart_api.dart';
import '../models/cart.dart';
import '../models/exception_response.dart';
import 'auth_controller.dart';

class CartController extends GetxController {
  final Rx<Cart> _cart = Cart(
    id: "",
    merchantId: "",
    customerId: AuthController.to.user.id,
    cartItem: [],
  ).obs;

  Cart get cart => _cart.value;

  @override
  void onInit() {
    super.onInit();
    // fetch cart
    getCart(MerchantController.to.merchant.id);
  }

  void setCart(Cart cart) {
    _cart.value = cart;
    update();
  }

  void clearCart() {
    _cart.value = Cart(
      id: "",
      merchantId: "",
      customerId: AuthController.to.user.id,
      cartItem: [],
    );
    update();
  }

  void addCartItem(CartItem cartItem) {
    _cart.value.cartItem.add(cartItem);
    update();
  }

  Future<void> getCart(String merchantId) async {
    try {
      Response response =
          await CartApi.instance.getCartByMerchantId(merchantId);

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      Cart cart = Cart.fromJson(response.data["data"]["cart"]);
      print(cart.cartItem.first);
      setCart(cart);
    } catch (e) {
      print(e);
      Get.snackbar("Failed to get Cart information", e.toString());
    }
  }

  Future<void> updateCart() async {}
}
