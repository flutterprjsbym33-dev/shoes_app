import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe/features/products/view/shoe_cubit/size_cubit.dart';

import '../../domain/product_entity/shoe.dart';

class ProductInfo extends StatelessWidget {
  Shoe shoe;
   ProductInfo({super.key,required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(shoe.title,
        style: GoogleFonts.ibmPlexSans(
            textStyle: TextStyle(
              fontStyle: FontStyle.italic,
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                      blurRadius: 25,
                      color: Colors.black.withOpacity(0.6)
                  )
                ]
            )
        ),),
        SizedBox(height: 4,),
        Text(shoe.description,
          style: GoogleFonts.ibmPlexSans(
              textStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.8),
                  shadows: [
                    Shadow(
                        blurRadius: 25,
                        color: Colors.black.withOpacity(0.6)
                    )
                  ]
              )
          ),),

        SizedBox(height: 10,),
        Text("Sizes",style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                  blurRadius: 25,
                  color: Colors.black.withOpacity(0.6)
              )
            ]
        ),),
        SizedBox(height: 4,),

        //Sizes list

        Container(
          height:60,
          child: Center(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  final isSelected = context.watch<SizeManager>().state;
                  return  GestureDetector(
                    onTap: () {
                      context.read<SizeManager>().addSize(index);
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: isSelected == index ? 60 : 40,
                        width: isSelected == index ? 70 : 50,
                        alignment: Alignment.center,
                        child: index == isSelected
                            ? Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              "${shoe.sizes[index]}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                            : Text(
                          "${shoe.sizes[index]}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                  ;

                },
                separatorBuilder: (_,_)=>SizedBox(width: 10,),
                itemCount: shoe.sizes.length),
          ),
        ),

        //BuyNow Button
        SizedBox(height: 8,),
        SizedBox(
          height: 45,width: double.infinity,
          child: OutlinedButton(onPressed: (){},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                backgroundColor: Colors.white.withOpacity(0.7)
              ),
              child: Text("Add to cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black
              ),)),
        )

      ],
    );
  }
}
