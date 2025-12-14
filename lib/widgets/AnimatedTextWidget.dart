
import 'package:flutter/material.dart';
import 'package:shoe/widgets/BottomCurve.dart';
import 'package:shoe/widgets/Topcurve.dart';


class Animatedtextwidget extends StatefulWidget {
  const Animatedtextwidget({super.key});

  @override
  State<Animatedtextwidget> createState() => _AnimatedtextwidgetState();
}

class _AnimatedtextwidgetState extends State<Animatedtextwidget> {

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

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() => showSubtitle = true);
    });

    // Card scales after
    Future.delayed(const Duration(milliseconds: 1400), () {
      setState(() => showCard = true);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSlide(
          offset: showTitle ? Offset.zero : const Offset(-1, 0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInBack,
          child: AnimatedOpacity(
            opacity: showTitle ? 1 : 0,
            duration: const Duration(seconds: 1),
            child:
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),



            ),
          ),



        AnimatedSlide(
          offset: showSubtitle ? Offset.zero:Offset(-1, 0),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: showSubtitle ? 1 : 0,
            duration: Duration(seconds: 1),
            child: Text(
              "Explore and Enjoy amazing shoes deal with us",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 16,
              ),
            ),),

        )
      ],
    );

  }
}
