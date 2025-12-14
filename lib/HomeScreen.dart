import 'package:flutter/material.dart';
import 'package:shoe/widgets/BottomCurve.dart';
import 'package:shoe/widgets/Topcurve.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children :[

            Align(
                alignment: Alignment.topCenter,
                child: Topcurve()),
              Positioned(
                top: 85,
                left: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),),
                    SizedBox(height: 2,),
                    Positioned(
                      top: 105,
                      left: 25,
                      child: Text("Explore and Enjoy amazing shoes deal with us",style: TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.w400,fontSize: 16),),
                    ),
                  ],
                ),
              ),

        
              Align(
                alignment: Alignment.bottomCenter,
                  child: Bottomcurve())
        
          ]
        ),
      ),

    );
  }
}
