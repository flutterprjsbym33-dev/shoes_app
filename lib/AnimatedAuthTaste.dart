import 'package:flutter/material.dart';
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
    Future.delayed(const Duration(milliseconds: 1200), () {
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
            child: AnimatedSlide(
              offset: showTitle ? Offset.zero : const Offset(-1, 0),
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: showTitle ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                    const SizedBox(height: 6),

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
                ),
              ),
            ),
          ),

          Center(
            child: AnimatedScale(
              scale: showCard ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOutBack,
              child: Container(
                height: 400,
                width: 320,
                padding: const EdgeInsets.all(20),
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




          Align(
              alignment: Alignment.bottomCenter,
              child: Bottomcurve()),
        ],

      ),
    );
  }
}
