import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Dietary\nPreference',
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
              padding: EdgeInsets.only(left: 36),
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
                width: 300,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
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
                  dropdownColor: Color.fromARGB(255, 171, 174, 171),
                ),
              ),
              SizedBox(height: 16),

            Padding(
              padding: EdgeInsets.only(left: 36),
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
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CheckboxListTile(
                title: Text('Dairy-Free (no milk products)'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: _isChecked,
                onChanged: (bool? value) {
                  /*setState(() {
                    _isChecked = value!;
                  });*/
                },
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CheckboxListTile(
                title: Text('Meat-Free'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: _isChecked,
                onChanged: (bool? value) {
                  /*setState(() {
                    _isChecked = value!;
                  });*/
                },
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CheckboxListTile(
                title: Text('Fish-Free'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: _isChecked,
                onChanged: (bool? value) {
                  /*setState(() {
                    _isChecked = value!;
                  });*/
                },
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CheckboxListTile(
                title: Text('Glutten-Free'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: _isChecked,
                onChanged: (bool? value) {
                  /*setState(() {
                    _isChecked = value!;
                  });*/
                },
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CheckboxListTile(
                title: Text('Egg-Free'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: _isChecked,
                onChanged: (bool? value) {
                  /*setState(() {
                    _isChecked = value!;
                  });*/
                },
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 171, 174, 171).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CheckboxListTile(
                title: Text('Nut-Free'),
                controlAffinity: ListTileControlAffinity.trailing,
                value: _isChecked,
                onChanged: (bool? value) {
                  /*setState(() {
                    _isChecked = value!;
                  });*/
                },
              ),
            ),
            SizedBox(height: 10),

            // Login button
            Container(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  
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
