import 'package:flutter/material.dart';
import 'package:shoe/HomeScreen/widgets/AppBar.dart';

class AppBarBannerList{
  static List<Widget> slivers()
  {
    return [
    const CustomAppbar()
    ];
  }
}