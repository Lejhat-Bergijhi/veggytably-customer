import 'package:get/get.dart';

import '../models/cart.dart';
import 'auth_controller.dart';

class CartController extends GetxController {
  final Rx<Cart> _cart = Cart(
    id: "",
    merchantId: "",
    customerId: AuthController.to.user.id,
    cartItem: [],
  ).obs;

  Cart get cart => _cart.value;

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
}
