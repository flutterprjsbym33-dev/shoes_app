import 'package:flutter/material.dart';
import 'package:shoe/core/utils/appColor.dart';
import 'package:shoe/features/products/view/pages/see_all_products.dart';

class ProductText extends StatelessWidget {
  const ProductText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: EdgeInsets.only(top: 12,bottom: 5,left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Newly Arrived",style: TextStyle(
                fontSize: 18,fontWeight:FontWeight.w700 ),),
            TextButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>SeeAllProducts()));
              },
              child: Text("See All",style: TextStyle(
                  fontSize: 16,fontWeight:FontWeight.w700,color: AppColors.pink ),),
            ),
          ],
        ),
      ),
    );
  }
}
