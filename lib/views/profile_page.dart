import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/login_page.dart';
import 'package:veggytably_customer/views/restriction_page1.dart';
import 'package:veggytably_customer/widgets/profile_menu.dart';
import 'package:veggytably_customer/views/edit_profile.dart';

import '../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 67,
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/Profpic.png'),
              ),
              SizedBox(
                height: 14,
              ),
              Obx(() => Text(
                    AuthController.to.user.username,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 22,
                    ),
                  )),
              SizedBox(
                height: 7,
              ),
              Obx(() => Text(
                    "+62 ${AuthController.to.user.phone}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff6482a6),
                      fontSize: 12,
                    ),
                  )),
              SizedBox(
                height: 61,
              ),

              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const EditProfile(),
                          transition: Transition.rightToLeft);
                    },
                    child: ProfileMenu(
                      "assets/images/editprofile.png",
                      "Edit Profile",
                      true,
                    ),
                  ),
                  ProfileMenu(
                      "assets/images/notif.png", "Notifications", false),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => EditRestrictionPage(),
                          transition: Transition.rightToLeft);
                    },
                    child: ProfileMenu(
                        "assets/images/foodres.png", "Food Restriction", false),
                  )
                  // Add more list tiles here
                ],
              ),
              // SizedBox(height: 70),
              Container(
                  padding: const EdgeInsets.only(top: 70),
                  child: GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text("Log Out"),
                          content:
                              const Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(() => LoginPage(),
                                    transition: Transition.fade);
                                // AuthController.to.logout();
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      );
                      // AuthController.to.logout();
                    },
                    child: const Text(
                      "Log Out",
                      style: TextStyle(
                        color: Color(0xFFD13D34),
                        fontSize: 15,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
