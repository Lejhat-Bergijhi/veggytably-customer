import 'package:veggytably_customer/widgets/background_wave.dart';
import 'package:flutter/material.dart';

import 'search_bar2.dart';

class RegularSearchAppBar extends StatelessWidget {
  final double topPadding;
  const RegularSearchAppBar(
    this.topPadding, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundWave(
          height: 135,
        ),
        Positioned(
          top: topPadding + 46,
          left: 16,
          right: 16,
          child: SearchBar2(),
        ),
      ],
    );
  }
}
