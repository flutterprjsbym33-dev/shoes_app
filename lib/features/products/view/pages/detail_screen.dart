import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoe/features/products/view/widgets/detail_screen_detail_widget.dart';
import 'package:shoe/features/products/view/widgets/overlay.dart';
import 'package:shoe/features/products/view/widgets/shimmer.dart';

import '../../domain/product_entity/shoe.dart';

class DetailScreen extends StatefulWidget {
  Shoe shoe;
  DetailScreen({required this.shoe});
  @override
  State<StatefulWidget> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {

 late final Shoe shoe;
  bool startAnimation = false;

   @override
  void initState() {
    super.initState();
    shoe = widget.shoe;
    Future.delayed(Duration(milliseconds: 400),(){
      setState(() {
        startAnimation = true;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background Image

          Positioned.fill(child: shoe.images.isEmpty ? Shimmers():
          CachedNetworkImage(imageUrl: shoe.images[1],
          placeholder: (_,_)=>Shimmers(),
          fit: BoxFit.cover,),),
          ImageOverlay(),


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
          
          //product info
          
          Positioned(
            bottom: 30,
            left: 10,
            right: 10,
            child: AnimatedSlide(
              offset:  startAnimation ? Offset.zero : Offset(0, 1),
              duration: Duration(milliseconds: 700),
              child: AnimatedOpacity(
                opacity: startAnimation ? 1 : 0 ,
                duration: Duration(milliseconds: 600),
                child: ProductInfo(shoe: shoe) ),
              ),
            ),





        ],
      ),
    );
  }
}

