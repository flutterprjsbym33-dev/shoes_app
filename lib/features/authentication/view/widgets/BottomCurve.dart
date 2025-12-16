import 'package:flutter/material.dart';

class Bottomcurve extends StatelessWidget {
  const Bottomcurve({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: TopSubtleWaveClipper(),
      child: Container(
        height: height*0.14,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF43A047),
              Colors.green.shade800,
            ])
        ),
      ),
    );

  }
}
class TopSubtleWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // start at bottom-left (STRAIGHT bottom)
    path.moveTo(0, size.height);
    path.lineTo(0, 35);

    // small DOWN curve
    path.quadraticBezierTo(
      size.width * 0.25,
      55,
      size.width * 0.5,
      35,
    );

    // big UP curve
    path.quadraticBezierTo(
      size.width * 0.75,
      10,
      size.width,
      35,
    );

    // finish right side
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}




