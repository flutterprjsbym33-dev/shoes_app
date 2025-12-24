import 'package:flutter/material.dart';

import '../../domain/product_entity/shoe.dart';

class DetailScreen extends StatelessWidget {
  Shoe shoe;
   DetailScreen({super.key,required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background Image
          Positioned.fill(child:
          Image.network(shoe.images[1],
          fit: BoxFit.cover,)),


          //BackButton
          Positioned(
            top: 35,
              left:15,
              child: Icon(Icons.arrow_back_ios_new_sharp,
              color: Colors.white,size: 30,)),

          //FavouriteButton

          Positioned(
              top: 35,
              right:18,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite_border,
                  color: Colors.black,size: 28,),
              )),




        ],
      ),
    );
  }
}

