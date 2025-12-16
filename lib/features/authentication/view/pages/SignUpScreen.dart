import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/AuthType.dart';
import '../widgets/AnimatedCard.dart';
import '../widgets/AnimatedTextWidget.dart';
import '../widgets/BottomCurve.dart';
import '../widgets/Topcurve.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Topcurve()),

          Positioned(
            top:height*0.12,
            left: width*0.03,
            child: Animatedtextwidget(title: 'Create Account',
              subTitle:  "Explore and Enjoy amazing shoes deal with us",),
          ),

          Positioned(
              top:height*0.25,
              left: width*0.025,
              right: width*0.025,
              child: AnimatedCardwidget(hint: 'SignUp',authType: AuthType.SignUp,)),
          SizedBox(height: 10.h,),



          Align(
              alignment: Alignment.bottomCenter,
              child: Bottomcurve()),
        ],

      ),
    );
  }
}
