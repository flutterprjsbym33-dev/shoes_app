import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/products/data/model/shoe_model.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

  automaticallyImplyLeading: false,
      pinned: true,
      toolbarHeight: 60.h,
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
                  IconButton(onPressed: ()async{
                    final data = await Supabase.instance.client.from('shoes').select() as List;
                    debugPrint(data.toString());
                    final shoes = data.map((e)=>ShoeModel.fromJson(e)).toList();
                    debugPrint(shoes.length.toString());


                  }, icon: Icon(Icons.notifications,size: 30.h,)),
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
