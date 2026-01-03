import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe/features/cart/presentation/cart_bloc/cart_cubit/check_out_cubit.dart';
import '../../domain/cart_entity/cart_entity.dart';
import '../cart_bloc/cart_cubit/check_out_cubit.dart';
import '';
class ShowTotal extends StatelessWidget {
  List<Cart> items;
   ShowTotal({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
     final totlaPrice = context.read<CheckOutCubit>().state.totalPrice;
     final isSelected = context.watch<CheckOutCubit>().state.selectedAll;

     print("${totlaPrice}");
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.1,
      decoration: BoxDecoration(
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Select ALl Icon
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                  onPressed: (){

                  context.read<CheckOutCubit>().selectedAll(items);

                  }, 
                  icon: Icon( isSelected?
                    Icons.check_box: Icons.check_box_outline_blank_rounded ,
                    size: 30,
                  )),
              Text('All')
            ],
          ),
          //Showing total Icon
          Row(
            children: 
            [
              Row(
                children: [
                  Column(
                    children: [
                      RichText(
                          text: TextSpan(
                           children: [
                             //SubTotal Text
                             TextSpan(
                               text: 'SubTotal:',
                               style: GoogleFonts.ibmPlexMono
                                 (
                                 textStyle: TextStyle(
                                   fontSize: 16,
                                   color: Colors.black
                                 )
                               )

                             ),
                             WidgetSpan(child: SizedBox(width:4 ,)),
                             //Rs Text
                             TextSpan(
                                 text: 'Rs:',
                                 style: GoogleFonts.ibmPlexSans
                                   (
                                     textStyle: TextStyle(
                                         fontSize:22 ,
                                         color: Colors.deepOrange
                                     )
                                 )

                             ),
                             TextSpan(
                                 text: '\$${totlaPrice}',
                                 style: GoogleFonts.ibmPlexMono
                                   (
                                     textStyle: TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.w600,
                                         color: Colors.deepOrange
                                     )
                                 )

                             )
                           ]
                          ),

                      ),
                      //Shipping charge text
                      RichText(
                          text: TextSpan(
                            children:[
                              TextSpan(
                                text: "Shipping Charge",
                                style: TextStyle(
                                  color: Colors.grey.shade700
                                )
                              ),
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Rs:",
                                      style: TextStyle(
                                          color: Colors.grey.shade700
                                      )
                                  ),
                                  WidgetSpan(child: SizedBox(width:2 ,)),
                                  TextSpan(
                                    text: "\$25",
                                    style:GoogleFonts.ibmPlexSans(
                                      textStyle: TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w500
                                      )
                                    )
                                  )
                                ]
                              )

                            ]
                          )
                      )
                    ],
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                      onPressed: (){},
                      child: Text("CheckOut",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                      ),))
                ],
              )
              
            ],
          )

        ],
      ),
    );
  }
}
