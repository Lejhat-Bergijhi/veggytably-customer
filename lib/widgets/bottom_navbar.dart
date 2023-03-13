import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/views/discount_page.dart';
import 'package:veggytably_customer/views/home_page_user.dart';
import 'package:veggytably_customer/views/order_page.dart';
import 'package:veggytably_customer/views/profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  final int initialIndex;
  CustomBottomNavigationBar({this.initialIndex = 0});
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState(initialIndex);
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  _CustomBottomNavigationBarState(int initialIndex) {
    _selectedIndex = initialIndex;
  }
  double Size = 35;
  List<String> _iconNames = ['home', 'promo', 'order', 'profile'];
  List<Widget> _icons = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _iconNames.length; i++) {
      _icons.add(Image.asset(
        'assets/images/${_iconNames[i]}_inactive.png',
        width: Size,
        height: Size,
      ));
    }
    _icons[_selectedIndex] = Image.asset(
      'assets/images/${_iconNames[_selectedIndex]}_active.png',
      width: Size,
      height: Size,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _icons[_selectedIndex] = Image.asset(
        'assets/images/${_iconNames[_selectedIndex]}_inactive.png',
        width: Size,
        height: Size,
      );
      _selectedIndex = index;
      _icons[_selectedIndex] = Image.asset(
        'assets/images/${_iconNames[_selectedIndex]}_active.png',
        width: Size,
        height: Size,
      );
    });
    if (index == 0) {
      Get.offAll(() => HomePage(), transition: Transition.fade);
    } else if (index == 1) {
      Get.offAll(() => DiscountPage(), transition: Transition.fade);
    } else if (index == 2) {
      Get.offAll(() => OrderPage(), transition: Transition.fade);
    } else if (index == 3) {
      Get.offAll(() => ProfilePage(), transition: Transition.fade);
    }
    //change page
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: List.generate(
        _icons.length,
        (index) => BottomNavigationBarItem(
          icon: _icons[index],
          label: '',
        ),
      ),
    );
  }
}
