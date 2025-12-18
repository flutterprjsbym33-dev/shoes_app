import 'package:flutter/material.dart';
import 'package:shoe/features/banners/view/pages/GetBanner.dart';

class FetchedBanner extends StatelessWidget {
  const FetchedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.30,
      toolbarHeight: 0,
      collapsedHeight: 0,

      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        title: GetBanners(),
      ),

    );
  }
}
