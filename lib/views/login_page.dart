import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/signup_page.dart';
import '../controllers/auth_controller.dart';
import '/widgets/input_text.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 36, right: 36),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/Group 335.png',
                      width: 360.0,
                      height: 270.71,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/Subtract.png',
                      width: 39.0,
                      height: 35.93,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // pemilihan jenos vegetarian apakah user tau, user cuma tau dia vegetarian, butuh edukasi, udah cukup bagus menggunakan defult checkbox
                  const SizedBox(height: 5),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please login to your account to continue',
                      style: TextStyle(
                        color: Color.fromARGB(131, 88, 83, 83),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Text:
                  const SizedBox(height: 16),

                  Column(
                    children: [
                      InputTextField(
                        emailController,
                        'Email or Telephone Number',
                      ),
                      const SizedBox(height: 16),
                      InputTextField(
                        passwordController,
                        'Password',
                      ),
                    ],
                  ),
                  // Input Email or Telephone Number
                  const SizedBox(height: 16),

                  // Login button
                  SizedBox(
                    // width: 300,
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthController.to.login(
                          emailController,
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
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Text: Don't have an account?
                  SizedBox(
                      width: 219,
                      height: 21,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New user? ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => SignUpPage(),
                                  transition: Transition.fade);
                            },
                            child: const Text(
                              'Sign Up',
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
      ),
    );
  }
}
