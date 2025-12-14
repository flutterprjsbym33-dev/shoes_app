import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/features/authentication/view/widgets/SocialIcon.dart';

class SocialIconHandler extends StatelessWidget {
  String socialIconPath1;
  String socialIconPath2;
  String hint;
  VoidCallback onSocialIconTap;
   SocialIconHandler({super.key,required this.hint,required this.onSocialIconTap,required this.socialIconPath1,required this.socialIconPath2});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(

      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hint,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          SizedBox(height: 6.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocailIcon(path: socialIconPath1,onSocailIconTap: onSocialIconTap,),
              SizedBox(width: 20.w,),
              SocailIcon(path: socialIconPath2,onSocailIconTap: onSocialIconTap,),
            ],
          )
        ],
      ),

    );
  }
}
