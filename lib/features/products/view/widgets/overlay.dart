import 'package:flutter/material.dart';
class ImageOverlay extends StatelessWidget {
  const ImageOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:  Alignment.bottomLeft,

            colors: [
              Colors.black.withOpacity(0.65),
              Colors.black.withOpacity(0.105),
            ],
          ),
        ),
      ),
    );
  }
}
