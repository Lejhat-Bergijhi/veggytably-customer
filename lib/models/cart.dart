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
  late String id;
  late int quantity;
  late String cartId;
  late String menuId;
  late Menu menu;

  CartItem({
    required this.id,
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

// class Menu {
//   String? id;
//   String? name;
//   int? price;
//   String? description;
//   bool? inStock;
//   List<bool>? restrictions;
//   String? imageId;
//   String? merchantId;

//   Menu(
//       {this.id,
//       this.name,
//       this.price,
//       this.description,
//       this.inStock,
//       this.restrictions,
//       this.imageId,
//       this.merchantId});

//   Menu.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     price = json['price'];
//     description = json['description'];
//     inStock = json['inStock'];
//     restrictions = json['restrictions'].cast<bool>();
//     imageId = json['imageId'];
//     merchantId = json['merchantId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['price'] = price;
//     data['description'] = description;
//     data['inStock'] = inStock;
//     data['restrictions'] = restrictions;
//     data['imageId'] = imageId;
//     data['merchantId'] = merchantId;
//     return data;
//   }
// }
