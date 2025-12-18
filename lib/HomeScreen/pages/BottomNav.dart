import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/HomeScreen/cubits/bottomnavcubit.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
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
