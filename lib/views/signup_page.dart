import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:veggytably_customer/views/login_page.dart';
import 'package:veggytably_customer/views/restriction_page.dart';

import '../controllers/auth_controller.dart';

import '/widgets/input_text.dart';
import 'login_page.dart';

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
          child: Center(
            child: Column(children: [
              SizedBox(height: 145),

              Padding(
                padding: EdgeInsets.only(left: 36),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/images/Subtract.png',
                    width: 39.0,
                    height: 35.93,
                  ),
                ),
              ),
              SizedBox(height: 5),

              Padding(
                padding: EdgeInsets.only(left: 36),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),

              Padding(
                padding: EdgeInsets.only(left: 36),
                child: Align(
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
              ),
              SizedBox(height: 8),

              Column(
                children: [
                  Container(
                    width: 300,
                    child: InputTextField(
                      usernameController,
                      'Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 300,
                    child: InputTextField(
                      emailController,
                      'Email',
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 300,
                    child: InputTextField(
                      phoneController,
                      'Telephone Number',
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 300,
                    child: InputTextField(
                      passwordController,
                      'Password',
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              // Input Email or Telephone Number
              SizedBox(height: 10),

              // Login Continue button
              Container(
                width: 300,
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
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff70cb88),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Text: Don't have an account?
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => LoginPage(),
                              transition: Transition.fade);
                        },
                        child: Text(
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
              SizedBox(height: 5),

              // Text: Sign Up
            ]),
          ),
        ),
      ),
    );
  }
}
