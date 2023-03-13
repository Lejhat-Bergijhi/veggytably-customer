class User {
  late String id;
  late String username;
  late String email;
  late String phone;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
