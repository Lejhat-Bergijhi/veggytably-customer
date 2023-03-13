import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/profile_page.dart';
import 'package:veggytably_customer/widgets/bottom_navbar.dart';
import 'package:veggytably_customer/widgets/profile_menu.dart';
import 'package:veggytably_customer/widgets/upload_pic.dart';
import 'package:veggytably_customer/widgets/input_text.dart';


class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {

              Get.offAll(() => ProfilePage(), transition: Transition.fade);
            },
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, top: 10),
            child:Icon(Icons.arrow_back, color: Colors.black),
              
            
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
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
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        padding: EdgeInsets.only(top: 11, left: 40, right: 40),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
          
            Container(
              // height: 150,
              child: UploadPic(),
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "NAME",
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 10,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                Container(
                  // width: 300,
                  child: InputTextField(
                    emailController,
                    'Name',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                    "EMAIL",
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 10,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                Container(
                  // width: 300,
                  child: InputTextField(
                    passwordController,
                    'Email',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                    "TELEPHONE NUMBER",
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 10,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),                
                Container(
                  // width: 300,
                  child: InputTextField(
                    emailController,
                    'Telephone Number',
                  ),
                ),
                SizedBox(height: 10),
                
              ],
            ),
            // Input Email or Telephone Number
            SizedBox(height: 10),

            // Login button
            Container(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => ProfilePage(), transition: Transition.fade);
                  // emailController.clear();
                  // passwordController.clear();
                },
                child: Text(
                  'Save',
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
         ],
        ),
      ),
      bottomNavigationBar: Container(   
            height: 87.7,                                          
            decoration: BoxDecoration(          
                                                   
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
        
                boxShadow: [                                                               
                BoxShadow(color: Color.fromRGBO(0,0,0,230), spreadRadius: 0, blurRadius: 20),       
                ],

            ),               

            child: ClipRRect( 
                
                                                                         
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                                                                   
                child: CustomBottomNavigationBar(initialIndex: 3),
            )
      )
    );
  }
}
