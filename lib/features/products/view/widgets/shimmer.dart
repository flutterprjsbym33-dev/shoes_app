import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter/material.dart';
class Shimmers extends StatelessWidget {
  const Shimmers({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Shimmer(
        duration: Duration(seconds: 3),
        interval: Duration(seconds: 5),
        color: Colors.white,
        colorOpacity: 0,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: Container(
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
