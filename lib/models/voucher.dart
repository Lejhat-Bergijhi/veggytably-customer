class Voucher {
  late String id;
  late double discount;
  late int maximumDiscount;
  late int minimumPurchase;
  late String logo;
  late String title;
  late String description;
  late String details;
  late String expiryDate;
  late bool isUsed;
  late String customerId;
  late bool? isEligible;

  Voucher({
    required this.id,
    required this.discount,
    required this.maximumDiscount,
    required this.minimumPurchase,
    required this.logo,
    required this.title,
    required this.description,
    required this.details,
    required this.expiryDate,
    required this.isUsed,
    required this.customerId,
    this.isEligible,
  });

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discount = json['discount'];
    maximumDiscount = json['maximumDiscount'];
    minimumPurchase = json['minimumPurchase'];
    logo = json['logo'];
    title = json['title'];
    description = json['description'];
    details = json['details'];
    expiryDate = json['expiryDate'];
    isUsed = json['isUsed'];
    customerId = json['customerId'];
    isEligible = json['isEligible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['discount'] = discount;
    data['maximumDiscount'] = maximumDiscount;
    data['minimumPurchase'] = minimumPurchase;
    data['logo'] = logo;
    data['title'] = title;
    data['description'] = description;
    data['details'] = details;
    data['expiryDate'] = expiryDate;
    data['isUsed'] = isUsed;
    data['customerId'] = customerId;
    data['isEligible'] = isEligible;
    return data;
  }
}
