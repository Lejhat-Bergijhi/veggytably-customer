import 'package:veggytably_customer/models/driver_model.dart';
import 'package:veggytably_customer/models/search_merchant.dart';

import 'cart.dart';

class Transaction {
  late String transactionId;
  late String status;
  late Address merchantAddress;
  late Address customerAddress;
  late double estimatedDeliveryTime;
  late Merchant merchant;
  late Cart cart;
  late num totalPrice;
  late num deliveryFee;
  Driver? driver;

  Transaction({
    required this.transactionId,
    required this.status,
    required this.merchantAddress,
    required this.customerAddress,
    required this.estimatedDeliveryTime,
    required this.merchant,
    required this.cart,
    required this.totalPrice,
    required this.deliveryFee,
  });

  factory Transaction.fromJson(Map<String, dynamic> body) {
    return Transaction(
      transactionId: body['transactionId'],
      status: body['status'],
      merchantAddress: Address.fromJson(body['merchantAddress']),
      customerAddress: Address.fromJson(body['customerAddress']),
      estimatedDeliveryTime: body['estimatedDeliveryTime'],
      merchant: Merchant.fromJson(body['merchant']),
      cart: Cart.fromJson(body['cart']),
      totalPrice: body['totalPrice'],
      deliveryFee: body['deliveryFee'],
    );
  }

  @override
  String toString() {
    return 'Transaction{transactionId: $transactionId, status: $status, merchantAddress: $merchantAddress, customerAddress: $customerAddress, estimatedDeliveryTime: $estimatedDeliveryTime, merchant: $merchant, cart: $cart, totalPrice: $totalPrice, deliveryFee: $deliveryFee}';
  }
}

class Address {
  late String id;
  late String address;
  late String? postalCode;
  late String? city;
  late String? province;
  late double latitude;
  late double longitude;

  Address({
    required this.id,
    required this.address,
    this.postalCode,
    this.city,
    this.province,
    required this.latitude,
    required this.longitude,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    postalCode = json['postalCode'];
    city = json['city'];
    province = json['province'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['postalCode'] = postalCode;
    data['city'] = city;
    data['province'] = province;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  @override
  String toString() {
    return 'Address{id: $id, address: $address, latitude: $latitude, longitude: $longitude}';
  }
}
