import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final IconData MenuIcon;
  final String hintText;

  const ProfileMenu(this.MenuIcon, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
          top: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top:10, bottom:10),
      child: Row(
        children: [
          Icon(
            Icons.edit,
            color: Colors.black12,
            size: 40,
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
            child: Icon(
              MenuIcon,
              size: 17,
              color: Color(0xFF5F5F5F)
            ),
          )
        ],
      ),
    );
  }
}
 
 
 
 