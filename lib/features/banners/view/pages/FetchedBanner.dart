import 'package:flutter/material.dart';
import 'package:shoe/features/banners/view/pages/GetBanner.dart';

class FetchedBanner extends StatelessWidget {
  const FetchedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: GetBanners(),
      ),

    );
  }
}
