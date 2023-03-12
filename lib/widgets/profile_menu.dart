import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String MenuIcon;
  final String hintText;
  final bool first;

  const ProfileMenu(this.MenuIcon, this.hintText, this.first);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFA0A0A0),
            width: 1.0,
          ),
          top: BorderSide(
            color: first? Color(0xFFA0A0A0): Colors.transparent,
            width: first? 1.0:0,
          ),
        ),
      ),
      padding:
          const EdgeInsets.only(left: 24.0, right: 24.0, top: 10, bottom: 10),
      child: Row(
        children: [
          Image.asset(
            MenuIcon,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 17.0),
          Container(
            child: Text(
              hintText,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Container(
            child: Icon(Icons.arrow_forward_ios,
                size: 17, color: Color(0xFF5E5E5E)),
          )
        ],
      ),
    );
  }
}
