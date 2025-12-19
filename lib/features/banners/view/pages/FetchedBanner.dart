import 'package:flutter/material.dart';
import 'package:shoe/features/banners/view/pages/GetBanner.dart';

class FetchedBanner extends StatelessWidget {
  const FetchedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height*0.18,
      flexibleSpace: FlexibleSpaceBar(
        background: GetBanners()
      ),
    );
  }
}
