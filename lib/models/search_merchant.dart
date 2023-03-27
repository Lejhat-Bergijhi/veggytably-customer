class SearchMerchant {
  List<Merchant?>? merchantList;

  SearchMerchant({this.merchantList});

  SearchMerchant.fromJson(Map<String, dynamic> json) {
    if (json['merchantList'] != null) {
      merchantList = <Merchant>[];
      json['merchantList'].forEach((v) {
        merchantList!.add(Merchant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (merchantList != null) {
      data['merchantList'] = merchantList!.map((v) => v!.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'SearchMerchant{merchantList: $merchantList}';
  }
}

class Merchant {
  late String id;
  late String restaurantName;
  late String restaurantAddress;
  late int rating;
  late String userId;
  late int price;
  late int duration;

  Merchant({
    required this.id,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.rating,
    required this.userId,
    required this.price,
    required this.duration,
  });

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantName = json['restaurantName'];
    restaurantAddress = json['restaurantAddress'];
    rating = json['rating'];
    userId = json['userId'];
    price = json['price'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['restaurantName'] = restaurantName;
    data['restaurantAddress'] = restaurantAddress;
    data['rating'] = rating;
    data['userId'] = userId;
    data['price'] = price;
    data['duration'] = duration;
    return data;
  }

  @override
  String toString() {
    return 'Merchant{id: $id, restaurantName: $restaurantName, restaurantAddress: $restaurantAddress, rating: $rating, userId: $userId, price: $price, duration: $duration}';
  }
}
