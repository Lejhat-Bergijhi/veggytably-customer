import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get/get.dart" hide Response;
import 'package:dio/dio.dart';
import "package:veggytably_customer/views/home_page_user.dart";
import "package:veggytably_customer/views/landing_page.dart";
import "../api/auth_api.dart";
import "../models/authentication_response.dart";
import '../models/user_model.dart';
import "../models/exception_response.dart";
import "../views/login_page.dart";

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final _storage = const FlutterSecureStorage();

  final Rx<User> _user = User(
    id: "",
    username: "",
    email: "",
    phone: "",
  ).obs;
  RxBool isLogin = false.obs;
  RxBool isLoading = false.obs;

  User get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    // TODO uncomment code if ready to implement
    checkAuth();
    ever(isLogin, _initialScreen);
  }

  void _initialScreen(bool isLogin) {
    if (isLogin) {
      Get.offAll(
        () => LandingPage(
          initialIndex: 0,
        ),
        transition: Transition.rightToLeft,
      );
    } else {
      Get.offAll(
        () => LoginPage(),
        transition: Transition.rightToLeft,
      );
    }
  }

  Future<void> signUp(
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController,
  ) async {
    try {
      Map<String, String> body = {
        "username": usernameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "phone": phoneController.text,
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

      setUser(authenticationResponse.data.user);

      // TODO: Navigate to home page
      Get.offAll(
        () => LandingPage(
          initialIndex: 0,
        ),
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
        "role": "CUSTOMER",
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

      setUser(authenticationResponse.data.user);

      Get.offAll(
        () => LandingPage(
          initialIndex: 0,
        ),
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

      Response response = await AuthApi.instance.postLogout();

      if (response.statusCode != 200) {
        // TODO: Create error handler based on status code
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      Get.offAll(
        () => LoginPage(),
        transition: Transition.fade,
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> checkAuth() async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      // check expire time of refreshToken
      if (refreshToken == null) {
        clearUser();
        return;
      }
      // verify refreshToken
      Response response = await AuthApi.instance.postVerifyAuth();

      if (response.statusCode != 200) {
        if (response.statusCode == 401) {
          clearUser();
        }

        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      User user = User.fromJson(response.data["data"]["user"]);

      setUser(user);
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updateUser(
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController phoneController,
  ) async {
    try {
      isLoading.value = true;
      String? refreshToken = await _storage.read(key: "refreshToken");

      if (refreshToken == null) {
        throw Exception("Refresh token not found");
      }

      Map<String, String> body = {
        "username": usernameController.text,
        "email": emailController.text.trim(),
        "phone": phoneController.text,
      };

      Response response = await AuthApi.instance.updateUser(body);

      if (response.statusCode != 200) {
        if (response.statusCode == 401) {
          clearUser();
        }

        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      User user = User.fromJson(response.data["data"]["user"]);

      Get.snackbar("Success", "Update profile success!");
      Get.offAll(
        () => LandingPage(initialIndex: 3),
        transition: Transition.fade,
      );

      setUser(user);
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void setUser(User u) {
    _user.value = u;
    isLogin.value = true;
    update();
  }

  void clearUser() {
    _user.value = User(
      id: "",
      username: "",
      email: "",
      phone: "",
    );
    isLogin.value = false;
    update();
  }
}
