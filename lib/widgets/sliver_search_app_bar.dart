import 'package:veggytably_customer/widgets/background_wave.dart';
import 'package:veggytably_customer/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  const SliverSearchAppBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
    shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.6;
    double topPadding = MediaQuery.of(context).padding.top + 56;

    return Stack(
      children: [
        const BackgroundWave(
          height: 256,
        ),
        Positioned(
          top: topPadding + offset,
          child: const SearchBar(),
          left: 16,
          right: 16,
        ),
        
      ],
    );
  }

  @override
  double get maxExtent => 256;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}