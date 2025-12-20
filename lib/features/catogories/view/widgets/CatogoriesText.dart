import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:  EdgeInsets.only(top: 12.h,bottom: 2.h),
        child: Text("Categories",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700
        ),),
      ),
      
    );
        
  }
}
