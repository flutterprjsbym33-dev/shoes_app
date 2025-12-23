import 'package:flutter/material.dart';
import 'package:shoe/features/products/domain/product_entity/shoe.dart';
import 'package:shoe/features/products/view/widgets/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';



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
        final imageUrl = (shoe.images != null && shoe.images.isNotEmpty)
            ? shoe.images[0]
            : 'https://via.placeholder.com/150'; // placeholder image

        return SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          width: double.infinity,
          child: Padding(
            padding:  EdgeInsets.only(top: 5,left: 4,bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                placeholder: (_,_)=>Shimmers(),
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

      },
      childCount: length,
    ));
  }
}
