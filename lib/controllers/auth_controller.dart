import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get/get.dart" hide Response;
// import "package:http/http.dart" as http;
import "package:veggytably_driver/controllers/profile_controller.dart";
import "package:veggytably_driver/views/upload_pic.dart";
import 'package:dio/dio.dart';
import "../api/auth_api.dart";
import "../models/authentication_response.dart";
import "../models/exception_response.dart";
import "../utils/api.endpoints.dart";
import "../views/landing_page.dart";
import "../views/login_page.dart";
// import "../views/home_page.dart";

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final _storage = const FlutterSecureStorage();

  Future<void> signUp(
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController,
    TextEditingController licensePlateController,
    TextEditingController vehicleTypeController,
  ) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.signUp);

      Map<String, String> body = {
        "username": usernameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "phone": phoneController.text,
        "licensePlate": licensePlateController.text,
        "vehicleType": vehicleTypeController.text,
      };

      Response response = await AuthApi.instance.postSignUp(body);

      print(response.data.toString());
      if (response.statusCode != 201) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      AuthenticationResponse authenticationResponse =
          AuthenticationResponse.fromJson(response.data);

      print(authenticationResponse.data.toJson());
      // store accessToken and refreshToken in secure storage
      await _storage.write(
          key: "refreshToken", value: authenticationResponse.data.refreshToken);

      Get.put(() => ProfileController(), permanent: true);

      ProfileController.to.setUser(authenticationResponse.data.user);
      // TODO: Navigate to home page
      Get.offAll(
        () => UploadPic(),
        transition: Transition.rightToLeft,
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      Map<String, String> body = {
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "role": "DRIVER",
      };

      Response response = await AuthApi.instance.postLogin(body);

      print(response.toString());

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      AuthenticationResponse authenticationResponse =
          AuthenticationResponse.fromJson(response.data);

      print(authenticationResponse.data.toJson());
      // store accessToken and refreshToken in secure storage
      await _storage.write(
          key: "refreshToken", value: authenticationResponse.data.refreshToken);

      Get.lazyPut(() => ProfileController(), fenix: true);
      ProfileController.to.setUser(authenticationResponse.data.user);

      // TODO: Navigate to home page
      Get.offAll(
        () => LandingPage(),
        transition: Transition.fade,
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> logout() async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      if (refreshToken == null) {
        throw Exception("Refresh token not found");
      }

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };

      Response response = await AuthApi.instance.postLogout(headers);

      if (response.statusCode != 200) {
        // TODO: Create error handler based on status code
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }
      await _storage.delete(key: "refreshToken");

      // await Get.delete<ProfileController>();
      ProfileController.to.clear();

      Get.offAll(
        () => const LoginPage(),
        transition: Transition.fade,
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<void> checkAuth() async {
    try {
      const storage = FlutterSecureStorage();
      String? refreshToken = await storage.read(key: "refreshToken");

      // check expire time of refreshToken
      if (refreshToken == null) {
        Get.offAll(
          () => const LoginPage(),
          transition: Transition.fade,
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }
}
