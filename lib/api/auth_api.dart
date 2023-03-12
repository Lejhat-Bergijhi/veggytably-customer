import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/api.endpoints.dart';

class AuthApi {
  static final AuthApi instance = AuthApi();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> postSignUp(Map<String, String> body) async {
    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.signUp,
        data: body,
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> postLogin(Map<String, String> body) async {
    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login,
        data: body,
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> postLogout() async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };

      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.logout,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        await _storage.delete(key: "refreshToken");
      }

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> postVerifyAuth() async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };

      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.verifyAuth,
        options: Options(
          headers: headers,
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
