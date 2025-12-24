import 'package:flutter/material.dart';
import 'package:shoe/HomeScreen/widgets/AppBar.dart';

import '../shoe_cubit/shoe_cubit.dart';
import '../shoe_cubit/shoe_state.dart';
import '../widgets/products_list.dart';
import '../widgets/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllProducts extends StatefulWidget {
  const SeeAllProducts({super.key});

  @override
  State<SeeAllProducts> createState() => _SeeAllProductsState();
}

class _SeeAllProductsState extends State<SeeAllProducts> {

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {

    super.initState();
    _scrollController.addListener(onScrollListen);
    context.read<FetchShoeCubit>().getShoesForHome();
  }

  void onScrollListen(){
    if(_scrollController.position.pixels>=_scrollController.position.maxScrollExtent-200)
    {
      context.read<FetchShoeCubit>().getShoesForHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
      title: Column(
        children: [
          Text("Available Shoes",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
          SizedBox(height: 2,),
          Divider()
        ],
      )
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
      BlocConsumer<FetchShoeCubit,ShoeState>(builder: (context,state){
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
      return  ProductsList(shoes: state.shoes,length: state.shoes.length,);
      
      }
      if(state.isLoadingForPaging)
      {
      return SliverToBoxAdapter(
      child: CircularProgressIndicator(),
      );
      
      }
      if(state.isReachedMax)
      {
      return SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator(),),
      );
      }
      else{
      return SliverToBoxAdapter(child: CircularProgressIndicator(),);
      }
      },
      listener: (context,state){
      
      })
      
      
      
        ],
      ),
    );
  }
}
