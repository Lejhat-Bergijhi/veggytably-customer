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
    if (cartItem != null) {
      data['cartItem'] = cartItem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItem {
  late String id;
  late int quantity;
  late String cartId;
  late String menuId;

  CartItem({
    required this.id,
    required this.quantity,
    required this.cartId,
    required this.menuId,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    cartId = json['cartId'];
    menuId = json['menuId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['cartId'] = cartId;
    data['menuId'] = menuId;
    return data;
  }
}
