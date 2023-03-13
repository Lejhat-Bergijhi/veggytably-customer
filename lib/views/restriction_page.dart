import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/home_page_user.dart';
import 'package:veggytably_customer/views/profile_page.dart';

import '/widgets/input_text.dart';

class RestrictionPage extends StatelessWidget {
  const RestrictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    String? _selectedOption = 'Lacto-ovo vegetarian';
    final ValueNotifier<bool> _isCheckedNotifier = ValueNotifier<bool>(false);
    bool _isChecked = false;

    return Scaffold(
      // appBar: AppBar(
        
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: GestureDetector(
      //     onTap: () {

      //         Get.offAll(() => ProfilePage(), transition: Transition.fade);
      //       },
      //     child: Container(
      //       padding: const EdgeInsets.only(left: 12.0, top: 10),
      //       child:Icon(Icons.arrow_back, color: Colors.black),
              
            
      //     ),
      //   ),
        // title: Container(
        //   padding: const EdgeInsets.only(top: 10),
        //   child: Text(
        //     "Edit Profile",
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 18,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      //   toolbarHeight: 50,
      //   leadingWidth: 30,
      
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView(children: [
            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),

              child: Text(
                  "Your Dietary Preference",
                  style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 32,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w700,
                  ),
              ),

            ),
            SizedBox(height: 5),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tell us about your food type and requirements',
                  style: TextStyle(
                    color: Color.fromARGB(162, 0, 0, 0),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Text:
            SizedBox(height: 16),

            Padding(
               padding: EdgeInsets.symmetric(horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'STEP 1: PICK YOUR DIET TYPE',
                  style: TextStyle(
                    color: Color.fromARGB(131, 88, 83, 83),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            // Text:
            SizedBox(height: 10),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 16),

                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  
                  value: _selectedOption,
                  isExpanded: true,
                  underline: Container(),
                  items: [
                    'Lacto-vegetarian',
                    'Ovo-vegetarian',
                    'Pollo-vegetarian',
                    'Lacto-ovo vegetarian',
                    'Pesco-vegetarian'
                  ].map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _selectedOption = newValue;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  dropdownColor: Color.fromARGB(255, 254, 254, 254),
                ),
              ),
              SizedBox(height: 16),

            Padding(
               padding: EdgeInsets.symmetric(horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'STEP 2: CUSTOMIZE AND CONFIRM YOUR FOOD TYPE',
                  style: TextStyle(
                    color: Color.fromARGB(131, 88, 83, 83),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            // Text:
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ListView(
                  shrinkWrap: true,
                  children: [
                    checkbox('Dairy-Free (no milk products)', isChecked: _isChecked),
                    SizedBox(height: 10),
                    checkbox('Meat-Free', isChecked: _isChecked),
                    SizedBox(height: 10),
                    checkbox('Fish-Free', isChecked: _isChecked),
                    SizedBox(height: 10),
                    checkbox('Glutten-Free', isChecked: _isChecked),
                    SizedBox(height: 10),
                    checkbox('Egg-Free', isChecked: _isChecked),
                    SizedBox(height: 10),
                    checkbox('Nut-Free', isChecked: _isChecked),
                  ],
              ),
            ),
            
            SizedBox(height: 20),
            // Login button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => HomePage(), transition: Transition.fade);

                  // emailController.clear();
                  // passwordController.clear();
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

          ]),
        ),
      ),
    );
  }
}

class checkbox extends StatelessWidget {
  final String content;
  const checkbox(this.content,{
    super.key,
    required bool isChecked,
    
  }) : _isChecked = isChecked;

  final bool _isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CheckboxListTile(
        title: Text(content),
        controlAffinity: ListTileControlAffinity.trailing,
        value: _isChecked,
        onChanged: (bool? value) {
          /*setState(() {
            _isChecked = value!;
          });*/
        },
      ),
    );
  }
}
