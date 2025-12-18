import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/HomeScreen/cubits/bottomnavcubit.dart';
import 'package:shoe/core/utils/appColor.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      activeColor: AppColors.pink,
      splashColor: AppColors.lightGrey,
      backgroundColor: AppColors.grey,
      height: 45.h,
      icons: [
        Icons.explore,
        Icons.shopping_cart,
        Icons.message,
        Icons.account_circle
      ],
      activeIndex: context.watch<BottomNavCubit>().state,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) => context.read<BottomNavCubit>().addIndex(index),
      //other params
    );
  }
}
