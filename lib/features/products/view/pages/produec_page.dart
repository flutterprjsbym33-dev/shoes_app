import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shoe/features/products/domain/product_entity/shoe.dart';
import 'package:shoe/features/products/view/widgets/products_list.dart';
import 'package:shoe/features/products/view/widgets/shimmer.dart';
import '../shoe_cubit/shoe_cubit.dart';
import '../shoe_cubit/shoe_state.dart';


class ProductPage extends StatefulWidget {


  @override
  State<ProductPage> createState() => _ProduecPageState();
}

class _ProduecPageState extends State<ProductPage> {
  late final state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    state = context.read<FetchShoeCubit>().getShoesForHome();
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
        final length = state.shoes.length<4 ? state.shoes.length : 4;
        return  ProductsList(shoes: state.shoes,length: length,);

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
