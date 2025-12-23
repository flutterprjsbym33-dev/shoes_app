import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoe/features/products/view/widgets/shimmer.dart';
import '../../domain/product_entity/shoe.dart';
import 'overlay.dart';

class ShoeCard extends StatelessWidget {
  Shoe shoe;
   ShoeCard({super.key,
  required this.shoe});

  @override
  Widget build(BuildContext context) {
    final imageUrl = (shoe.images != null && shoe.images.isNotEmpty)
        ? shoe.images[0]
        : 'https://via.placeholder.com/150'; // placeholder image

    return SizedBox(
      height: MediaQuery.of(context).size.height*0.4,
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.only(top: 5,left: 4,bottom: 8),
        child: Card(
          elevation: 4,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none
          ),
          child:  Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    placeholder: (_,_)=>Shimmers(),
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ImageOverlay(),
              Positioned(
                  top: 0,
                  left: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ),
                      Text(shoe.brand.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),),

                    ],
                  )),

              Positioned(
                  bottom: 5,
                  left: 8,
                  child: Row(
                    children: [
                      Text("${shoe.oldPrice}\$",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800
                        ),),
                      SizedBox(width: 10,),
                      Text("${shoe.newPrice}\$",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w800
                        ),),
                    ],
                  )),
              Positioned(
                  bottom: 0,
                  right: 10,
                  child: Row(
                    children: [

                    ],
                  )
              )


            ],
          ),
        ),
      ),


    );
  }
}
