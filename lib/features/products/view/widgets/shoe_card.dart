import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoe/core/utils/shoe_model.dart';
import 'package:shoe/features/products/view/pages/detail_screen.dart';
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

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(shoe: shoe)));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.4,
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.only(top: 5,left: 4,bottom: 5),
          child: Card(
            elevation: 6,
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
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            height: 1,
                            shadows: [
                              Shadow(
                                blurRadius: 25,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ),
                        Text(shoe.brand.toUpperCase(),
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 25,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ],
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
                            decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.redAccent,
                              decorationThickness: 3,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            shadows: [
                              Shadow(
                                blurRadius: 25,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ],
                          ),),
                        SizedBox(width: 10,),
                        Text("${shoe.newPrice}\$",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 25,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ],
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.w800
                          ),),
                      ],
                    )),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Row(
                      children: [
                        Image.asset('assets/images/star.png',
                        height: 25,),
                        SizedBox(width: 4,),
                        Text("${shoe.rating}",
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 25,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ],
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),)


                      ],
                    )
                )


              ],
            ),
          ),
        ),


      ),
    );
  }
}
