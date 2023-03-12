import 'user_model.dart';

class AuthenticationResponse {
  late Data data;

  AuthenticationResponse({required this.data});

  AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  late User user;
  late String refreshToken;

  Data({required this.user, required this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['refreshToken'] = refreshToken;
    return data;
  }
}
