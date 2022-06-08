import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../constants.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double heigh;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    Key? key,
    required this.width,
    required this.heigh,
    this.shapeBorder = const RoundedRectangleBorder(),
  }) : super(key: key);

  const ShimmerWidget.circular({
    Key? key,
    required this.width,
    required this.heigh,
    this.shapeBorder = const CircleBorder(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Constants.grey,
      baseColor: Constants.lightGrey,
      child: Container(
        width: width,
        height: heigh,
        decoration: ShapeDecoration(color: Constants.grey, shape: shapeBorder),
      ),
    );
  }
}
