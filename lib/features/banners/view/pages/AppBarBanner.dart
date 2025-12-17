import 'package:flutter/material.dart';
import 'package:shoe/HomeScreen/widgets/AppBar.dart';
class AppBarBanner extends StatefulWidget {
  const AppBarBanner({super.key});

  @override
  State<AppBarBanner> createState() => _AppBarBannerState();
}

class _AppBarBannerState extends State<AppBarBanner> {
  @override
  Widget build(BuildContext context) {
    return CustomAppbar();

  }
}
