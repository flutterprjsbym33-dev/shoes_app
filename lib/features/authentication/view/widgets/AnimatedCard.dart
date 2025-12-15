
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/core/utils/AuthType.dart';
import 'package:shoe/features/authentication/view/pages/LoginScrren.dart';
import 'package:shoe/features/authentication/view/pages/SignUpScreen.dart';
import 'package:shoe/features/authentication/view/widgets/CustomButton.dart';
import 'package:shoe/features/authentication/view/widgets/SocialIcon.dart';
import 'package:shoe/features/authentication/view/widgets/customTextBox.dart';

import 'SocialIconhandler.dart';


class AnimatedCardwidget extends StatefulWidget {
  String hint;
AuthType authType;

   AnimatedCardwidget({super.key,required this.hint,required this.authType,});

  @override
  State<AnimatedCardwidget> createState() => _AnimatedCardwidgetState();
}

class _AnimatedCardwidgetState extends State<AnimatedCardwidget> {

  bool showCard = false;
  late final hint ;
  late final authType;

  @override
  void initState() {
    super.initState();
  authType = widget.authType;
    hint = widget.hint;
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => showCard = true);
    });
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: AnimatedScale(
        scale: showCard ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutBack,
        child: Container(
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

                         SingleChildScrollView(
                           child: Column(
                            children:  [
                           
                              Center(child: Text(hint,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),)),
                              SizedBox(height: 15.h,),
                             authType == AuthType.SignUp ? CustomTextBox(hint: "FullName", callback: (){}, iconData: Icons.account_circle) : SizedBox(),
                              SizedBox(height: 15.h,),
                              CustomTextBox(hint: "Email", callback: (){}, iconData: Icons.email),
                              SizedBox(height: 15.h),
                              CustomTextBox(hint: "Password", callback: (){}, iconData: Icons.password),
                              authType == AuthType.Login ?
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(onPressed: (){}, child: Text("Forgot Password?")),
                              ) : SizedBox(),
                              SizedBox(height: 10.h),
                               authType == AuthType.Login ? Custombutton(hint: "Login",onTapLoginSignup: (){},) : Custombutton(hint: "SignUp",onTapLoginSignup: (){},),
                               SizedBox(height: 21.h),
                              Row(
                                children: [
                                  Expanded(child: Divider(color: Colors.black38,)),
                                  SizedBox(width: 4.w,),
                                  authType == AuthType.Login ?
                                  Text('Or Login with',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),) :
                                  Text('Or SignUp with',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                                  SizedBox(width: 4.w,),
                                  Expanded(child: Divider(color: Colors.black38,)),
                           
                                ],
                              ),
                              SizedBox(height: 16.h,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SocailIcon(path: 'assets/images/gg.png', onSocailIconTap: (){}),
                                  SizedBox(width: 45.w,),
                                  SocailIcon(path: 'assets/images/facebook.png', onSocailIconTap: (){}),
                           
                                ],
                              ),
                              SizedBox(height: 16.h,),
                             authType == AuthType.Login ? TextButton(onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                             }, child: Text("Didn't Have an Account?")):
                             TextButton(onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscrren()));
                             }, child: Text("Already Have an Account?"))
                            ],
                                                   ),
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

