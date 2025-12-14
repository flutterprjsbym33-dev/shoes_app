
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
          height: 350.h,
          width: 320.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,

              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  elevation: 4
                  ,
                  child: Padding(
                    padding: const EdgeInsets.all( 8.0),
                    child: Column(
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
                        Custombutton(hint: "Login")

                      ],
                    ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );

  }
}

