import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/core/utils/AuthType.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Topcurve()),

          Positioned(
            top: height*0.12,
            left: width*0.03,
            child: Animatedtextwidget(title: 'Welcome Back',
              subTitle:  "Explore and Enjoy amazing shoes deal with us",),
          ),

          Positioned(
            top:height*0.26,
              left: width*0.025,
              right: width*0.025,
              child: AnimatedCardwidget(hint: 'Login',authType: AuthType.Login,)),
          SizedBox(height: 10.h,),



          Align(
              alignment: Alignment.bottomCenter,
              child: Bottomcurve()),
        ],

      ),
    );
  }
}
