import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchBar2 extends StatelessWidget {
  final SearchController searchController = Get.find();
  final pink = const Color(0xFFFACCCC);
  final grey = const Color(0xFFF2F2F7);

  SearchBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      height: 34,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: pink,
          focusedBorder: _border(pink),
          border: _border(grey),
          enabledBorder: _border(grey),
          hintText: 'Salad',
          hintStyle: const TextStyle(
            color: Color(0xff9f9f9f),
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        onChanged: (value) {
          if (value.length < 2) {
            return;
          } else {
            searchController.setSearch(value);
            searchController.searchAll(value);
          }
        },
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
