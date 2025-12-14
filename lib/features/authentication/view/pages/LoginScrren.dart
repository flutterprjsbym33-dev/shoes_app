import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/features/authentication/view/widgets/SocialIconhandler.dart';

import '../widgets/AnimatedCard.dart';
import '../widgets/AnimatedTextWidget.dart';
import '../widgets/BottomCurve.dart';
import '../widgets/Topcurve.dart';

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
            top: 100,
            left: 25,
            child: Animatedtextwidget(title: 'Welcome Back',
              subTitle:  "Explore and Enjoy amazing shoes deal with us",),
          ),

          Positioned(
            top: 230.h,
              left: 25.w,
              right: 25.w,
              child: AnimatedCardwidget(hint: 'Login',)),
          SizedBox(height: 10.h,),



          Align(
              alignment: Alignment.bottomCenter,
              child: Bottomcurve()),
        ],

      ),
    );
  }
}
