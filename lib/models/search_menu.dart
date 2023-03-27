class SearchMenu {
  List<Menu>? menuList;

  SearchMenu({this.menuList});

  SearchMenu.fromJson(Map<String, dynamic> json) {
    if (json['menuList'] != null) {
      menuList = <Menu>[];
      json['menuList'].forEach((v) {
        menuList!.add(Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (menuList != null) {
      data['menuList'] = menuList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'SearchMenu{menuList: $menuList}';
  }
}

class Menu {
  late String id;
  late String name;
  late int price;
  late String description;
  late bool inStock;
  late List<bool> restrictions;
  late String? imageId;
  late String? imageUrl;
  late String merchantId;

  Menu({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.inStock,
    required this.restrictions,
    this.imageId,
    this.imageUrl,
    required this.merchantId,
  });

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    inStock = json['inStock'];
    restrictions = json['restrictions'].cast<bool>();
    imageId = json['imageId'];
    imageUrl = json['imageUrl'];
    merchantId = json['merchantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['inStock'] = inStock;
    data['restrictions'] = restrictions;
    data['imageId'] = imageId;
    data['merchantId'] = merchantId;
    return data;
  }

  @override
  String toString() {
    return 'Menu{id: $id, name: $name, price: $price, description: $description, inStock: $inStock, restrictions: $restrictions, imageId: $imageId, merchantId: $merchantId}';
  }
}


/**
 * {
    "data": {
        "menuList": [
            {
                "id": "641863e1162f16f498eecf4b",
                "name": "ayam lonli",
                "price": 123123,
                "description": "adf",
                "inStock": false,
                "restrictions": [
                    true,
                    true,
                    true,
                    true,
                    true,
                    true
                ],
                "imageId": "6415e860684002e35a0e1dca",
                "merchantId": "64171e03c849eff0eeb7a441"
            },
            {
                "id": "641884474ce2a2f99baff0b3",
                "name": "ayam free",
                "price": 123123,
                "description": "adf",
                "inStock": true,
                "restrictions": [
                    true,
                    true,
                    true,
                    true,
                    true,
                    true
                ],
                "imageId": "6415e860684002e35a0e1dca",
                "merchantId": "64171e03c849eff0eeb7a441"
            },
            {
                "id": "641d782d37de199530ca9cf1",
                "name": "ayam solonli",
                "price": 1234,
                "description": "sendiri",
                "inStock": true,
                "restrictions": [
                    true,
                    true,
                    true,
                    true,
                    true,
                    true
                ],
                "imageId": null,
                "merchantId": "64171e03c849eff0eeb7a441"
            }
        ]
    }
}
 */