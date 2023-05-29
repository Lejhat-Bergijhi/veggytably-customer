import 'package:veggytably_customer/models/search_menu.dart';

class Cart {
  late String id;
  late String customerId;
  late String merchantId;
  late List<CartItem> cartItem;

  Cart({
    required this.id,
    required this.customerId,
    required this.merchantId,
    required this.cartItem,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    merchantId = json['merchantId'];
    if (json['cartItem'] != null) {
      cartItem = <CartItem>[];
      json['cartItem'].forEach((v) {
        cartItem.add(CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerId'] = customerId;
    data['merchantId'] = merchantId;
    data['cartItem'] = cartItem.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'Cart{id: $id, customerId: $customerId, merchantId: $merchantId, cartItem: $cartItem}';
  }
}

class CartItem {
  late String? id;
  late int quantity;
  late String cartId;
  late String menuId;
  late Menu menu;

  CartItem({
    this.id,
    required this.quantity,
    required this.cartId,
    required this.menuId,
    required this.menu,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    cartId = json['cartId'];
    menuId = json['menuId'];
    menu = (json['menu'] != null ? Menu.fromJson(json['menu']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['cartId'] = cartId;
    data['menuId'] = menuId;
    data['menu'] = menu.toJson();
    return data;
  }

  @override
  String toString() {
    return 'CartItem{id: $id, quantity: $quantity, cartId: $cartId, menuId: $menuId, menu: $menu}';
  }
}
