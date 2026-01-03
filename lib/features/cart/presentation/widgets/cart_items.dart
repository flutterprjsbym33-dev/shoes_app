
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shoe/features/products/view/widgets/shimmer.dart';
import '../../domain/cart_entity/cart_entity.dart';
import '../cart_bloc/cart_cubit/check_out_cubit.dart';

class ListOfCartItems extends StatelessWidget {
  List<Cart> items;
   ListOfCartItems({required this.items});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  ListView.separated(
      separatorBuilder: (_,_)=>SizedBox(height: 15,),
      itemCount: items.length,
      itemBuilder: (context,index)
      {
        final rawDate = items[index].time;
        final fomrattedDate = DateFormat('yyyy-MM-dd').format(rawDate);
        final selctedIndex = context.watch<CheckOutCubit>().state.slectedIndex.contains(index);
        return Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text("$fomrattedDate"),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  //CheckBoxIcon
                  SizedBox(
                    child: IconButton(
                        onPressed: (){

                          context.read<CheckOutCubit>().itemSelected(
                              index: index,
                              items: items);

                        },
                        icon:
                        Icon( selctedIndex  ?
                        Icons.check_box : Icons.check_box_outline_blank_rounded,color: Colors.grey,)),
                  ),
                  //Cart Image
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      height: height*0.14,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(imageUrl:  items[index].shoe.images[0],
                        fit: BoxFit.cover,
                        placeholder: (_,_)=>Shimmers(),),
                      ),),
                  ),

                  //Cart Discrip

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(items[index].shoe.title
                            ,style:GoogleFonts.ibmPlexSans(
                                textStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,fontWeight: FontWeight.w600
                                )
                              )
                            ),
                          SizedBox(height: 2,),
                          Text(items[index].shoe.description,
                              maxLines: 2
                              ,style:GoogleFonts.ibmPlexSans(
                                  textStyle: TextStyle(
                                    color: Colors.grey.shade600,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),),),
                          SizedBox(height: 2,),
                          Text("\$${items[index].shoe.newPrice}",
                            maxLines: 2
                            ,style:GoogleFonts.ibmPlexSans(
                              textStyle: TextStyle(
                                color: Colors.deepOrange,
                                fontStyle: FontStyle.italic,
                                fontSize: 18,fontWeight: FontWeight.w800,
                                overflow: TextOverflow.ellipsis,
                              ),),),
                          SizedBox(height: 2,),
                          Text("\$${items[index].shoe.oldPrice}"
                            ,style:GoogleFonts.ibmPlexSans(
                              textStyle: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.deepOrange,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),),)


                        ],
                      ),
                    ),
                  )



                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
