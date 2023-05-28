import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/restriction_controller.dart';
import '../widgets/custom_checkbox.dart';

class EditRestrictionPage extends StatelessWidget {
  const EditRestrictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    RestrictionController restrictionController =
        Get.put(RestrictionController());

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
        toolbarHeight: 50,
        leadingWidth: 30,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView(children: [
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "Edit Your Dietary Preference",
                style: TextStyle(
                  color: Color(0xff242424),
                  fontSize: 22,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 5),

            const Padding(
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
            const SizedBox(height: 16),

            const Padding(
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
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => DropdownButton<String>(
                  value: restrictionController.selectedOption,
                  isExpanded: true,
                  underline: Container(),
                  items: restrictionController.options.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue == null) return;
                    restrictionController.selectedOption = newValue;
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  dropdownColor: const Color.fromARGB(255, 254, 254, 254),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Padding(
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
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCheckbox('Dairy-Free (no milk products)'),
                  const SizedBox(height: 10),
                  CustomCheckbox('Meat-Free'),
                  const SizedBox(height: 10),
                  CustomCheckbox('Fish-Free'),
                  const SizedBox(height: 10),
                  CustomCheckbox('Glutten-Free'),
                  const SizedBox(height: 10),
                  CustomCheckbox('Egg-Free'),
                  const SizedBox(height: 10),
                  CustomCheckbox('Nut-Free'),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Login button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Get.offAll(() => const ProfilePage(),
                  //     transition: Transition.fade);
                  Get.back();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff70cb88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ]),
        ),
      ),
    );
  }
}
