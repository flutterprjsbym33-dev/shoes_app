
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombutton extends StatelessWidget {
  String hint;
  VoidCallback onTapLoginSignup;
   Custombutton({super.key,required this.hint,required this.onTapLoginSignup});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context,constraints) {
        return InkWell(
          onTap: onTapLoginSignup,
          child: Container(
            height:50.h,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color:  Color(0xFF369447),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text(hint,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),)) ,

          ),
        );
      }
    );
  }
}
