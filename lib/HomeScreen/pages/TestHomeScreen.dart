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
import 'package:shoe/features/products/view/pages/produec_page.dart';
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
            ProductPage()




          ],
        ),
      )
    );
  }
}
