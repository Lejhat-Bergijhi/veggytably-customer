import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;
  final void Function(int) setSelectedIndex;

  const CustomBottomNavigationBar({
    super.key,
    this.initialIndex = 0,
    required this.setSelectedIndex,
  });
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState(initialIndex);
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  _CustomBottomNavigationBarState(int initialIndex) {
    _selectedIndex = initialIndex;
  }
  final double size = 35;
  final List<String> _iconNames = ['home', 'promo', 'order', 'profile'];
  final List<Widget> _icons = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _iconNames.length; i++) {
      _icons.add(Image.asset(
        'assets/images/${_iconNames[i]}_inactive.png',
        width: size,
        height: size,
      ));
    }
    _icons[_selectedIndex] = Image.asset(
      'assets/images/${_iconNames[_selectedIndex]}_active.png',
      width: size,
      height: size,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _icons[_selectedIndex] = Image.asset(
        'assets/images/${_iconNames[_selectedIndex]}_inactive.png',
        width: size,
        height: size,
      );
      _selectedIndex = index;
      _icons[_selectedIndex] = Image.asset(
        'assets/images/${_iconNames[_selectedIndex]}_active.png',
        width: size,
        height: size,
      );
    });
    // navigate pages here
    widget.setSelectedIndex(index);
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
