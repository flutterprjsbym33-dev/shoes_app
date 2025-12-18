import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/HomeScreen/widgets/AppBar.dart';
import 'package:shoe/core/utils/catmodel.dart';
import 'package:shoe/features/banners/view/pages/AppBarBanner.dart';
import 'package:shoe/features/banners/view/pages/FetchedBanner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/banners/view/pages/AppBarBannerList.dart';
import 'BottomNav.dart';

class Testhomescreen extends StatefulWidget {
  const Testhomescreen({super.key});

  @override
  State<Testhomescreen> createState() => _TesthomescreenState();
}

class _TesthomescreenState extends State<Testhomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 8.h),
        child: CustomScrollView(
          slivers: [
           CustomAppbar(),
            FetchedBanner(),
          ],
        ),
      )
    );
  }
}
