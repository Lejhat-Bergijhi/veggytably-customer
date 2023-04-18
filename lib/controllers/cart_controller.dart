import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_customer/controllers/merchant_controller.dart';

import '../api/cart_api.dart';
import '../models/cart.dart';
import '../models/exception_response.dart';
import '../models/search_menu.dart';
import 'auth_controller.dart';

class CartController extends GetxController {
  final Rx<Cart> _cart = Cart(
    id: "",
    merchantId: "",
    customerId: AuthController.to.user.id,
    cartItem: [],
  ).obs;
  final RxInt totalPrice = 0.obs;
  RxBool isLoading = false.obs;

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

  void setTotalPrice(int totalPrice) {
    this.totalPrice.value = totalPrice;
    update();
  }

  void countTotalPrice() {
    int totalPrice = 0;
    for (var cartItem in _cart.value.cartItem) {
      totalPrice += cartItem.quantity * cartItem.menu.price;
    }
    setTotalPrice(totalPrice);
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
      isLoading(true);
      update();

      Response response =
          await CartApi.instance.getCartByMerchantId(merchantId);

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      Cart cart = Cart.fromJson(response.data["data"]["cart"]);
      print(cart.cartItem.first);
      setCart(cart);
      countTotalPrice();
    } catch (e) {
      print(e);
      Get.snackbar("Failed to get Cart information", e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    try {
      isLoading(true);
      update();

      Map<String, dynamic> body = {
        "menuId": cartItem.menuId,
        "quantity": cartItem.quantity,
      };

      Response response = await CartApi.instance
          .updateCartByMerchantId(MerchantController.to.merchant.id, body);

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      // if response is succesful refetch cart
      getCart(MerchantController.to.merchant.id);

      // Get.back();
    } catch (e) {
      print(e);
      Get.snackbar("Failed to insert item to cart.", e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> incrementCartItemQuantity(Menu menu, int counter) async {
    try {
      isLoading(true);
      update();

      CartItem cartItem = _cart.value.cartItem
              .firstWhereOrNull((element) => element.menuId == menu.id) ??
          CartItem(
            cartId: cart.id,
            menuId: menu.id,
            menu: menu,
            quantity: 0,
          );

      Map<String, dynamic> body = {
        "menuId": cartItem.menuId,
        "quantity": cartItem.quantity + counter,
      };

      Response response = await CartApi.instance
          .updateCartByMerchantId(MerchantController.to.merchant.id, body);

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      // if response is succesful refetch cart
      getCart(MerchantController.to.merchant.id);

      // Get.back();
    } catch (e) {
      print(e);
      Get.snackbar("Failed to insert item to cart.", e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }
}
