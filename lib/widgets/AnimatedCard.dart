
import 'package:flutter/material.dart';
import 'package:shoe/widgets/BottomCurve.dart';
import 'package:shoe/widgets/Topcurve.dart';


class AnimatedCardwidget extends StatefulWidget {
  const AnimatedCardwidget({super.key});

  @override
  State<AnimatedCardwidget> createState() => _AnimatedCardwidgetState();
}

class _AnimatedCardwidgetState extends State<AnimatedCardwidget> {


  bool showCard = false;

  @override
  void initState() {
    super.initState();

    // Card scales after
    Future.delayed(const Duration(milliseconds: 1400), () {
      setState(() => showCard = true);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: showCard ? 1 : 0,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutBack,
        child: Container(
          height: 400,
          width: 320,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.15),
              ),
            ],
          ),
          child: Card(
            elevation: 4
            ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  TextField(decoration: InputDecoration(labelText: "Email")),
                  SizedBox(height: 16),
                  TextField(decoration: InputDecoration(labelText: "Password")),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}

