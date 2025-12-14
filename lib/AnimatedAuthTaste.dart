import 'package:flutter/material.dart';
import 'package:shoe/widgets/AnimatedCard.dart';
import 'package:shoe/widgets/AnimatedTextWidget.dart';
import 'package:shoe/widgets/BottomCurve.dart';
import 'package:shoe/widgets/Topcurve.dart';

class Animatedauthtaste extends StatefulWidget {
  const Animatedauthtaste({super.key});

  @override
  State<Animatedauthtaste> createState() => _AnimatedauthtasteState();
}

class _AnimatedauthtasteState extends State<Animatedauthtaste> {

  bool showTitle = false;
  bool showSubtitle = false;
  bool showCard = false;

  @override
  void initState() {
    super.initState();

    // Text slides first
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() => showTitle = true);
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() => showSubtitle = true);
    });

    // Card scales after
    Future.delayed(const Duration(milliseconds: 1450), () {
      setState(() => showCard = true);
    });
  }

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
