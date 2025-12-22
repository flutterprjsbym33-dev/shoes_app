import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shoe/HomeScreen/widgets/AppBar.dart';
import 'package:shoe/core/utils/catmodel.dart';
import 'package:shoe/core/utils/shoe_model.dart';
import 'package:shoe/features/banners/view/pages/AppBarBanner.dart';
import 'package:shoe/features/banners/view/pages/FetchedBanner.dart';
import 'package:shoe/features/catogories/view/widgets/CatogoriesText.dart';
import 'package:shoe/features/products/view/shoe_cubit/shoe_cubit.dart';
import 'package:shoe/features/products/view/shoe_cubit/shoe_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/banners/view/pages/AppBarBannerList.dart';
import '../../features/catogories/view/pages/Catogories.dart';
import 'BottomNav.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Testhomescreen extends StatefulWidget {
  const Testhomescreen({super.key});

  @override
  State<Testhomescreen> createState() => _TesthomescreenState();
}

class _TesthomescreenState extends State<Testhomescreen> {

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(onScrollListen);
  }

  void onScrollListen(){
    if(_scrollController.position.pixels>=_scrollController.position.maxScrollExtent-200)
      {
        context.read<FetchShoeCubit>().getShoesForHome();
      }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 8.h),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
           CustomAppbar(),
            FetchedBanner(),
            CategoryText(),
            Catogories(),
            BlocConsumer<FetchShoeCubit,ShoeState>(builder: (context,state){
              if(state.shoes.isEmpty)
              {
                return  SliverList(delegate: SliverChildBuilderDelegate(
                        (context,index){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.3,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Shimmer(
                                duration: Duration(seconds: 3),
                                interval: Duration(seconds: 5),
                                color: Colors.white,
                                colorOpacity: 0,
                                enabled: true,
                                direction: ShimmerDirection.fromLTRB(),
                                child: Container(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ),
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
                          debugPrint("Shoes length ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.${state.shoes.length.toString()}");
                          final shoe = state.shoes[index];
                          final imageUrl = (shoe.images != null && shoe.images.isNotEmpty)
                              ? shoe.images[0]
                              : 'https://via.placeholder.com/150'; // placeholder image

                      return SizedBox(
                        height: MediaQuery.of(context).size.height*0.4,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
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
              if(state.isReachedMax)
              {
                return SliverToBoxAdapter();
              }
              else{
                return SliverToBoxAdapter(child: CircularProgressIndicator(),);
              }
            },
                listener: (context,state){

                })



          ],
        ),
      )
    );
  }
}
