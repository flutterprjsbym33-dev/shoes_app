
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/features/catogories/view/widgets/CatogoriesWidget.dart';

class Catogories extends StatelessWidget {
  const Catogories({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height*0.05,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CatogoriesWidget(),
        ),
      ),
    );
  }
}
