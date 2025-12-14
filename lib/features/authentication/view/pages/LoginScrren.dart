import 'package:flutter/material.dart';

import '../../../../widgets/AnimatedCard.dart';
import '../../../../widgets/AnimatedTextWidget.dart';
import '../../../../widgets/BottomCurve.dart';
import '../../../../widgets/Topcurve.dart';

class Loginscrren extends StatefulWidget {
  const Loginscrren({super.key});

  @override
  State<Loginscrren> createState() => _LoginscrrenState();
}

class _LoginscrrenState extends State<Loginscrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Topcurve()),

          Positioned(
            top: 85,
            left: 25,
            child: Animatedtextwidget(),
          ),

          AnimatedCardwidget(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Bottomcurve()),
        ],

      ),
    );
  }
}
