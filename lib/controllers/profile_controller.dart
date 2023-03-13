import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veggytably_driver/api/driver_api.dart';
import 'package:veggytably_driver/models/authentication_response.dart';

class ProfileController extends GetxController {
  static ProfileController to = Get.find<ProfileController>();
  RxString username = "username".obs;
  RxString phone = "phone".obs;
  var isLoading = false.obs;
  final Rx<Uint8List> imageData = Uint8List(0).obs;

  @override
  void onInit() {
    super.onInit();
    fetchImage();
  }

  void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: imageSource,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 50,
      );
      isLoading(true);
      if (pickedFile != null) {
        var response =
            await DriverApi.instance.uploadImageFile(pickedFile.path);

        if (response != null || response.statusCode == 200) {
          final data = response.data['data'];
          final imageBase64 = data['profilePicture'];
          final imageData = base64.decode(imageBase64);

          ProfileController.to.setImage(imageData);

          Get.snackbar('Success', 'Image uploaded successfully');
        } else if (response.statusCode == 401) {
          Get.offAllNamed('/sign_up');
        } else {
          Get.snackbar('Failed', 'Error Code: ${response.statusCode}');
        }
      } else {
        Get.snackbar('Failed', 'Image not selected');
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchImage() async {
    try {
      isLoading(true);
      update();
      var response = await DriverApi.instance.getProfilePicture();
      print(response.toString());
      if (response.statusCode == 200) {
        if (!response.data['data']['isFound']) {
          return;
        }

        final data = response.data['data'];
        final imageBase64 = data['profilePicture'];
        final imageData = base64.decode(imageBase64);
        print("size: ${imageData.lengthInBytes}");

        ProfileController.to.setImage(imageData);
      } else {
        Get.snackbar('Failed', 'Error Code: ${response.statusCode}');
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  void setUser(User user) {
    username.value = user.username;
    phone.value = user.phone;
    update();
  }

  void setImage(Uint8List image) {
    imageData.value = image;
    // update();
  }

  Future clear() async {
    username.value = "";
    phone.value = "";
    imageData.value = Uint8List(0);
    update();
    ImageCache().clear();
    await Get.delete<ProfileController>();
  }
}
