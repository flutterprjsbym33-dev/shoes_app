import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

  automaticallyImplyLeading: false,
      pinned: true,
      toolbarHeight: 28.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 12),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.end,

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Image.asset('assets/images/branding1.png',
                  height: 50.h,),

               Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 30.h,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 26.h,)),

                ],
               )

              ],
            ),
        ),
      ),
    );
  }
}
