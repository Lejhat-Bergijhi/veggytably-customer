import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/login_page.dart';
import 'package:veggytably_customer/views/restriction_page1.dart';
import 'package:veggytably_customer/widgets/bottom_navbar.dart';
import 'package:veggytably_customer/widgets/profile_menu.dart';
import 'package:veggytably_customer/views/edit_profile.dart';

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
                Text(
                  "NadiahhhHasna",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "+6234567891011",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff6482a6),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 61,
                ),

                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => EditProfile(),
                            transition: Transition.fade);
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
                        Get.offAll(() => EditRestrictionPage(),
                            transition: Transition.fade);
                      },
                      child: ProfileMenu("assets/images/foodres.png",
                          "Food Restriction", false),
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
        bottomNavigationBar: Container(
            height: 87.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.50),
                topRight: Radius.circular(25.50),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 230),
                    spreadRadius: 0,
                    blurRadius: 20),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.50),
                topRight: Radius.circular(25.50),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              child: CustomBottomNavigationBar(initialIndex: 3),
            )));
  }
}
