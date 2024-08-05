import 'package:flutter/rendering.dart';

class CustomSliverGridDelegate extends SliverGridDelegate {
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final int crossAxisCount;
  final double itemHeight;

  CustomSliverGridDelegate({
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.crossAxisCount,
    required this.itemHeight,
  });

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    double usableCrossAxisExtent =
        constraints.crossAxisExtent - ((crossAxisCount - 1) * crossAxisSpacing);
    double itemWidth = usableCrossAxisExtent / crossAxisCount;

    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: itemHeight + mainAxisSpacing,
      crossAxisStride: itemWidth + crossAxisSpacing,
      childMainAxisExtent: itemHeight,
      childCrossAxisExtent: itemWidth,
      reverseCrossAxis: false,
    );
  }

  @override
  bool shouldRelayout(CustomSliverGridDelegate oldDelegate) {
    return oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.itemHeight != itemHeight;
  }
}
