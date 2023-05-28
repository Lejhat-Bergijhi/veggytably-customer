import 'package:veggytably_customer/models/user_model.dart';

import 'cart.dart';

class Transaction {
  late String id;
  late String date;
  late String status;
  late String paymentMethod;
  late String pickupAddressId;
  late String customerAddressId;
  late String cartId;
  late String customerId;
  late String merchantId;
  late String? driverId;
  late Cart cart;
  late Customer customer;
  late Merchant merchant;
  late Driver? driver;

  Transaction({
    required this.id,
    required this.date,
    required this.status,
    required this.paymentMethod,
    required this.pickupAddressId,
    required this.customerAddressId,
    required this.cartId,
    required this.customerId,
    required this.merchantId,
    this.driverId,
    required this.cart,
    required this.customer,
    required this.merchant,
    this.driver,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    status = json['status'];
    paymentMethod = json['paymentMethod'];
    pickupAddressId = json['pickupAddressId'];
    customerAddressId = json['customerAddressId'];
    cartId = json['cartId'];
    customerId = json['customerId'];
    merchantId = json['merchantId'];
    driverId = json['driverId'];
    cart = (json['cart'] != null ? Cart.fromJson(json['cart']) : null)!;
    customer = (json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null)!;
    merchant = (json['merchant'] != null
        ? Merchant.fromJson(json['merchant'])
        : null)!;
    driver = json['driver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['status'] = status;
    data['paymentMethod'] = paymentMethod;
    data['pickupAddressId'] = pickupAddressId;
    data['customerAddressId'] = customerAddressId;
    data['cartId'] = cartId;
    data['customerId'] = customerId;
    data['merchantId'] = merchantId;
    data['driverId'] = driverId;
    data['cart'] = cart.toJson();
    data['customer'] = customer.toJson();
    data['merchant'] = merchant.toJson();
    data['driver'] = driver;
    return data;
  }
}

class Customer {
  late String id;
  late String? address;
  late List<dynamic> restrictions;
  late String userId;
  late User user;

  Customer({
    required this.id,
    this.address,
    required this.restrictions,
    required this.userId,
    required this.user,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    if (json['restrictions'] != null) {
      restrictions = List<dynamic>.empty(growable: true);
      json['restrictions'].forEach((v) {
        restrictions.add(v);
      });
    }
    userId = json['userId'];
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['restrictions'] = restrictions.map((v) => v.toJson()).toList();
    data['userId'] = userId;
    data['user'] = user.toJson();
    return data;
  }
}

class Merchant {
  late String id;
  late String restaurantName;
  late String restaurantAddress;
  late double rating;
  late String userId;

  Merchant({
    required this.id,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.rating,
    required this.userId,
  });

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantName = json['restaurantName'];
    restaurantAddress = json['restaurantAddress'];
    rating = json['rating'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['restaurantName'] = restaurantName;
    data['restaurantAddress'] = restaurantAddress;
    data['rating'] = rating;
    data['userId'] = userId;
    return data;
  }
}

class Driver {}
