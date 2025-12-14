
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/features/authentication/view/widgets/CustomButton.dart';
import 'package:shoe/features/authentication/view/widgets/customTextBox.dart';

import 'SocialIconhandler.dart';


class AnimatedCardwidget extends StatefulWidget {
  String hint;


   AnimatedCardwidget({super.key,required this.hint,});

  @override
  State<AnimatedCardwidget> createState() => _AnimatedCardwidgetState();
}

class _AnimatedCardwidgetState extends State<AnimatedCardwidget> {

  bool showCard = false;
  late final hint ;

  @override
  void initState() {
    super.initState();

    hint = widget.hint;
    Future.delayed(const Duration(milliseconds: 1400), () {
      setState(() => showCard = true);
    });
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: AnimatedScale(
        scale: showCard ? 1 : 0,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutBack,
        child: Container(
          height: 480.h,
          width: 340.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
              ),
            ],
          ),
          child:  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                         Column(
                          children:  [

                            Center(child: Text(hint,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),)),
                            SizedBox(height: 15.h,),
                            CustomTextBox(hint: "Email", callback: (){}, iconData: Icons.email),
                            SizedBox(height: 15.h),
                            CustomTextBox(hint: "Password", callback: (){}, iconData: Icons.password),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(onPressed: (){}, child: Text("Forgot Password?")),
                            ),
                            SizedBox(height: 10.h),
                            Custombutton(hint: "Login"),
                            SizedBox(height: 20.h),
                            SocialIconHandler(
                              hint: "Or login with",
                              socialIconPath1: "assets/images/gg.png",
                              socialIconPath2: "assets/images/facebook.png",
                              onSocialIconTap: () {},
                            ),
                            SizedBox(height: 12.h,),
                            TextButton(onPressed: (){}, child: Text("Didn't Have an Account?"))

                          ],
                        ),






                  ],
                ),
              ),
            ),
          ),
        ),
      );


  }
}

