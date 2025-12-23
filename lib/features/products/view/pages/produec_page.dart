import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shoe/features/products/view/widgets/shimmer.dart';
import '../shoe_cubit/shoe_cubit.dart';
import '../shoe_cubit/shoe_state.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProduecPageState();
}

class _ProduecPageState extends State<ProductPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchShoeCubit>().getShoesForHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchShoeCubit,ShoeState>(builder: (context,state){
      if(state.shoes.isEmpty && state.isLoading)
      {
        return  SliverList(delegate: SliverChildBuilderDelegate(
                (context,index){
              return Padding(
                padding: EdgeInsets.only(top: 10,left: 4,bottom: 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: double.infinity,
                  child:  Shimmers(),
                    ),
              );
            },
            childCount: 4
        ));

      }
      if(state.shoes.isNotEmpty)
      {
        return  SliverList(delegate: SliverChildBuilderDelegate(
              (context,index){

            final shoe = state.shoes[index];
            final imageUrl = (shoe.images != null && shoe.images.isNotEmpty)
                ? shoe.images[0]
                : 'https://via.placeholder.com/150'; // placeholder image

            return SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
              width: double.infinity,
              child: Padding(
                padding:  EdgeInsets.only(top: 10,left: 4,bottom: 8),
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
          childCount: state.shoes.length,
        ));


      }
      if(state.isLoadingForPaging)
        {
          return SliverToBoxAdapter(
            child: CircularProgressIndicator(),
          );

        }
      if(state.isReachedMax)
      {
        return SliverToBoxAdapter();
      }
      else{
        return SliverToBoxAdapter(child: CircularProgressIndicator(),);
      }
    },
        listener: (context,state){

        });
  }
}
