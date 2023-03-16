import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:veggytably_customer/views/login_page.dart';
import '../controllers/auth_controller.dart';
import '/widgets/input_text.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 36, right: 36),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 145),

                Container(
                  alignment: Alignment.center,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/Subtract.png',
                      width: 39.0,
                      height: 35.93,
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create an account to start your dietary journey!',
                    style: TextStyle(
                      color: Color.fromARGB(206, 47, 47, 47),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                Column(
                  children: [
                    InputTextField(
                      usernameController,
                      'Name',
                    ),
                    const SizedBox(height: 10),
                    InputTextField(
                      emailController,
                      'Email',
                    ),
                    const SizedBox(height: 10),
                    InputTextField(
                      phoneController,
                      'Telephone Number',
                    ),
                    const SizedBox(height: 10),
                    InputTextField(
                      passwordController,
                      'Password',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                // Input Email or Telephone Number
                const SizedBox(height: 10),

                // Login Continue button
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.to.signUp(
                        usernameController,
                        emailController,
                        phoneController,
                        passwordController,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff70cb88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Text: Don't have an account?
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 21,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(() => const LoginPage(),
                                transition: Transition.fade);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff356631),
                              //underline
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 5),

                // Text: Sign Up
              ]),
        ),
      ),
    );
  }
}
