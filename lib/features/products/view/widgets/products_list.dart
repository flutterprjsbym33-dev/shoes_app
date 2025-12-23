import 'package:flutter/material.dart';
import 'package:shoe/features/products/domain/product_entity/shoe.dart';
import 'package:shoe/features/products/view/widgets/overlay.dart';
import 'package:shoe/features/products/view/widgets/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoe/features/products/view/widgets/shoe_card.dart';



class ProductsList extends StatelessWidget {

  List<Shoe> shoes;
  int length;
   ProductsList({super.key,
  required this.shoes ,required this.length
   });

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
          (context,index){
        final shoe = shoes[index];
        return TweenAnimationBuilder(
            tween: Tween(begin: 0,end: 1),
            duration: Duration(milliseconds: 400+(index*30)),
            builder: (context,value,child)=>
                Transform.translate(
                  offset: Offset(0, 30.0 * (1 - value)),
                  child: Opacity(opacity: value.toDouble(),
                  child: child,),
                ),
          child: ShoeCard(shoe: shoe),
        );


      },
      childCount: length,
    ));
  }
}
