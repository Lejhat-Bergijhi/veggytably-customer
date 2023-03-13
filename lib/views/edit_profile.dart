import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/landing_page.dart';
import 'package:veggytably_customer/views/profile_page.dart';
import 'package:veggytably_customer/widgets/upload_pic.dart';
import 'package:veggytably_customer/widgets/input_text.dart';

import '../controllers/auth_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController =
        TextEditingController(text: AuthController.to.user.username);
    TextEditingController emailController =
        TextEditingController(text: AuthController.to.user.email);
    TextEditingController phoneController =
        TextEditingController(text: AuthController.to.user.phone);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, top: 10),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 50,
        leadingWidth: 30,
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        padding: const EdgeInsets.only(top: 11, left: 40, right: 40),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const UploadPic(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "NAME",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                InputTextField(
                  usernameController,
                  'Name',
                ),
                const SizedBox(height: 5),
                const Text(
                  "EMAIL",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                InputTextField(
                  emailController,
                  'Email',
                ),
                const SizedBox(height: 5),
                const Text(
                  "TELEPHONE NUMBER",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                InputTextField(
                  phoneController,
                  'Telephone Number',
                ),
                const SizedBox(height: 10),
              ],
            ),
            // Input Email or Telephone Number
            const SizedBox(height: 10),

            // Login button
            SizedBox(
              width: 300,
              height: 45,
              child: Obx(() => ElevatedButton(
                    onPressed: () {
                      AuthController.to.updateUser(
                        usernameController,
                        emailController,
                        phoneController,
                      );
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AuthController.to.isLoading.value
                          ? Color.fromARGB(255, 189, 189, 189)
                          : Color(0xff70cb88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
