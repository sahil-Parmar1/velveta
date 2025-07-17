import 'package:flutter/material.dart';
import "package:shimmer/shimmer.dart";

Widget buildShimmer({required double height, required double width, BorderRadius? radius,Color? color}) {
  color=color??Colors.grey.shade300;
  return Shimmer.fromColors(
    baseColor: color,
    highlightColor: Colors.grey.shade100,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius ?? BorderRadius.circular(8),
      ),
    ),
  );
}