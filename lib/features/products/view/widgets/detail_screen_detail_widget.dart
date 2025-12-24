import 'package:flutter/material.dart';

import '../../domain/product_entity/shoe.dart';

class ProductInfo extends StatelessWidget {
  Shoe shoe;
   ProductInfo({super.key,required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(shoe.title,
        style: TextStyle(
          fontSize: 55,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 25,
              color: Colors.black.withOpacity(0.6)
            )
          ]
        ),)
        
      ],
    );
  }
}
